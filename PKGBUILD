# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
# Contributor: Luna Jernberg <droidbittin@gmail.com>
# Contributor: Jonathon Fernyhough <jonathon+m2x+dev>
# Contributor: Figue <ffigue@gmail.com>
# Contributor: Dct Mei <dctxmei@yandex.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgbase=firefox-esr
pkgname=(firefox-esr)
pkgver=102.11.0
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org, Extended Support Release"
arch=(x86_64)
license=(MPL GPL LGPL)
url="https://www.mozilla.org/en-US/firefox/enterprise/"
depends=(gtk3 libxt mime-types dbus-glib ffmpeg nss ttf-font libpulse)
makedepends=(unzip zip diffutils yasm mesa imake inetutils xorg-server-xvfb
             autoconf2.13 rust clang llvm jack nodejs cbindgen nasm
             python lld dump_syms
             wasi-compiler-rt wasi-libc wasi-libc++ wasi-libc++abi)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English'
            'xdg-desktop-portal: Screensharing with Wayland')
options=(!emptydirs !makeflags !strip !lto !debug)
source=(https://archive.mozilla.org/pub/firefox/releases/${pkgver}esr/source/firefox-${pkgver}esr.source.tar.xz{,.asc}
        $pkgname.desktop identity-icons-brand.svg
        0001-Add-a-few-missing-cstdint-includes.patch)
validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353') # Mozilla Software Releases <release@mozilla.com>

# Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact foutrelis@archlinux.org for
# more information.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM

# Mozilla API keys (see https://location.services.mozilla.com/api)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact heftig@archlinux.org for
# more information.
_mozilla_api_key=e05d56db0a694edc8b5aaebda3f2db6a

prepare() {
  mkdir -p mozbuild
  cd firefox-$pkgver

  # Fixes building with gcc 13
  patch -Np1 -i ../0001-Add-a-few-missing-cstdint-includes.patch

  echo "${noextract[@]}"

  echo -n "$_google_api_key" >google-api-key
  echo -n "$_mozilla_api_key" >mozilla-api-key

  cat >../mozconfig <<END
ac_add_options --enable-application=browser
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd
ac_add_options --enable-linker=lld
ac_add_options --disable-elf-hack
ac_add_options --disable-bootstrap
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

# Branding
ac_add_options --enable-official-branding
ac_add_options --enable-update-channel=release
ac_add_options --with-distribution-id=org.archlinux
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
ac_add_options --with-app-name=$pkgname
export MOZILLA_OFFICIAL=1
export MOZ_APP_REMOTINGNAME=$pkgname
export MOZ_APP_PROFILE="mozilla/firefox-esr"

# Keys
ac_add_options --with-google-location-service-api-keyfile=${PWD@Q}/google-api-key
ac_add_options --with-google-safebrowsing-api-keyfile=${PWD@Q}/google-api-key
ac_add_options --with-mozilla-api-keyfile=${PWD@Q}/mozilla-api-key

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss

# Features
ac_add_options --enable-alsa
ac_add_options --enable-jack
ac_add_options --enable-crashreporter
ac_add_options --disable-updater
ac_add_options --disable-tests
END
}

build() {
  cd firefox-$pkgver

  export MOZ_NOSPAM=1
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZ_ENABLE_FULL_SYMBOLS=1
  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip

  export MOZ_BUILD_DATE=$(head -1 sourcestamp.txt)
  export RUSTFLAGS="-C debuginfo=1"

  # LTO needs more open files
  ulimit -n 4096

  # Do 3-tier PGO
  echo "Building instrumented browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate=cross
END
  ./mach build

  echo "Profiling instrumented browser..."
  ./mach package
  LLVM_PROFDATA=llvm-profdata \
    JARLOG_FILE="$PWD/jarlog" \
    xvfb-run -s "-screen 0 1920x1080x24 -nolisten local" \
    ./mach python build/pgo/profileserver.py

  stat -c "Profile data found (%s bytes)" merged.profdata
  test -s merged.profdata

  stat -c "Jar log found (%s bytes)" jarlog
  test -s jarlog

  echo "Removing instrumented browser..."
  ./mach clobber

  echo "Building optimized browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto=cross
ac_add_options --enable-profile-use=cross
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END
  ./mach build

  echo "Building symbol archive..."
  ./mach buildsymbols
}

package_firefox-esr() {
  cd firefox-$pkgver
  DESTDIR="$pkgdir" ./mach install

  local vendorjs="$pkgdir/usr/lib/$pkgname/browser/defaults/preferences/vendor.js"
  install -Dvm644 /dev/stdin "$vendorjs" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable extensions in the application directory
pref("extensions.autoDisableScopes", 11);
END

  local distini="$pkgdir/usr/lib/$pkgname/distribution/distribution.ini"
  install -Dvm644 /dev/stdin "$distini" <<END
[Global]
id=archlinux
version=1.0
about=Mozilla Firefox ESR for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$pkgname
app.partner.archlinux=archlinux
END

  local i theme=official
  for i in 16 22 24 32 48 64 128 256; do
    install -Dvm644 browser/branding/$theme/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done
  install -Dvm644 browser/branding/$theme/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/$pkgname.png"
  install -Dvm644 browser/branding/$theme/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/$pkgname.png"
  install -Dvm644 browser/branding/$theme/content/about-logo.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dvm644 ../identity-icons-brand.svg \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$pkgname-symbolic.svg"

  install -Dvm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Install a wrapper to avoid confusion about binary path
  install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<END
#!/bin/sh
exec /usr/lib/$pkgname/firefox-esr "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/bin/$pkgname" "$pkgdir/usr/lib/$pkgname/firefox-bin"

  # Use system certificates
  local nssckbi="$pkgdir/usr/lib/$pkgname/libnssckbi.so"
  if [[ -e $nssckbi ]]; then
    ln -srfv "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
  fi

  export SOCORRO_SYMBOL_UPLOAD_TOKEN_FILE="$startdir/.crash-stats-api.token"
  if [[ -f $SOCORRO_SYMBOL_UPLOAD_TOKEN_FILE ]]; then
    make -C obj uploadsymbols
  else
    cp -fvt "$startdir" obj/dist/*crashreporter-symbols-full.tar.zst
  fi
}

_package_i18n() {
  pkgdesc="$2 language pack for Firefox ESR"
  depends=("firefox-esr>=$pkgver")
  install -Dm644 firefox-esr-i18n-$pkgver-$1.xpi \
    "$pkgdir/usr/lib/firefox-esr/extensions/langpack-$1@firefox.mozilla.org.xpi"
}

_languages=(
  'ach    "Acholi"'
  'af     "Afrikaans"'
  'an     "Aragonese"'
  'ar     "Arabic"'
  'ast    "Asturian"'
  'az     "Azerbaijani"'
  'be     "Belarusian"'
  'bg     "Bulgarian"'
  'bn     "Bengali"'
  'br     "Breton"'
  'bs     "Bosnian"'
  'ca-valencia "Catalan (Valencian)"'
  'ca     "Catalan"'
  'cak    "Maya Kaqchikel"'
  'cs     "Czech"'
  'cy     "Welsh"'
  'da     "Danish"'
  'de     "German"'
  'dsb    "Lower Sorbian"'
  'el     "Greek"'
  'en-CA  "English (Canadian)"'
  'en-GB  "English (British)"'
  'en-US  "English (US)"'
  'eo     "Esperanto"'
  'es-AR  "Spanish (Argentina)"'
  'es-CL  "Spanish (Chile)"'
  'es-ES  "Spanish (Spain)"'
  'es-MX  "Spanish (Mexico)"'
  'et     "Estonian"'
  'eu     "Basque"'
  'fa     "Persian"'
  'ff     "Fulah"'
  'fi     "Finnish"'
  'fr     "French"'
  'fy-NL  "Frisian"'
  'ga-IE  "Irish"'
  'gd     "Gaelic (Scotland)"'
  'gl     "Galician"'
  'gn     "Guarani"'
  'gu-IN  "Gujarati (India)"'
  'he     "Hebrew"'
  'hi-IN  "Hindi (India)"'
  'hr     "Croatian"'
  'hsb    "Upper Sorbian"'
  'hu     "Hungarian"'
  'hy-AM  "Armenian"'
  'ia     "Interlingua"'
  'id     "Indonesian"'
  'is     "Icelandic"'
  'it     "Italian"'
  'ja     "Japanese"'
  'ka     "Georgian"'
  'kab    "Kabyle"'
  'kk     "Kazakh"'
  'km     "Khmer"'
  'kn     "Kannada"'
  'ko     "Korean"'
  'lij    "Ligurian"'
  'lt     "Lithuanian"'
  'lv     "Latvian"'
  'mk     "Macedonian"'
  'mr     "Marathi"'
  'ms     "Malay"'
  'my     "Burmese"'
  'nb-NO  "Norwegian (Bokmål)"'
  'ne-NP  "Nepali"'
  'nl     "Dutch"'
  'nn-NO  "Norwegian (Nynorsk)"'
  'oc     "Occitan"'
  'pa-IN  "Punjabi (India)"'
  'pl     "Polish"'
  'pt-BR  "Portuguese (Brazilian)"'
  'pt-PT  "Portuguese (Portugal)"'
  'rm     "Romansh"'
  'ro     "Romanian"'
  'ru     "Russian"'
  'si     "Sinhala"'
  'sk     "Slovak"'
  'sl     "Slovenian"'
  'son    "Songhai"'
  'sq     "Albanian"'
  'sr     "Serbian"'
  'sv-SE  "Swedish"'
  'ta     "Tamil"'
  'te     "Telugu"'
  'th     "Thai"'
  'tl     "Tagalog"'
  'tr     "Turkish"'
  'trs    "Chicahuaxtla Triqui"'
  'uk     "Ukrainian"'
  'ur     "Urdu"'
  'uz     "Uzbek"'
  'vi     "Vietnamese"'
  'xh     "Xhosa"'
  'zh-CN  "Chinese (Simplified)"'
  'zh-TW  "Chinese (Traditional)"'
)
_url=https://archive.mozilla.org/pub/mozilla.org/firefox/releases/${pkgver}esr/linux-x86_64/xpi

for _lang in "${_languages[@]}"; do
  _locale=${_lang%% *}
  _pkgname=firefox-esr-i18n-${_locale,,}

  pkgname+=($_pkgname)
  source+=("firefox-esr-i18n-$pkgver-$_locale.xpi::$_url/$_locale.xpi")
  eval "package_$_pkgname() {
    _package_i18n $_lang
  }"
done

# Don't extract languages
noextract=()
for _src in "${source[@]%%::*}"; do
    case "$_src" in
      *.xpi) noextract+=("$_src") ;;
    esac
done

sha512sums=('fdfed404c87f33001c0ab50f9899fa80c897fac645be8ed832e426f412aafbf1468b1c8301bad463b3f5535b6d6f2005a96a748b6e2d6bf5afbc3b5bc10983d6'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '3e05c6c1c415f013c31c6ba90c593703a0017bc1057867bd3c8de308ded14f4c0a38808aae2365dda31f03cefcf10eeb3d20a9b75095bfcd698f786def348f32'
            '3e1db667f60f3b7e978ff5750a8a873aa654141eb4181210c900f3c3a4e0181ef52d4eaa1aebd2f88641ae164f71d4e7bc5fb474c8970b6c8e77844ed48c2176'
            'de524c3d49447c975985154583c6632c57773509049ccda359b550a23867fd9c77065f5a6e64a8f1a46e0e899a8bccf2c3a8aadf836887063001213a651e859c'
            'c16e60ad78cd6277fb19824aa26ba454f713aa857ba38afb0c3c09bd3e7c01d1c7c7eef2bbf1cf8c11bd96b53810c702fc405a8971d1ea0049283b3d0561b060'
            '8f4cc6629043f0eab0aef0f60c64714c9db56e9f697f0863b7cb8283fefd7cceeeb9999821b82c34f89568706d68ce9335b358a2179c5ca4a3ee380788f38c88'
            'b03a86c9e812cd51f9ae7bae78db9c92a90961584d7fd0c74207901f34ffba7cd86330aee2cccd046818989e94f6d997dd9e85221f0c3bdde0b0b732bdecc239'
            '395c83c5746629e7ac7dcd6e893fc101352a40544450ebbe346ec510021eb42593976d54f6477e44b80d9ec75ca50e7e0d4c5944f51aa3f1b7d27ab2a9e5a324'
            'a330c64901f1aaca4de2dd42fe47a82d64abec9d45229ff1b378172c67ec1ba532da7c7f30d46783e206f85ea15bb07bd9898a7b46f4cb64a8500c3d69bb7360'
            'b820ca3d7d63f89740b6c617a9f0e53486996a85083be4d237200751d5a643361a1d22b464905d335738f2a128990aa3e0666e1948539e9b251ca6b694147e8c'
            '16b7f24e44c6f82fb6ecfbf5fe6c49b6bcefb421f7cbd9c6053ef91c7f68c903e4bc1c56cb3e4db1a60e3440479a8a50ac30e60b6bfc2e5a9d6ece11d2371d4c'
            '719b3faaef21bbf7e99e2241a29653111beebdf6cf427d6b83d8944fdf5ddbd8117f958c4c3f621f7ebfd70cfdc4b578ecf32d3011ef226eb9f799dd135d4335'
            '32ffa3197792f49d9df249a31dfe8ce26861d4995533feb71f83394bfbd4b3dac6751eac0a9c5c8a1e3c3733e937455ba502a77c20417e3b7c99021a5b1223cd'
            '365722a3603074ca78d21ed45368d270131d035d66b3b7a5ac68f1933f67a1f48ab57c8c4a320a2aa8235f51f50d58fb4dcfa08bdbed4c5232b560442b6923e3'
            '41980096619e1795eccf4adfbe76882cfa2420298188d046a7ba0b895c592cef0158ef23916ee4e0d21ece280a4f769a8b4a16e1db1eb9f1413f43c5db5aeae8'
            'f520ce64ba71e9844a17ae9c5e21a61b45fec50602f753a9e5f283ca05ff8a29400653336cbb28977e544ba7ebb3e1242a9feaa88316fc5038b7928f4bc59608'
            '009057c0eb6e2cea23f3fdce51c6bebb53034176139902a5f4cff77915c5420f5bbdee928a851d8c5a3aba2a2181916ae76bf8091c76de507b76ac6780234f8c'
            '4758ce4e92bca727f8ed2e8651358827dc47deaa682e1992434a44e21b05eca7080a6c223873e495e55af44fe69dd82fe603f3dde52039197a3a2f531f150e5a'
            '6f1bb0037f28804a8d16c8b1ad9dbbde4b4cdab7cb189d9109e3f46d2d15cd90825cc258d6722b30d56403008715d9142aad6f4ec23ef110882510aef88f9ae1'
            'a560ecc3392eebb68ae12091f90cf165afe2ae5860f7a1cac3ef8f6d4ccd19250ba273b5a081668405fab606cacebad9118490ea79b81258b81ff1c72af006e2'
            'f5bd89306e79974448f9691ac8aa574761a1324a36d538a62096c4f9b5fe66353490bf1767bfeaf2a4c14c855892dda32b3bdffbb70346d85b6e92800b8a63c3'
            '0cb2797a8ede9a24324fa0c85ac554c283d3d807e17ec77e50dce31bae325956095dd8462b0f897caa7df7c7d6bac5e1916ec255ce00496d5ea73bc9442551c3'
            '6548b8df81d2ce3b06c4748e880173fdcbaecad90ab1f15964dfe4b479d31e221faa2710bbc50bdd4b4ce825e79a09d123752a71f65984e7faeb94ff29e86e13'
            '6781864dfb449552e3ee0da79852d5da69d8e5231c3e13b4f4984246e458d0b50aeca2bbb804d8a9e9d444a38937308d6adb9ec6994c30ea4043512c989dd347'
            '19f1f0a1ae10438835ff0b418d8f6c99234ae73fdf75adebd271e855804042b694854152047aa9a626e4480000023171b5053992f415cad61f673900c2475781'
            'a824d772487027c12365e8560befa57cefb17b1d042cef33de46a6438d493a00ecde5565f326a5223643d0c799d107c00474b36b3b1bd33f0b9de6d0f2b3aa8d'
            '18879aeb617f2d50d8103b3cf0296ab45846519d2663323e3130ef16b4891294f07bcfd9b75411f5d96112d1aa88a597b75718ca3f5c796bf2d8cd9605ad244b'
            '1c656518e34379a3d09f8d2b2c992ffed2702471d8f94899607579a3b1ef72d5c6def7d17b5f09254caa18a3b7322620ebdaf1c6ecbcddf9ce2d80188e9103c6'
            '0a5bebddc6104d58f78633732b6cdf2587ecf281940f33ddab277464cc176d87c158c1277a7dd36bad14571d45554585e59423aa61e25d37e7e1e1f35a9b47b7'
            '8c4664def2bb1ee3db8859db86bf5ea815815d556fe348d73fc9633822d12924260a49d0e7dc089d8fc1c017655fba50b9c9433b20fbe5a36e2cde9fd77c06cd'
            '16f0ba519b5c97dd7a024f2f11b662fe839008e3717db3a2fd240c56b3c8bc187fbfafe5f5eb3f1b1d2529a657e0bb5bb1771c83aa2b185c7af3cc16ce40d342'
            'a4f777dda7f4e860aa00f5d64378bc8099ef491e64ec1814cc1c2c7b23ffba38f6af049b288780f4b9d895565d65236858c44d5e22d4765d83ea1eef88a3dba0'
            'ede719e6f2659bf04e7a2468f61dc147c4c20b79945e44f4bd67bd1893ac78834a11d43cb36649c79e3428d9963ebad7ebe697797e3e19a745b7e25d73159c6c'
            '60a0da9234991d19e6d898b01f9eabff560d3d98e1690ab5e286d3ca82bd1babc45744f9f26f55832ab38c2b3bda8d72483216ad9a007a90621089ae9c853638'
            '911c57a3f94cebb5d991d3b115654cc4d324cd03c53deec9b579a5118063ef8db665c6e6a740ef19bf853d6316617bfd81e04f0061ad282823caf47be80fe66d'
            'c35da5e8b633d53fdd602cfb411bd3b623bc5259cf5385a31b6429af75b98e74449d3813cfe0f5b9c33f39b1ac90e2ba76357464e8416ffdde07d0dfe9802898'
            '53d866c0e493913d0ae36db66d5c266dcacca10061bbf8257e9591150f92ce4c2d0922109524f9b19432886890f0fd82e20efc6fa290461b3342f4f1f246ea03'
            '74f6e0336de66f88872676ec2cc182deac8b6dd42d97e4947de63da0709a821a4aee3b82c258e066e2071457f9007275f48c2c05d236ed978e4c9f7f25791320'
            '0e04e35e5249b47ad2046bc016347354033dd4fa593ef9fd0c1f799687a90c7bed626ba6d637156c48cf7953f4b308ab19789b3e88f42e026007565732e53f26'
            'd224f6b9d88318b5b884ca6674735255e38b2a55dd08e284c00882ddd008b6f9a8e10cf51a27084ffed95766d78f76325b522409346dc8e7568fe2ed3601b93a'
            '8c2cb7e4cf23e0b7c0619086111e67e64a7d8fbde0552313fc5a30a740869c62d233486beaa5fca975a0a8aee2209e94d6ef918b39bb659097976e9e57b32e5b'
            '1250f7718f8ebc6367467b2a1ed340624a6c776063eeae89fc74454919df02fb17d95857b7b6a8b79555356f02307c353c46320845713005584095b8627bf448'
            '0c7dfdafaae620f6d48f2f58c015ecd8b09c02897fb8b2dbcd68fda521dfb9a8336f73c11915517b7725b8c6e01bfe7fd59a44da03a336f689af82d8f212cfc4'
            '384a54c3af0a4b975f77f2abcb88be30811e92c09f8c71cb477227b3d020d31b3c0459be353b76ffaaa04f12c2f991b2c1f1a8abcec73ef8a1d6f4b165154f32'
            'ff4ec22f74336f61d4edd9409bf0c893403636302179a21fc5b59c1c242dcd6b748de6f968d5fb6faddd24d3dee58596554d44a1d1b3f1a8836349e452470e8f'
            '46c46a7f43d585722ab3515aa1bb56462d75e7496fed030106328cd91d9d3bcb6eaef9ba16b7011ed8b534762002d9f54eab96d9d603c9074d708d099c093b4b'
            '0d1362074226cb5aa25ea1056e18af6e19cdb3d0b0bafaa19f68dde8ca7f416113bfd874261f97287d21b71aa65100655be7d43024363440a2f4976b07889c3f'
            'de758a1abb0aa8d72e78e3ad44d8d3e8d2117db166107f356cc5b7aa4173aa1fce1b4d512e68f82068a06b7b0237dfa93b5cef62a7569c01cb78bfc420c193c3'
            '0ea13db52f7ae387b362767b0b8122a88705263486edacdd842a1d755d54cd57f5b4d5ab4f97830936cda3f7b39dd09f5ae6bed9d175051c1b7b0f4131ba2272'
            '6b9eae18fa4a727bcb172d127500ae161a03561de75358a524d53301190b56b6c8de975302c458872800b30a519549fb5fa8cffd3f88fa887b4a458fb71474f3'
            '8c6360c50a8abc1c521e4dd24379bd141fa314150533d2eb9ce98bd4823808484cfa4ac319b3f25b84bd51f8b2faed057a36ff94fa63bd6ceccc3eba9ee49c1b'
            '4e6e53ade05e9fe5adec71ffee8f5b5d263c9ac3423df8446af5691cf315489b7e64922e0bb0f47c110104b4d16b2795e25f1c86d545737c134b433c2e3079c3'
            'f3b91b6ddff723fbdc068cfaab9bbd9129b70b48dd88e1f92e6c43455c412ee84d48cd29efb5df47a48e9d8f12d5ad4d66576cb3f4832384717c26cdc39e51e7'
            '261e5d2859d56b6a5cde06ea16db0566548eac4ac0019d99437f7c396a3e78af1974cd416120beb6e341cbeaacc7a3ab6a784c1bdc6d95c5d6cf1c34417c170e'
            '6e6a00f5c32e0ab6aff02db29c152ce96ef48b254242a98ff2ff32ce670c9e08bf3ef7b0a005f530c82d3d882a8e35aacb5d114a883ec1a21b960c6ed428be3f'
            '1af489dfe96a2bdb3e8f25634810a08a6771219f2b3a60db03ce0173795e88d9c1a0c8d839df0823ae0386d150f8fc0c236a0e077c2779b7a5a8f0885cf95a91'
            '235ee38b0e05670613dadd512465db0a2e74ae2589540ecdb840c3dc4638f737659e398e465e5109792d71bb5941ba4fadc05b8ef5d7b401a0d5990af5e87478'
            'fdb977538c5920ff5b4a09b4b33f8e43a008c39c2bffcb3ce3faaecca17dbba088c34f78eab2da2479de128ecc99daf3f4e86a088520f84b9d5a92d66641df54'
            '9a2e4f2c903c744bdd6e78deb3e8960369a6c5526e57778f9fc700911deeb2a2fd217553fd45e0ea2de89e4214445c03099e27cfa33dc25822adde6604c5de04'
            '22d6172febcdd2e4facd2077ed99530530172112c1728bff74b0695f313b19a95374216fb6bbb2ab3b40b22880e2a5edffc3c4610327d199149abba90fcaf4d5'
            'ceec7d56e3793174f58c239df1a94161e842af367b32d76d87de71abac73a74249dc1b273f9afc9eda6b4855496fad65ba21f52176161912e92e0adc5a9e7c11'
            '8e6bb583d4026ea0a371996b4989340fdae68a0455988362aacb5b55d91e159ba7cbb1326674747c0e1e245f48d7fea50af9e98ac373f5e6c9a8f5ee1e0f865f'
            'd531ae347cfc41172bf140b86da60e8462a423fe4497fae3b333f58f45e3e137a26b77d7a61247ab466d64ffe1a9f23c1f140c34c483635e07b0e125c353c8bb'
            '59430a1d4065a1c640bb4064f70ea97b28d5fbd8a13947e4bf2492ad39243312c79aec03f15a9c75815abac1d56418da9da1107537e84201e8287801210908e8'
            '3822e53f7280f5b1999cbebe68ffe96c2a94a5855c50b5e0d2a0d9096d6fa9a7b7900d07bfe92e76abe4d68b62f8278c45e3258c796fa297fe212a4449925ce2'
            'e2042e8a0de476b6f2319892e123a957505201f960355f3e8fef6fe46f123a1c5d45da75154b0ca3a175d2547277b0ee7c0dfe34f2f7a1d1bdf8839dfab46ffb'
            'b9237530d23e67b426fd63c1dc5037f0238d1a8b941fea9c110b202ab7e9e8af76e5d04f5a983d692615c70c4b14bff2f70bf4b626d72cd85852308841d02cad'
            '596588971036231a93e2bc1868f1e7100eb651b0ab8b00d3d446fc19e026f7d862c99b74ef912cda961372619b03eaf96abb68da0ebbef69be71580753cf28f0'
            '6df89da516584880cd76b7165cabdd0eee29cc8748695d1966e322888a405fa0092e0b46ab03f652850bebf1ebae2a48e589a49bc13b71dc934196340cf3f928'
            '2074f6a2bfcf5cfe60564a8b9af1dbae5a81fcc9ccdb00f5942a4920f5fa6ad61912e3f17a634c545c0942b125e613cbd1cbec23723af4a38a8e0a5090d1e894'
            'bf17136cf2344f482a034457bace8e960e42d42771d805ae0ee58cdc8a4742d63b77584100cbd008b962155ea1e7edc0589b0fd7a8f30e8a1eebafd7cdae6055'
            '8c5bd4e5e57385956b0b25c2539ce45e2a35b1bb682314f50bb8d18c38deac3e342fa503ee68ded7f16209bae3eb922580f8d2074c7f6a8dba1d4b91e6080573'
            '2965d0d85313e7ee657c27364237af40cfb25e176d72767c257bf74c0da4539ff9a162f9a30ef3231628b15b83e3d85b855aa9fb87e670a6dd58846094903980'
            '12df42dd4d7e868221a9388dc7c9d321e8830cddb3f819305b309c8c14c0ba09c5348e26befa26a67876bd09aa0284b65eec3d8353ff84424c07aa5da0c985b4'
            '9c7ee46c8625caad435baf0f6dea162f9104a182d68a1d32f483512b0ba335aed7e77df16a7d8539bc47ac798008db149d50015ba5084049eff87bd653777afd'
            'd45b20e88c65ca592bebb376dbe021095c6543ac11b648fe48c4320adb361161bfa035acacac4e5a9a0fffd48dd4ecaadab6183e61e9cabca28a5afef9c5eaed'
            'eccf2a436a23e0cae62532991b5535a747d18a8446561b3a84692f4a6bf362921fc3e05a63f58ed8d38f2f8e1fd02eb5d2517b65580aec6efbcc0997484fa665'
            '52150b9fcbdcede199de1c4718222060cd00145c5312154da4434fd511e935359912ac6d50c09ef1cf72efd14e5ad4d0b18f4db694b9070dec56fb4dc2955fe3'
            '3157a6fe917fb15e5c18d1d1162aaccbe2d3088b2e6426dac06103980fbc1a357f57d1f2108470b23785251baef3df6bcf3609880597c0e270b1fdc773819249'
            'd8ed109bfe71d2d5fa15a3de40858b57f769dfd545f5e88d91dde488c0acb2d1325c4cf5de7e9288767b4f7f8c9fbd73060d647f87f14716a6704f0ecd622df1'
            'fa5fb5e5687d94ebcfe13a65b5b9bab88b6cc54799b466a3224fbc0dbc5c933385d928f63f6741d391c1bd11d4707736bd54acee4f78d5b79d8d377c371b0de4'
            '64fc74192cb470257e24f55ae5566fa3b55342cc98e23409ba5036e08dcfe0c60252eff996eb559783ed9931966ec0000fb1a0db603c92b31962b97d18ea8224'
            'e1d0d41f4f48aa614f0167c6e43616a0a6f6bb3c60390462f5a7271a3359a3e05a52ffede6aa55c8615dc1ac729b97ed05143a41f33f4ae1b1d199ecfd4d99c6'
            'c45a26492b56ea601f240dff48f3ab6de9a1eed719bf1c58b1282f61d33024bf705899b9533d186f0abed16500b00d1ac6216567ebe823261f748e3597f4aff1'
            '53988073825f39d40cf86b6d7c733239187ab6d9cb94a21c41b521b4a5c3f07ef9fcafdaa3084cc6ea7605469ca14a49645a0c76ce635a6c3412a86dd4a8c69f'
            'e63cf83ef5da4b6e55d70004b5375a6029e0342618b4f8ba78b3123522db82b5612daad15110ac1f771b5f640309a9528f80ab89af92f57bb0215e0dabceb438'
            'aef53e551f1344ff50d973cd7fb0655c49d9eb1894c6649bdc9662424679839bafab6a315dc08781de7ed45ca9e4111be677c1627706a15ec33bda1e71d64a70'
            '2e47db0c2ab7817890093b140f68a825dbbe46034a7a4477e8cca9a1f68116158c48b2c3a8401460c8718894febe27e0ee6213362ad6ab9584397077df748526'
            '3f03d2b4e66ba10301612feabfc1b0376bd71fa1d6dba1fdc6faf9b5fa80feffca93c1d91b7952637739577b0b5a421401792a5760bdcbd80c2048b4c9d85573'
            '08b39c9591f5b38bbf6fe31b31ae360ca478cc5d73032c2fdc0728a5d610555415b90e2be0a4051fc03b4f8f38aa57d8a04d67217f91458877ea595078881808'
            '9ae7b7215e4b17fc026fb71b2b4f714f06824efbd896c29763ac42bd3e3cb48962cf505a7088bc2c2eb7da232b2f3025c44e36d5e2cf9c5045a42c67eeb73a19'
            '8cc8c204bf644388bcc18ce5ba4351772f673cbf1dd85754a013bb6b215a06f3c0644496c1615a194b86c7478c2346c2bf2212e5427d0cf2893fd67f6866fa80'
            '42bab53d1ef07a8af1d9d6b422c81f3fba936e04116f27c5f5e66efa982f8e8812c52a873e703326148efce9bcc36e2e65af030184d74cb354b4ec15e64a19b3'
            '199d235147a602085219ac4f315c9e21746bd7307596a87d01e0254bd5b5ee1ed28be11bef7c64f720608fe1ec2873acf599a78caad35c31c9290f5f46c0f0ba'
            'd2c5468b04c4494ef997c90904e840b0cfd7af7f87798bc5b3dfe1c935ce911bb0ff7bc7e8c82c1b41fbf50c69066aaba39b41db46ed4f461847c32a36d95196'
            '09753253e52b154d184cf50fb3009e4df936ad5ee7a44dba3baac52212b73ea7e1cbaa18253c634fed6540e9f4235e0c0d49737f355cdb6db3adcc99ed92d4ed'
            'a0b4d9529652382f53ba1441d2c01823308c4344dd6c140a7eb6ffd8bd11d00e3480949566d537a4f677ab8a42cf7d888b8c0f2efdf777fe128e5f91977e0590'
            'c0ee2fd55ae94ef308df940ed9599fb8e4078a957cd1b8d4e0200401d911e8f746bd02da856316112dd037a51cd9f1a309270eb94fa6fb95bd179421db26b801')


# vim:set sw=2 et:
