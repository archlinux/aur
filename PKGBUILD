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
pkgver=115.0
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
  mkdir -p mozbuild
  cd firefox-$pkgver

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

sha512sums=('377ab48989ec17b64bd06fed8dd80dde50c06dd4120a6ca1c2fe90a20c85d1c0ef6143a73daeb0271fb20a04b0fb53d837e116b56c63718d517b07ed4243a3e9'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '9ec5fb5bcf164fba4723a7885a2e643778b01f29b14b5c8ae414788ab9b68a1cb569817c4f24588c6e5b437ebc3c084c00ed0e5c4b2098bfcd6606aef3e3ae4b'
            '325e2d36f46bef0905c15b2297cd515f409c884fb15ac7a90a25388f948c9924ca6595f69ab543e58e9b7de6393bb2ea9e8251d169f10c97768dd1328c9f9f17'
            '0179fc563310f432d7714c839f71917a56c3c4dbb926f6ac7f2a831f901ca20230a1af6b3ed63535edfc542d2523dd692db498be0083c9c06b130d2af9ffa03a'
            '1134dc11b4f4646e4ae6195042cfc4c768c5b40d2ce311d83d7f3c9752d973f2c7c9943f1374f36e738212fbc24867ba2fbe9190d424323071d9f37df739d52c'
            '6f77e9e1280cb8b3540df73fa2a8d163356fbb215021bcf46daeddd5c85cfaa0b7d7b5159bd25fe848dde23dbfbd8137019e85757cd4678112c6cfee6b4cb72e'
            'b3f707b277b20e1c4b461d13b0bf909125892f8dd37499751834a3c46a64d8e315d241e29c828222c35dff7c6c7dd92372be07f0cc7827407347ee82d8a1d3bb'
            'df4b260aefe19fd441591baf5a35b11edfa8517b77f6601381bf1001a824c9c8ff5744eb4cb893c2535470133f825133c7579d5d8d6d03f93b657aae6d92c6ea'
            '6c9e291ec98cb963c272f78705b8b8a4c487e98cdee82b68f4f54c922361a318868536c02cf573ed78d1c309af9ac254c4662de713f66f8fd8243e14832ac12a'
            'ccdbc0c4b557a40df786a2136871ab7f5b06ce4897c4a59f2fc8ee9b25b3170d7da65501552f244c40e9b40b62f0af64982412ddc376462dbaf6604fac258678'
            'fa63243e9aef475f94b750859bd21ad612025741c584b1f92ad60ba0b5f7dfa5559354b9dd5a1b5d324b8cec1a59d42e13a090cd6fb29e8a7308c0878021aecb'
            '2b26b1da58453ed227ee5a37533edd89a0a368389ae20cc75e7309a1843c85648f8aa0af280be10542dcd6422e6a3da6afe9be64f4ac3fa65f410259c239db22'
            '702182077fbc5efe24d77151f0dbedb804afbc462ae33e8773dffb75e665d4e2b26bdf8c5a5112bed18e94341f7d388a4f15dcba51f83bb29545dd55b73d41c8'
            'cbf527cf3769aff048f4bd442fc07eebd29849a0982fd71e496f0ab7772cf664946a6705162716cc0742a4847c6322469b70d39257d079b770cf295d699d31bb'
            'b3d1f2c116322a621a6b457a214bc5746ed40c8fe26f6b92b6fac66627f067b1ee95707dd51336df6ec65a2a933925be4b964d5269b2461952784cce257aba4c'
            'ab7ecb1006efdba842ae53780060379f7203467c55655fdce34fdd08d79921502d83670363d7f5ca03ebf398f6471ed0366943619595e4b0fefdfdd97ea2466b'
            '20c235f23e1da3c0596e861ded0df7eca4ade0a74d33e7041740d44ff3a0695153a748ee9ff36b6beac8704924245736884d77980d3fa1f8e14e9df9eba94213'
            'fa7d378fd9ae0b172c1514814a51690c8322577c7b18c4be90db213491b838ac47ceec9f2b8aa1c869978a4ab0de9e27bc5ac1573954218e9c5c8db84aed88fe'
            '17e239e38fb03abebc7a84b5da1a0d0e237adc3d201fff53f6144095f85d00fd4c0b955a30a5e94e8e9c4aab25d5cef9c85032935012e791f32053fdd0c5f0a2'
            'ba73484371185cdc029421f0b6957a2056f4997ee1e04115caa87f740c80a005e6e056bb6a132e271858a7501936cc34c78e907bfbb85ed42b2b14fb70eb6f56'
            '21b226d0872a1d548f35f4f31ed3bc402256d411ca1144d690c2da2189052b35523337b5a966603c38ee2c2284cc3db094e77cb425f151d61d6528f8e27a0437'
            '25212e75e702af3e685599bd686861f595bac4d3f21a61ffb6ba7088a8c64942ba75fdf2bec18170b2a779c1290a23ee246d973c697cdc1db01a2f374e8618a8'
            'ec9bd74a3d44b244135a4e792cfab4a31db47d71a75b986e8c0ad4f32549faa0b016642f34812adfa162784f8be3344c1bdc5b24760469868e0c080f583fe71e'
            '122bd2e3e2e8eca61c16661c1f8c07be7eab823f361fdf4fb9a40dd689374875e22e6fbd1190a1d47bba604d6b8e701ed41ea33c57a2e00e7181ec78c7c688b5'
            'c8aae783c526995f99c89a44008fd8ee87fdc239d238bb3acdc1cb776f4f58c09a764bc43d9ec634159ad14ec191e64862bf8497742c2f218c7a3bfd3238aa13'
            '3f6f8fbcaea8a9d07a38941b2e4b7fb04d670c76a541a331ccf1f9a4a25eb008a12590ab37beaef12dc8a02f8fb7f184bca485c3135dab7cb1da6875a63e50dd'
            'e5a95260f1477f3e7eb781044b9496cb4df909f9436c5117383311c5922dba6e4ffa3c6b4b2020e619d2e30301a7b820f67abc996701fe6cb68515fc2596e3d0'
            '3122a0d59fe91eaafa7a40fcfa6eb8396cc09b8b64e4fd43ca44111a338fde2240be01b09d64d51d4298eeeb09149dbc5aced2b7aa29bed87895dc8330157bf4'
            'de7f29f79bc801ff370b59a93a5db357d3ad6d589482cb418b0c206ed32650bb3539f5117fc3fccdc5986e5d64e449e3a8e3034781f43bc52eb55a900a140f87'
            'ea875fd57fae3f99066bf2dbbadb8724f1e428ec9c7119620bbc3804a4d35b3081825f0002bb1a7aab076b914c2f342d3fa1554af726723bb3d238f6883c49d4'
            '2f49ce2bcf75db2e62183d84950c10883220b51f6af40e0eadb2f9ca2f7a49d4ae49fba3a40c396430009676c951f8e9798f9f95290f02958acada3e7f84e206'
            '5863d11c8af439c3529fec7b3782d46815b9587ada60ab638a861511ebb81a7c3ffb5fa27f9b28505c41ffb83a1e1dedabcfbf523c2414417c667eba0dbdfeff'
            'd5353ee11dec5d5364776b39a22902aae49087eb9e06f7bdfa9df69428aa408344931666579ca8d1982f229d8fbf8a6f4b93831d1cca90ac384b851bdf9dce8a'
            'd7947bd216ac7f2a0f1394a71d6b175d5ccfa2d59ffee9f7feecd3595e2f4a0a14a57c5cb3d06a0e3ebff69023a700100f32b94cf8d85bdb44d5c5c3fe50d429'
            'eea5e94707f2ceb2d38ae05df7d3b24f8c78bda2367b9c21add777b0411680cdf0b9e1c98e4b0fcc1ee5f9043f68c62a48790727dea8e9ecf90cede43a012b7f'
            'ba4d5a0596f2dbdfe3724fc796d2c71979bbe83bb6a62b078fd06f90e5b0ab66fd09881f1072ad970710e57a2fc9b2dacb291d9fca6b7e6ecc3c4c6ee47e738e'
            'c463043fbf7fc783ca7df703239290b3b7c9dcf43eb26be13b740e5cb2db64d18dcbedcaf02bf969d41dbfbb1e8c0b6002a1d5faee94a957c8c7a9790dffe12f'
            '23279d514eeeffd3e049df8b39a385aba66edb4aa843fb5fcaea8e09953bdba61ad898cc09dd2d22b7a7ebe8d39e39722a68b145bec58ad01679947d4f6b2e34'
            '99c0f2abe97ca82b10a4d2519510d67113517210a852e4c50f5272d4e04e3f4575ec00ce44e910762f6d0a2842f8a2a1c87ceae86dc2c2ebb69b77f905d6194c'
            '7396caae77c3db2c8f3dea2794e664ed7ed7847e70efc829d0d3e635961278c4c6e2c152c594bce38d1032bfab60423af782e1d035b3a5a5fe1e29f2a658b935'
            '1d1594c1d7d6d66464bc21291fca4298ea8a666b19cdde7de128d6736ba3ad56e772792ee4c69a24ee22e30f7ec1d608ecb35f37f7fe63bdb8fcfc9fe1d09541'
            '1541bd0bc9f48345f6ac50a0654eca49ae509311047dcf0f8e72c8e37e2a1d64f0aba4e07bd3b452ab97c908d8c4dd2a84436e7f7f07cfaa986db52ddd59801b'
            '238add9f6cb82a04ce6e360021fcc8980862ea770df37b4dbc35bdf195184777d19c3412370bf9b0a3eb1cf627608010162e120a7f7a8360c40b712b7aed75b6'
            'fceec63eec9b7ae61e93b2a1fe162ae6b39fd976118e93f790288a168350ff373db32503efc9de967554e031f6d101737eb02bc0dee98ae5cdbb3172e9510f1b'
            'd84772c65b92ed8ad779a04d93ef81700513b4ce663b499f794cba6702b32e105983f442e0f21d0f2ef3e3c43e8f7b22870192c2b61a5fb79ad585dbf79a5a03'
            '6ab13ed17676fec3d69956f7ef814a8f7a0b7653317b460e0e8b463a693d6429596b8d26884eed3cd542e2610696aa946abef5acb35e2070f6f40ccb42446f5c'
            'caf686ed8e14357236f05c470a8a4c7a1a28863b10ea48755b8947afdd29cb0c0cb4dd65a7a3e4a316bb3bd29bb46f72ec124eac9042854291307e49af04defd'
            '6d2f7e4b9719cebc108859f1ba869477663e4f13deeb7242566b622a60a6a74aba6c25c8f5ba01f55e2d16e0b902b2d1523e636f06928a4d9ce510c66b836f2a'
            '0f9ea8618e82b343536c7c9a92d637a1b9393afdcff73759ade668d035c8389de5e99ee835a4137264cf72b104de2500e998fbe07cbd7dae8375f98b89c6d37a'
            'efe7d239efdefe62f141afad1cf5d3ce185badef2b8f6ded13d68f255c0d266e2334790f6ba03b7a13f94595c679d3d74afea0b337fa2bdd005481cd914b5cbd'
            'b36b8e7dd76853efa44cb98667d57dafa42e70b03a4c8e61ec8aa1c450ff3834c95dcfd2766767ca4605c66e964f8cfdd44590a192176279ff3e8835116d8be6'
            '2222c4feb96db9077eac93f9e1fc4754120e03a86d591854721d3ba79acfc17d0cfc69bbcc3c07ec70097581d1b39ed19b109bdbb882ecea90656372b1bcb4dd'
            '32e2ee0e1a3848ae0a9e3309c8868a54e7556c5a9e092916d516ee81360e62f4efc77287712a9286fa5148180d4d1de7834a9be73ae4ba17a9708a2f9e536eac'
            '56e57c32b4e1812510b401ecfa9d85e923a0a2344acbe700a5fa49561043aaaed4ef79606426838f1d37755816d95a2177d9198d1a0c0207c305057bbb80d883'
            '6bd2c12b7dd762d3744829b97489d68ce5dd993c1731f7745f87b290687a5d54198bf83dd65408da2ab45db5c0f8af28c9c8ca5d37f326993cd39a041d391b08'
            'dbd4cfbceff2e96cbce3fd256e97a240641ec78818b9606cb57350d09ee2225a5dfe68120b8d505187553e18e1c7a36b2a8bd1e03de10aa714de07273468c3df'
            '1c27050f150d2e4e715afd5efd12fba1d2a9db01200b2be43b4e66b2a8ec3541e3565258308455ee2d4dec72b6c0ae30ffb6d5524a69b7e59bdbe481f14f9b3c'
            'c648a91b02aacfeba96ddd0e2fe2a092b42bd84e8220cbd55d45c25266d80e2889136f10aa3da490c956098f7d8232c19de85e87b7bb3eee0aeb54247fbe3b2e'
            'b400dba66c3f5fb99b832a607a75b50e6e2b0e11846413e754f0569219691ce0a4ae1b6754c71830bb0d1c287a7bbae1d9d6b8bf08916f485a8d7b0678400d7d'
            'cf1dfdd944658b1e0c5e99b9e76d60d6c2bfe70044f0c9bc2030bb4494ea4603f9a5f93fc9bebd199fd2fb1a7701045b642d7298fd96f36ae6243a1b927ea5ec'
            'bea0e9b9c1faa0026d4968f41c537666b0a6f4f12772054ad059a6d6110fa25312e3e2d05aad18b1e789d589c54b467a547bf7e23523b594a060113e694ae17d'
            '6234d40867a88d6189abd9d5cd4ebc9896cf3487e0f5c9f72de10ef361ab47b79b7c0f104119a2d1570f145b1bf123976e2d90f1ce7a758640df2913c1bd9dad'
            '6ae3d27b2a723e3132e0b030bfe3a1e516e775213eeaddcb214f12f654751b71251976ab801228e45ebf7a0742ee1f56e2a07c3f0e5c3767fffc321103472a26'
            '3d59c89d614a486e1dc49742b25aff5568e136914260c05905199fe0c6d93626c60e8561d4f56952da17a840c451ba6bb092dc32627b8cd6d1fb8ac1e53a636b'
            'dd19729c547a18ce314d3798bbc7191862da4b1aba9bda03f7825f7c63df12d3c8d276c7c0c846d02002b795ac7fbb3752fd4024b4fa4c84c635b60973068197'
            '36f94ef8563ed71192956aed518fb9d383d1b1e20dd27f467205f46068ec60ee00b9cb2fb3352a40e47642560c1b927c2eaf8edc11f8de8f0d488e7cf029f807'
            'ea54e568cef0fb5b1cd9b2428a939b8f9a4097b3f7dec56c6ce979700401bbd11141d263e318ba375cf5ab0376339ce80a6a0dd3588d5040849758c0735f781f'
            '9d92e7c6fa96d46e2e782c00b1774fe33fadc371cc5957e3aa0ab514e9bdebf5a69a37a97ab573997fb235aebc7502b4c8e6e278f3efb87e5873f68f32b1bbcb'
            'e36976744f0f5d9b2dc1187ca4027ad3214af9e0f950080941200863f51a5286dd474d268c5885a1c672d7358022f980fa4a95f9864a0fcba8bcf3c14cc81a44'
            '04eb04bd1855e83a985c68a58936d3d8a6e77783007e33ef6e6685429d3b1a5598a329d3b3879fc25a207d4f352168a7863d44dcc79c3040c3f927ed32fa608a'
            '6f942f2d3800260713531554b0527e527d5ead323d9c0221399351508b19e0713d3aced708debde3e48ee60ca289ca9231008a6b3442f3d6a35c54d6fb716000'
            '46c3c7747d8f8843c23695df356363fe19075c733c29afd6c4972270b1bed49b6677d71e1506c6c085578d17a180cfb54d4ed7b9fb0aa09c0de967d1b56c3045'
            'cb4303f1db0aa83f5adfaef05e1d4cac085ed6573dc143bc5f1823e2ef466df975d1939af1067dd6d1521675f0cf8cdd0c6f6507a19df97cbb8eb5a196517e00'
            '78b2111a6f9f907909a373f3f9f70099f9e8acf4232bdb85b23008de418c2bd3bce1d7390ba01cf173de5f71e3ab65e0adb65180ee650e6fa27a493d5e63d952'
            'a83d4ed78f64b90b3d4d29a257d0ebb995d8595638e365d961f0766bd003f9ccc468054a58562400141ad0cf2699f0ea923b52acef3054c6e718d54d6639c86e'
            '4d6eb42af1849587da4d5f08b50bcadfae8850bace1c17ef890b18743a18a71912d5c922b485ec6fbaa68c7998d58c1420bc4adc393b07ed476a524358806a4c'
            'e8e4df4666f3010c89662e4b7ca1358150aac1e0cfcc10241b252775487eff5fa924a8063c09e423d083af1fe66f1b86cb390baea72d0c7e86fbd718213b2d45'
            '7d8b2d02ffe5769f9fa2592a2bd02b047180eea9f43db184c724d646e3edf95d8a1436a797eefd56ff8ba58d350231e0cdfbe0f97fa099f0b21b8f533f30a9ad'
            '3ee7238ad00f084bec36c798bba3294f1a991dad1042edc800413b9d499e59f05994892573bd2d279a78799b96bad45884a2e8d334b2034b23cf968c8cd4c760'
            'b2c609aa121fe562ff2c0620a24a821584e9b2f7d63c2af074615517783c239b4b092fc32e09c274b6019663ed7c619c4f237cb52fe50ac6197125c21e0c40c8'
            '0c32dfb8271cd4c0e29fae3e3526783176ed40a39a63592f61a605fc317ab3f3b83f14461104fe1b585b627e52e2540a9ed1d46a15c59ce14448476e00d9b8dc'
            '157fbf5693ab0bac75208c713dd8b8469837066dfc02317bbc5d71d195e36295a54d4f6161e5580aa7c4b76a283667884ceb78113cad905d1ea70f0e637ff090'
            '620a6c8f3eaaa4b3dcc94191813da9f765111ea8a007d710b432c26bcff29a52d3e08b90614f5fc193bf93fdf8d9249af46c28f808e47b1a8d7fcae2c3d34df4'
            '56b59d7ab87032548c3db8b5a83f3551485707c51fb91a3ed3ea0292a1544b4af20e8da26eea82aaf00ad1a7d6e0ae01b1a64056cad6ab019c98ce086b4f3e72'
            '8541009feb73c1aef467d3b9a56d9944fd1a0b1e6f25a46ee667aac72474fe9d32f8b03fce25cc4867c5dbe61f4a7199b9c9765223794a558bb91f3fe0051cbe'
            'fe18ad9c347a89a55389689b5cf957331b531c6880a7ec63af27b570829bfa2afd40055f1e74d18c1ac6af0654818474e0208dbef28e81dc48828f2cc23f8bfd'
            '77bfc5822504db939e265c0eae8ddb090fa3bfb50f9550f2e8d0d080583dcf64da09218c33c88233a06eacea31f058fe616fac47800b894d83bdcf8f93f2b86b'
            '33dde598e0045b5c546b58388d0af08a2630ba12cfc21bda3c20a8929b5a3fd539d47e55f34f27cf32097ad55425a8ed3ef487cb8fa2bce8f4e59889542c7514'
            '22f9d49af799f5de7eb0bf295f376812c96273afd272ac696e75f6e7d77cb8eb4e3b4cd7c951845137ef38bbc8bb786921010f00f14bf23bed12b1c95f04487b'
            'a29dc65e0ef6d6a9c0102b2b4494cec3d950379ad95949491e1bdba44e255c20ce86a20061a72bd8ad35c01d3f4432ebc699dc8894b5b3672528822f497e6e7f'
            '828ee017d4a34d59a47204f59d9b09704aac3b3df8bd40ac5440919f18f434a15307dba69e2bc0cbb0f154e5aef1000e1e96e71bff6b4ab8c109d325ddbce6fb'
            'd7180231d4fd0b625287061547559dcab81c0908867846dd81578d38ccfdf1ada9ecc43e91b41bae20bf792555f94f376cb0f514779626e008ee83710a47a751'
            '2cc43396243d1b7c65997aab412b5b5b4a6a2d3338dcc519ab99a1f519109d08ffd12747aeafbcf910d0ca2c44aa5aeba73c45ba299da1cc41660afd198ef3c7'
            'c2e4514e3469194f3af4fa0c6ff6624b020362a62f1c1735b140cd1f7c570e46a0e62c9ba266e901809546c5962a664beb0b5180959b6ba8d04dc4e53763439f'
            '4d3fc98bb0ef95a176309bca09370af9934d37ca92d480052cbe3640034db53db5b061abf12e13480c17b7bdd2dd497a8202d356ef2da0966795af1dc133a915'
            '0e53091cf972f279fa7070c02f7beceaadba6579958e6f4c8870d569b05d0a728e845bcc9e21f71022da87ea0843306da29a502892d9f4217dd5fd7ac9dfc6f2'
            'f077a484b0387e977195b4163bd1b80d03f7d2562581ad7383c985b34cd6c79e6290c6bd66fbcc22591fa0857850233dc2eab6a1487a902a5123d996caf43ea9')


# vim:set sw=2 et:
