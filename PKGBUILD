# Maintainer : Luna Jernberg <droidbittin@gmail.com>
# Contributor: Jonathon Fernyhough <jonathon+m2x+dev>
# Contributor: Figue <ffigue@gmail.com>
# Contributor: Dct Mei <dctxmei@yandex.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgbase=firefox-esr
pkgname=(firefox-esr)
pkgver=102.2.0
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org, Extended Support Release"
arch=(x86_64)
license=(MPL GPL LGPL)
url="https://www.mozilla.org/en-US/firefox/enterprise/"
depends=(gtk3 libxt mime-types dbus-glib ffmpeg nss ttf-font libpulse)
makedepends=(unzip zip diffutils yasm mesa imake inetutils xorg-server-xvfb
             autoconf2.13 rust clang llvm jack nodejs cbindgen nasm
             python-setuptools python-zstandard lld dump_syms
             wasi-compiler-rt wasi-libc wasi-libc++ wasi-libc++abi)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English'
            'xdg-desktop-portal: Screensharing with Wayland')
options=(!emptydirs !makeflags !strip !lto !debug)
source=(https://archive.mozilla.org/pub/firefox/releases/${pkgver}esr/source/firefox-${pkgver}esr.source.tar.xz{,.asc}
        cbindgen-0.24.0.diff zstandard-0.18.0.diff update-packed_simd.diff arc4random.diff
        $pkgname.desktop identity-icons-brand.svg)
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
  mkdir mozbuild
  cd firefox-$pkgver

  echo "${noextract[@]}"

  # Unbreak build with cbindgen 0.24.0
  patch -Np1 -i ../cbindgen-0.24.0.diff

  # Unbreak build with python-zstandard 0.18.0
  patch -Np1 -i ../zstandard-0.18.0.diff
  
  # Unbreak build with simd
  patch -Np1 -i ../update-packed_simd.diff

  # Fix arc4random
  patch -Np1 -i ../arc4random.diff

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
  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=system

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

sha512sums=('06d753867ccfe1b2c79148cc60bc816b47a2abfa98219808868e9028bef1763d982ef7012698d06b8959cce79163d7926baf5f9d5ca9daa18c51fbf0efc59993'
            'SKIP'
            '3526402ccae1f0428f2e45bae8d0b2cb909ac2698bc3508b692b827839ccb21203ce414206039776f6ce946fc53e636290b7870e9886284d5e9d1e8ad050aac9'
            'c949cf492bc93b6f3f1f827744e0f39e555c518434c8e73e27143a769b0d123fe4ba2cae07b7b7e7b594f8da43383d4fb4cd28b6b52e0d3e7a985afbadfb3d04'
            '1377b852680667b378ae97e073149230067ad2dc03e4dd53ca59239e6f8542156c5e27239504a0540f0b1254fc9e43c93cf2575ba0bcfcb2ad74f37bc4961c5a'
            '9cbc214c3ae7b93ef6c0573194dc7600dd0b4bb6f2653693d75b08475b7c3d65f6a181055060848143b488207c39af3fdb7382bb45de5264b2daedcb62bf97f2'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '7845c5ff08d5393c84977fc53998b3fa85f33375eab75d5fe58a83b7baaa4e437908bbb87b26c25015b8a4f924edf8b03b8e2fc9977d60ae2ca98c813e2a8eac'
            '45cb00b40353169e8dea93f812bbe012698a2ef99cc9ba80e5f192ea0848e34bef4f511ed409d7a0c94a456a7315e0ea3a39877029bb05dd1c2e5b5fc536c60e'
            'aae8ee12e58888e3246918233ba2e08c48725e4d7d6fe6c2d8e3def23f34d0426211d7a8c144c8b936d3713456e3f510e4a0487922e7527df55d8ca1155cc978'
            '4d21f00d42e37953982199fda14d24e608b14e26cedf08331f7d0d07f3b3e872e5490b79067d63ec23b795a13caf2e5cfe55dd30c9b2b1f2ce8917b59374f0d9'
            'd36ead76b77dbe37d886e66774a53c04411cb237441ecbcada40c4c08e1ca0303766f7eee1c0b63e15ef3cec63ecbf330c914ec90b895a2a8a059947c5758d6a'
            '18f471be51f02abec75c7b67b16cd0493ad0afe36f6176c57ab002b073435d2fff072880ef44535a3f3f42449ccc3bf160b09f711d167d4a7befc9c5987f676c'
            '53f98f38405e3dbcdc93c7cb616b1272451cc1d588604fe5e0a888e7aa5c8273146de556a3662fb50b516ff15efd85f18c42ec10e85f0b68c0a0fc040b1a7685'
            '2998c95d8497f999dd958564a596172d9b223f29a764b04d82d7336f7ad6626ae217e1c9f3c152472347823cd4e718d4837fc96c5b536f9f2f1056ae1123713c'
            'a26bee769ecc8837c8da89a9047a81d4c6a5e4cca1ff4fcf687b7a36ad83802bc91ce983c1a12169c08fa6f843ecefb72c30ac40fd1b9eef443e1b3c3b30adb3'
            '20db78bcf2e3cd78492b04d4641e9a22809cc6c86e29a623227a54af9bfebac37c6be6b619b707736ac5f8f31a59889ba524989c9b60a0f24e21a1c6a8e02925'
            'c48931f47512d4b2c3668c8a175e8738d254361acca7afdb4dcce526ee429b0858a39b8cb1b4947c1c30fc60dffe2f61e72ddbe7eba05a57fd2dc379f32f22c9'
            '8c7efe3791efdc847cf0071d72111b57a2fcced960309a55cd30f7e804458aecd5614fa77e98d8e46bcc582cee005588531c5446d11f2b53efe8899e51cb2f1c'
            'ab3e7bd92b04f458942b959ff9025ba899623a9ad51e56b3b7a8c7e3d1f60fcb83cacfd03fe11571836cfa329fe055bebd6f45b4a2475a1190622736a097be15'
            '833b93b07bd732c4a21b63430e4520bc36008257e253fdd9f3289c171c5c033267d30d7fe7e2905dc2dbd64469d7c37e4ce081f2368e9ce8af9333ddd0c33e4a'
            'f1ab9f205eb3859c5b2ac1a4247b6df8e626213ebac6d746f53a4912f9280165b28922fc2cef93f104f8cf318e3b9f7c6ebb5a2806846e0171d72f2ea9852fe7'
            'cd3b6bf72ec7dac40868f5cab69c63c23a6d0f0aa89a653584eb1d7e61b792d767410399718a415f96c8d0caa134e99c8982495b95a8e81915c297c390915d69'
            'd1bc8f217194f38467b4a1167151fa110bdef55e1440efc7e0fa21af7b7bcfda613f8ae6b5f4633930a925e54623f88b3c2d8adab3bb667191b876986836e8ec'
            'cb72dc89683e9f788cb623a2c4757c23b5ab62bbab215495c9a8d2a87ff5d114070aca12990deba11b69b2abf615d8f21484af0ef7c3f765c0f5c732302ab987'
            '9f0f761084c505864d9c07958cdb3c534eb866dc736eddac91fe971c426334941e17000cff1322d8e8bcafbb1a816719b110f99b81b026e1820e1dd3f382bd6a'
            'dbb7689aa56ae0437b7438b0d8be3439b6fe7f96221245453a03ac11ae9d3fe71ec9da05725d818d73de157987f5040ae3171b8463c84c779b2b93fe6a88a63f'
            '27c84295d5295c9fe5bebc3c0bcf76da07c3020e7c6273d1c5576fd3f6164917505700ac985cd20b011b1baebe3ba5f22b047e0a84997ede1d7f396067972160'
            '7c27a189dc22e49a706c64ef614b4a3ec3bf9992484fb65a8ceddb2a73ec3b621bdd0d5f2e529bc47354fef19f942a7178a581f6a15e04c33c8a254e20dc22c7'
            '9efc0d04815db23b1dba45a8aeecd397a24ec801c3fbfefea06bf9bca82d68b1fcb0feb117a435176f0710cf37b26b55bbceee4399df1a6fb3d923b38bea2e81'
            'cd1e2c2aa3b7065686de386d095432b23243e19fc2abcd88faa8473043ef7bd8bb8dc7a5b4a9e8297365fdfe6dab9feddfb68b07c667f970b056b672651ea3a9'
            '5d61c6a7a5ec90e6e8daf68fedb657201b686808d052c658cd9e7f38a838fa413e000789f84729bb08b342641ce3a396b89069023054e6b24c78ac9e2c5d0e2b'
            'aa22606a8e08f1617f68408e5e3f8f60993bcaaaedb1ac9969e342020dd3f2d3d86959d31cd12f2ff51c944b583baa003be597ef96f22c30c0bd5826ba362d28'
            '780262d84b1ae08dd17681a0a34805f9fd5f2429b7151b850ec55ad4a6fbcea431127d0b366aed64778536e3b73d0979ada41b81b369880114f61c697f27717c'
            '66eb40301a41e698df33493df55c3926a5f8411e04df772eca0719aa38fc598d033a7675ed67b66cc058e92dc402634a46d4caf5f4fbb4a2f79b0558e893b114'
            '741e2c9dd82c3f88a21a754f3438a00b5897841af134ef574b5a02e2ca72823a2fd0c2f1f258647c581604665fba7f5b4cc506f26a6f186cb7bb42ecd1fd28fc'
            'f67bfb3d645a8b1574a1fd591641ffd74048bb22c7b7acc86c6f3a483afd33457f5d881f7dd42bb69fae94a29439ba39183ccbb401e5118a0b3a601c9b43f56a'
            '2288e1e88b0b81534a5bf595e6994689f67bec3432dff15b59baeb70d7c877be5dc50182c7ba5a5c245f6cf00d8cdc9468aac6cb1f394ebb4e4c5098a2748c8d'
            '0efacf79a82b19b519ef1e33d31ceda9c6ae20aa6e8418ae6c06aa35ee9272e7d49d8594936b560bdcf455046e3314fbab1d1f5d3ffe9d4d5ac48d5954f980e2'
            '45fe681d43a51b1d48a4094994926a96cc96f23aca08fcf39ea02d80aa32c69606e12b55ed9b518ef9d3565d7d92bcc71c348b42527c160ac1ab92b687071c1c'
            '5aa5e1addb1c6a7a6a981da31bc2dc3f760585a83cb3bcb0cdddbe8b58d355227c1db56e53066bad6b8833ac1827f3d66a59fe2c5c5882322986d02847164960'
            '6cff24008247f7694f766294b5595877a9b6aab936726db0083f231b6b76a463318969cd86764e2595c7a39447a3e94f776c69630bcafc081a8d8f5b30b01d34'
            '6d60cd18f8a56be25df8148612053923171e978a1c1807ec5857f926b671efe4932424d4dec294b45ba214a14c48fb53e2dd19b85a01f1258b8a3457194ece9d'
            'd782fb7183b21e85ef2bc31c8acabdee19cea1e5e7bbbb38a80966432f73827b3c95c955658f87a9126edfc035253d032f440874ef9c2ee2ce2e05c8f594183c'
            '56e825e036d907501d9306a14a852cb69ce7a21ef9fe8f361640ff8a15497a32406a4a0e01979a2b8a858335926691b26c97049a8d9661f82139ae2e2a53be32'
            '077c85e47d7d32b82fc67c9db61444c4d512249998111ae86cf24755ef7576e965e795f412fe1d63a780b0de64f074c39f2043fbed809228180f5bf7af07c5b8'
            '93f9930fa478909c019a5926e962cc994c9649b3b7dfe930fe4bb8e3072fec849e7f5699da3a334f3d1436d918eadef1f7a8c9e82b7bd238d9f9064fd2dc66fa'
            'dc58db1cc35b2892b6ae47697ff411a76824506336eff2165240ec8ce93011afabcb56b4142e08c5560140c8e94773d891fe93ffc764cc69d71f467ebfbf9047'
            'afedc5db2da35567f6ae8adbe39acf3c4a4692bc6c52c58620e3c9297263e09eb52841e1f25eb632b250c5f878dec02a9f743a78966c40f522001d936871bd84'
            '8d8e3490fe52deaa28c6eac3759f6c34775b829cd7102792eefb1ff57b5306eb7f315ee19828a9fbdacda117a350c3bf57b549e2209cee93b600f24dc648752e'
            '0a365998fadd5edd308b786beae5b8dc0b2eba8e349dd0f6cc93c5c9d5255a021b4b20793d74c2828c72e149e18e0145cfe569b714b9c04656af5a7288a74c02'
            '5891a7176f08e8a73afa59701d309035eab802196456847fd41b1de4b6e8aa88d706f9536c55701ae7b187fc78db3a4890238a53967ed97cf9d0ceba1a5b70ed'
            '5c32cb8eccd65629f5087935d76cb63a1eb2fc13a436863a97f4363f7336f82fe4048b3dbec530fba0ac976c561d02cfedf63b20e433dcbfcc4cd7b83a561856'
            '5185b52bf7f4f29070c5b2fb950b93e1904377ce4171958013f34ae7d7eb50f61084cd25666fb5d8b266a4de1be417d8eeb4d2d74be029e00f9408e3716bee8c'
            'd2de1289678f9b037bb357882a9ee3a66d3b2a11f2772f48cfedcb1e97dbe598ba48f898c69855b9fe561f111dbae2716da2ccdfdfc9df4091a4abc3df0ac196'
            '4b0e79a3b1187ec87f5d688f237ba9af3ef4f0879bde590cc95084ef5facf64ad195ee8a83f116fa34ed41267713d7288c8651e2dae023ce03aa032ab483425d'
            '5d7430c4af76a2db0b71d21f7bc78075618543edee177f14b2aebf81c17143e4605d033d8d6bfb1d53bccefee1162f4af526c42e4933e84f29f4f8d4aec0f005'
            '0e416dab96fa1c4cb9d8ac988984b4a4c702a5760e9809db7f10d952340f8666c30ee7ff9b83eed4019a0f5ef0c58db1eb18e88eaaae10dfe2148b0e29246f64'
            'ce0e8d128b8b1d01892475dc4d68412af2faa8303a75651738456d6f1fb5100eed0f021c5499fae7b5706ebffd23c367854e8032a92c1e4cba8ddff4ce37f353'
            'de7637d70360445575af2e62706ba91cc4472b2d7121659073c257e84ef8726d81fcfa3dfe8cf50c7661a3834df033d30f938b7cc149dc8921ef431f6daa8c6c'
            'd7ae8e6b4b38cff3be5caf57767cd56cea5b6cc5f66f61e88b80d969f9a9be20645ae022a3feff75e591bde8609eaf31c7c6ac7c9c43fbe36b25f303931433c4'
            'a1e720ba9e6d066121ddf88b47aa0ed15576d6e7ebc38cbac2565000b2ddbd8c885f4fa4143df2d1cf47373e7122f2d5cf79d0436c68d6ad16b5f0e4e16fc298'
            '02cee7c414ae6d1f51a98edd05cf731084e38c57db061a70fb6b2303105c17dcde290cdb1e6f123c8dd67bb3dc30b06dd50843fb8106faf9bdc617fb6ad5ee94'
            'f0b2a11a7badae6c0b97639969575579b212056897cb44d26fe5894200f1d5e75df1152d3c2cfd7a048f995b405a5c8d40fe5ec86805c48465de60d3fe592e13'
            '13cb4625b80879ec58c1a5b9d971cf37885b4be9b7dc52d29bff168e90b43d5cd67513ee6a91c8d9b1ce92af6a8cfe6bd22d7e2fcb12283b26c0c0ffdf3735ad'
            'cb455972603e27a68e0dd1d84a3ac6b049d848da865505745054bcadbbb9a51bf89704b80b0fdfbdfea5b94d4f8a0ddc49809bbcdc4d0abb4f2beb52f206848f'
            '58cf8de8822b02053a6e4427fa82ba848f7eeee2126ce172b4cf3e870feb3826275a718b14bf0a27dce8cd2387cd3f0874a198fb29522ee628c0428994e7e706'
            '640cd99a0b1b419d576181c7bed9db50d41ce7665c5e0cfeba8700a71a7823eae0140a261b0aaca544e28a99e5d5a32eaed3b7a095b78dc1359ecd5d93fd4c62'
            'c7765ebbf6838a92f560aa08ec2110d0e7ce9f24f3ddade3b8471d9d57bd2c0b74b8a535bd037e11f0a7ff5fa6910508578cc899ad3d5ba32741e7954f09bd8f'
            'b0e674ea53b0f0bc9f0b77ceb18c6215df2e2397050b03c363ff4c1a11d584e03c04381cbf9d6f9c8bb7a8fdb0544beee5884728c7ed057026eeb3c36bf09d8e'
            '753842f43580616d4c3cea461e1775a6ab24793adcc84a96176f0e04ea8edc3b8606c899608837e9a7ab2f4e8d81d2f8716e0a14e043b9edefc0c6246d1783a0'
            '94b5c9f624e45aff6b4ac48b3286807e8b01fe276fc2f5a0e416e326bf4fecedab6e82d2c114a8e6c9227cdabc98004d5bb44e22f228b759dcf819180d17beff'
            '970d5761a33a8e68ba0d782571e9e0463017afe4bfb65485a54915c9bbb2c304d695921f007bbbe2b469a5a28dd2c6bca42091dac68144a021fea69158429b05'
            '158eacc4afe842df0bddd725d9c2941227d84e805763d8b313ee9fe1f065bcb4a8ce7ce493a362e257ad000c1b98e31a7604cd090a03cfcbb355a551e5bfb02b'
            '0b2be5d135e5d9f04fce970085c130c87afc4c78963f9f64720fcdf73b59e0d1e9ad45868a864aaa34b7179c7def805d775d7471624f281ddd1aa09405747474'
            '2339d6b819fcb8b8f2d431f27c53e147004e0bf7e6148acd78a464ae60c3dae09d3ac2e9d2fc73e6beeb38e2d577b15b591ad164db5c5f7b244b54aa4c58a606'
            '8d4234b1aa7187b64cc7ee6eedc8fba0081c569eb2878ca9cde8f758b54f9761c4f24c9c7a75bb3c0e96bbfd1615ba283ef87b8a8b8cfc79f71e0d2ef229bdc3'
            '86f370ff0d826c2a9c2aa318ff2bbe1fa06dc6c26f9a19d5261f41f5ded742d2eab1748ad9e4d61143b67451962921fc9ffa38afbd65b75d1714bd97dc782337'
            '974229b833c74cccffbb0c7d29e43f6c4dfd7c38c9d578b93c7b551a648ba737cca5145fc11d88cd7f8b2c654725e8cf77aaef47adbbb80ac14f8588bec88630'
            'dc7f2e53ace6344bcf79229b1923fba7ceb14259ba554a659fd2f7716d1c9292cd97f05c60017f7fa23594f6aeae03174e27bada7bef36bab8bc8909ef76f73e'
            'fc259606b15627de5930d380cc3c9aec79808ce71ce3ef147ec961a9ce8ac5a3996603fb5faa76138c5c5779bafef737ce788ac05e9da9255e4fa400d1aaba9f'
            '29f7fedd2c5ccdd197347c3c5fa550c528b55f78c9c2ac96d3980b284df4b7a0dfaf7b9688a13001bf7e0d766cd33577e589eb10380f838f2bdbdf2c743c091c'
            'e894d11924d4f2df65f67a4a5187185c54604b008ecd0d28efd268955d1c217652cc45db093e69fb42b473ee494b814669632f603e504ccb49f0616f43c0ae8d'
            'd088ec6b5df8852f41388458dbba00c3a9ec23c3e0c6edbd6775355bd347a0a33aace032152f972b96b1f871f0d6ca8ed8a0fbb75beab5f69b2417b11f5f7515'
            '8b6491c8fa8665a7fad7d12e4aa1e34c96512582576adef5f8462582bf2655e99c323c7a44d3ce9a0f4655d0bff52b92190a223a45beb9357838fb75003e398d'
            '3d15bda3e14b0d40970392a8069be1c331d602e34c2a5fa167102cfa7a19f546b73aa0450d7be3d9a213c6ec1b8652991c1de08b6b1063da54ecdaf4039f7a29'
            'c25136462301491d348aa594c11db1ff2caa805522340a959aac9e95e6e6fe6af8ecbffa7403a86b3fa27d2b46ae94ea1406d3057c2cc7852a279d776ec05f76'
            '5d1856269c5c9a7bd131ad1a53ef3c10a0e0794c3f1a342734a1ca7a960be0a0fd26387b30d83a7f8cffc0eb345bbc6858ca445932a00145864ce12fb6ad6cb9'
            '770abf797de1b304fa7ce5118f46616030dc865df0b12e3f66f3241cb11bafb69c3769c6552e51eb4694bd9b7adc1d8fccc808ab476509902e341a14c88c1f9d'
            '8bed5cf65cc108f4da9c703b43bb2292e50e01da8f572e73887e8f8b5fcf2b89bfd57a781c2a68546c64a788dfa39adcf0242928cb3d986aa9ae86d18b288995'
            'ee53902c32bf450535723a34a5d2f0bbd15d191e4a9af4d401f733629ddeb2225406a16b8dd9a0472ab7e11fc5d0c5639b949d5e0bc7d4213165a974ebca4c1c'
            '6f03dc3efc6ed418fd660f4f003f0ba52030ec3c0f66f43a211bec11def28ba0babccd754593ec37fed386d79cd315c62f6d374eadc4bae3ceb322c3d4be5bdd'
            'bbc1dd9d4f54a36825105f6c9680beb2f28f2e86ea8a85ac83a18eb210f9c8cdd9bcf74c6c8413ec171a021246cd07866b27cf18e86595446d688fd30b6b3908'
            'e0660882f6246629d9998aa52d5bd6857cd20f198ed5b5430af1dc5309a422ffff136ebe5fc210c5d18e280d9d1ace0af01daa64c93365198186fea6e749642f'
            '0f780daca7f7c273054ac9101ad228a23a18735b4ac1df56e2d1b42299056c03aa44c337d53b564e36264b8c7d7fe362bc4096d62d467ceefff6491192dbaf99'
            'c6d8ec6cd433e984d1697c381b0797ac8a2c4adc6fafc7d0a2a72076b1790d7cea694fc753b0a4dfd56acc806184327e0f3f39fb9e149a20cbc0565d13becd26'
            'f7fb1b15232ecac742c8715a4f55022498300bc4643b55c7df98e46f670da327aa3d3749e22507f9feea9b1b95789d3d6da4652a9f3f91868dce064dccda7bcf'
            '1bf89153ed72314b79a5e919ed3911dd35b3c2f1c7075a7c11cd51778aca78b2521222e5b0e44b5ab4ad44760e0c92adbfc7c7ba65756471beb84deadb02b1df'
            'ab4cd7aaf7dd400999efbcb575f54f696670e47641b20c4daa7d8465eccc0ae7f9bc64667b815088e64ba4fbe9c400c72147b551fa12439cb7e7c6d18fbd405a'
            'd1ba9b6c9646c4d7f3928f212454dbe2f1bb64169583234d96568b28f667d8c4d7dd696e12c15b9dd47a8f73e4af689fa3c2658230a9890a91cd83d2da3a9b22'
            '2295fcd3a8cfa5ff73cf9664b7690c6f06d7f0ad254588c4da8fdd555ad938dda4b47def44b54d8f94fcdec23615392505cb92b7b0b81065800c7c8e7cc87d92'
            '4fda8beb539fd6217d56f2dff889056e5adc6e10b262faab1460653847666c8532d143f3837429c81d4868b830a2a8661407cb40c8924319b6a7b3a22f9299b8'
            '99125bed1cc36f1c409208c5e6476443328e5f5408d45989a99d90ccaec69fed87fd4febd74369589cf6f44f08c63a1fa6bd3bd1b3da21dafc51d627459554b9')


# vim:set sw=2 et:
