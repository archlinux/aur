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
pkgver=115.9.0
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

sha512sums=('2828931e79f6f2476a699afdac02133f2f04d478c5a8ed288339701387d57354f73df50d1d2a08e6afdddc9a2b95b1820c9ca1bfdce3e0772cb0ba71e12aab88'
            'SKIP'
            '4b53ee133a4ecaf068e240f6a05a1ebf4b788d67fe9141cc5b3561e1128907c8c3edb49bf2b24ba89daf1552f94ac48adf682dbe7dd070cffe7f78d98f2b3338'
            'b579b73176c72a5ecf36e3f63bba08fdb8041ae99d54e5cab906660fed6a9cf2311f7ca1ec1649e451cc6d5a4b1e6060b974b1d7befe9c8df3c5a89c50383c17'
            '840bf034625e3dff62c701c80ebe5af04bf92be54de5950be46589118feb74a4c1fbf8d8a55e34309da62cbbf94c9c863d528f0448bc8540e643bef058b7cf56'
            'b7c4af228dd86f1913b06b0ffd2a0fe022c206ab405ffb0e2f224f5e891aecd539e2a5c90c0b617ad94f2a683fbe9dbf1bc52c7b45bd5e0557df86862e8e0c6d'
            '66176fce34c1fda1e58e31f89ec1d2591ba1428b3755d5045dc763c8c186ffbb7ca3e0d29f7dc9492263169f3a6c73a3a918b957265cacd23518a166add4413f'
            '16a0facba696f7f265e374c8f435b7318df6e925db77b5b4420cd0368ad1f46ebabcb95811abbbba96f85dccf3637123f747427f288936f09c82bfd70aae3918'
            '33c10cc19a4ea430e981476906452208a1c8e6a83eab53d0da8a1de19d1b49ed9a906ff4a2d9f63956030ad1389ed21f6ac0bf01a98ad4173233f7381c0208d3'
            'fc25055a26a2737187b5e895e1b2574ed12919cb1cbef605f5203b1863141e8b8a2396470c7db51d8486932d8d444203ee0b327fd81c701b8e7c1818de39eee7'
            '658b044295fdf8799af3a489054bca1e1171643b2e0e22e1bc204182b2d9b2b99cc65691e000135d37def3fe9e2c552cffb8645a65198ecfb2dd8c339d35bb1f'
            '5a79900c50cf6a70e41d7145cb7c8ce78c9798fc1cba312d7a34620c0202d1c7f05c02cf2f0a419e261ba7e4e37e2c5f0755ad5a5e608cbad717b2572d1219c3'
            'f735a3a02ee4294d22ee87907c6d379aaefe006907296f577831f9db5bff3791912b7c75769fc05225b6a415f85a6b28a4dfea498ae7f2b22edbfc7fa5d5f4fd'
            '6312c1465762246504178fe0f6a57876a9f05a0bb90efa75770b81581da6484a949c772dc3df021fdb2fbaaeca7df4a14e81d3bbdbf78fc328472229cff95f24'
            'c86d495dd6ecb0a9d3f3b5e0af98aa6408ec24b5bb58e2dc12043a8d3940eaace3926daed40414b4b17befe1e2ad4517cc0f6ef4bfc3cf0d531ee93673fccedb'
            '78dc9e55851b8925d66eafc5df73935589b26b4adb9c95f44cfca2b24468ae3be933f19196e63394c0d7804690757efe2c8a8968458ed91c4c8fe9a8eb770f7d'
            '14c23d63734da8ddc2d977f323ba8b68768df62da445a4371d00e7c0cdb220c20a88fe9f4ca9ee76107abcb1114e2a82b2bd7abf8a3221437cb566b4ddbbd673'
            '5ef30bf9b4e4b05caf2e09806269c21146bd49b6c6eb8bc4991522c02e78a4dbc76629523f47f65b2fce342b2924a2df074cfcb82113e870fa32cf121627cf17'
            '35ba9f67239de0479f958f453045bee802168ceaf09cb043cd8253d2f3c5df48f8552bfb6f067b09088ba853d111debc1e5becadc66d59ebbdbfa18449d6997b'
            '46b72c5e48b820b7b4a5e1bf54642be59fec3a6d1e62665e5e1dcd99ed858a48d0058ae66916214372e917ad1b4a56b805cebf09f5f2814dfd5be8619c788bfd'
            'ab0ad5dedb6dee2cc0bba46560633a0b497b7d8cc58142955d995ce703f6748be44bdc1346a8435c3a3547cacbde8d8620d87aa11c07db09f44f3c70dac0426b'
            '1fabe89d38a8416d9324160d92673de71efd67cb37824f067dbdb710716bc8460a2a55c3f18d5fd7bfc17276256ecb5884f863b394ca2b79db437fb1540b9510'
            '9b1ba3eeeb4f794afa9b881ddbbb08fc7e68e6aa18bb09e5475eb598c6b5559940ef75cb3fd691a28f47c8ca14fd735aaa4ea484d9f396b86b86b37437832b36'
            '2864049271df8db65649b57c2c9baf8e603b69c69017399625ccd4f395633684c28d3f1d464ccc891273bb0b0b4ee35fb5db3e46fd8ae808e9a5273af6bac155'
            '6b676616abefd4f721be57884302ff56c888309a733a47737fc7b0e857ab7a76c9e41b4871c581a4f2d79599b22f7bfbafea8d658c7b0c53d4e2874ad612f735'
            'a7d8cd82fc3ba5da0804766cd2ca8c09368b56938e54a8af69461bc24df6d4c8c5413b7652a7656e7364a0fd7abde7d7711dec5a57a3cee43a0fb16ae6cc0db9'
            'ae3326ed65a8820471ef8d6f85e93983b804537439a92d0e4149c57689b08ffd25708463d03c7452b851a62d5e259f1bab8f4b8efa773eb202d85946df709854'
            '01d5b1a62c3e7d278ebf5720bc8bb860632ca0e3ff1e2c8bfdfbb4686de8bc0b4bd001021ecae1d5c0c633eef7ff15ff802523fd775230ed41ea34e8e901c037'
            'e95e114e671838a868c4c9f65c8f4a6bf452049447c141b4696284910f10065971bee20d7e315d7c67f72e9668dab467a6b4680564ab5c750ae9281aef5761c4'
            '276d70658a0ac094ade1f698d88454606ec7c107c71473ccee7925914f18c75e5f1ae1242376d34691d246a53d24aed8fa662c1d15aa6bd48bbc505282cba229'
            '2dfa859dd4901b76920d3c8997b6068532cdd8aa369570a3364cb927c412869285898dcf96a2a66c340d574aad7c7c4b6f9bbc23cad688ca558fd657edd27207'
            '89a453b5276ae44b5c4115208f8e891e3f5db737ec8871aa3704be9bf701baa872d766a040b95f256d405c0f69b975270f947b9d9c1bffc7154fedc155f15355'
            '301f1779799bd3d9dadc787b788670ead6fc4510097ec56f1cac0063d575c4e3200b6071caf9c20859775ce0811305003dca4abb0aa9036d499c81c3e1c36100'
            '3e7ee0bd2fe90ae9e101b841f84ea197dc3f97d6548f39affb4f4b91fb0d0303149cd3a034f320de5c89d49022300b4784971ef4ed236424f25888d4e9c4d3d1'
            'b4efaf54d0ba824b393735ec3088fbf8debcab4a1a9487fab57689e76947a91dff1bdeb1529e0cb91647e53a36531249e835210ebcb7370a23b8ba5f0e9c7633'
            'a0a4439b83f967bd82dfa88858d7f663f73dcca36ad6ef801b9e4e60801b65bc4f7a548d150132634493d546f463c303bfa68fecd75f8ddbb686313c8e1af47d'
            'e176e83b9f62e7fa0ac5ed9a567e69c57033b8b5c35ca807431103dd235b9a288e4dbab768405e7c9c7af32f3a4fc595548ecee64becf143750af05f0a06ff02'
            '0e82b1ea11b0129466571f6d0a7181f9aadd17d868be08d599e4dc64a34a16def6ad6c4fe2cf366e25b7cbfd603c9131267d7368b8455224cc0991874e5a612d'
            '1b66ee3165d55f9ad0ce7ee66033ba55145e4b2cb5dc9d00f8b0274a9984d9dc90a0171e090a8b320863352bcbd3a87b5736dd472e929510245ca632a32a1414'
            '02ce1651f9263a9c62aabc545641523dd85056bc76990d6c30830f1bae8073129ecdf956e2805abcd73712a5f00bbe1e1a2d04f068b1a5877e71a8f8457f0958'
            'e0a092ee4ae055c41ca45c8028448031a4c72ef6e237ee6d1791e8fce538fb81aba9e9e873413538086047da1117981de1886c8e8cb3db0e6e6c491ecf7b7b32'
            'efa3e75d436dd64d7200fb93eb717b649c561982611348146201d84575caa70cea33bc8fc389a2a0ac1220cfad5c2e24aef3d81b1bba9e069baa26fb473d412a'
            '85d225ee0fc9fd5cbb5b27a6f49a8d530d24ba57e07c8464a8ece0cf7729af0e57cbadc5dc81479a6542a29261eaf48baefb3d4c9b93640e65ba6d706740d9c1'
            '7d89fb476f5139ec997cd0c15118dee3bd0ce3de0ca58f5d79bdc9ac1b3b818a077c8a02e88c5d0cd129d9e5605de0aebfbef33199e3636b1769c4377492afee'
            '5f2e973b0ae550ab57c2621fb4d9a0b172aa2c72609acec5811452996568e54b184d8eaf6c9574f6ad01390d511a105a130c085a2b189395c3151a010234e6f1'
            'd95ba7b3b9d0a38eb542c2041f1ee4d7510cc34542ebcf7b9f9e186e65305448893c1bdac7a664230db529a8e27cc246c7248fea533f9d40e06c928a56fed915'
            'f1f13514473f21f8447f0fe9b2d438430e25d877f0d414e9ce5a597930915c681b3082deccaae12b956908c49fffd076ce0b9ddf820113aafa129a6c9f7da9c5'
            '443596b9a38fb6a6dd0d276cbcafa72c2e6371d23c067ecf7a6208b0cac21be4910c57ba0565d8967598c656829621a287fa5435a1ebe4c93afc29b5cd96047f'
            '773548f51d6bcf31ee9881d4a2c56f4720efea1b667b30a85d99eb92638fd156afd27f19305f121aa6a9e9922a514e4f4de067974885829a62557460c5340e7a'
            'e4870ed17c5077e6f88ccb24290712e4b93e30dc5f5cdeaca1d18e7632321e01567967599a65166d281f3eb0bcf563fe744b70da0a60427259949bc2a06550a3'
            '506d6a0a4fb4f5e4bf8d45aa70ef49464ed7ae420a816503732da160d3f5bf260c1204c88ebdf4a875ea7e8d8a7460505d2c7fe5baf6c4ca65be27bb012e315c'
            'adf92edf2ccec51e41f2cf8d199a5c3cd4df8e7d12845acb74854be2ed34581f6088df0aad9e8bbb5276a83ddb031af889c08e323fd27e87548f07ddc11f71fa'
            '031d7298efe8f443b71c30defeca894a5ed2ff8209c2efc1d5895bd675385755ea0e6d72cee476e478f0bb2a466c1a1a1cd5f8748131f960580816bfd00f2e6a'
            '5163dd87e5d1146e338bf31fc07a52151029c3a53515fa5e335241a47f0b2d840a99fa3902bc33bf356ad247a48327da1695f6c9a4ade192e3029e59334771f9'
            '5bf3c2ff2ecdd9e2f019902f8ae4a2ac5a589fadf503e5f8eb52b06efd2146802624f7b52734d878bf4051b049782ef9232c285c0c6d9b6217bda9d9e8c0f54f'
            '5b266b5784e9bfad94a255229886adf8218de70944c8c2e80bd1ef915aa6b1caf30d70d0fabc27b79879f598d986bc04bcd427f3fcf43c4a40efd5d93d2e0ba0'
            'd8119b584b052b5a98f46c8ebf9afa2d7072ac5b4d8978b91ee9c712a97a110dbed5496932260e21c5ed1be07424366052b07dfce1c57e51d213e30fb9d1e93e'
            'a326ea1c9e848cf4fbe3a96c9e1df9b73dab18bcf2379fd6aa5ef12eafb0cee017ee0d8294c74698d739436bb4e19ecfb38ca036bf04374082c2045aa26de51a'
            'f7ee13b6d917f4891927f6ff5bf34320976ace13673a76d01a98e4fb13799144afd95f40c1c6dc519a56c76015ed292d7464efe438a5159a38c22afc8ec55193'
            '5a7e630a517e5c6a3dc65b348fe1942e6e701e90521d3dc05b81597dd43516dc643ee5fd3e203db663bd5e2b459ccf3fb4e0943f484d7352cc2d9584bdd08557'
            '1ecda500dd4344bcda08b85eefa23205ebfe43fb93cd04710900915deaf553345ea2974232850babfc07c5fcf27a320a7000fd6fe0c0627133bfd7e49fc130ac'
            '79660819b8dbb567dd1717cd67f0d1716b023e37efedd1b49a5e8baae99f358e00696a4343acd18f241d58fc823f3bf258a97603997547d28e1b41b48c13c53c'
            '88d97449c99c4f4bf9c56cf98865dd40841dd8ae4bbc3b2b0b69dc0bb1ff564f145d4d812e7a9e1cb6ec0ff6d8b087fb532006540af0fc548998ceba70ef012e'
            'c62e71a6ecc10827db4551971fdbdd698ef253f48d553e5ce4b3de7db20a021f7ecd56b730137a30025726e935b30533fe3699f8a46f7b1d7dd868fa2644d06f'
            'bdefbdc5dbdd22a98514ef8347cb7f23c58d8ac8ec4e97eed5ab5fe0ace236b50c6edbf08a2fb988238a14be330453f05c96d3b6288fd7fae49a526c4bbdc808'
            '63cbc04e6d5a77353d4dc51b64e4050a76974352b7a027f8459535529f66e5c665af27d6e0397441cf6c2fb0ef73c8cf7904af1e31463ea93ae25c447817190a'
            '97371aa2338490ebe0ea366dfa9d8acbf41266ec2cc22b1d79489aa6338a7180db9bdcc991cc493728abf3cce05dc39d3e271136a0d58380d9cd855d5241cec2'
            'd401ee5e1150210a97d8bbbf0601930ef081be7a7ed4eb2fa89e0e646fde93fd4345d90ff3e5cdbfc76afd494c31ae0e2cb6b1568c04e3f1ceaccb894bef2864'
            'b6c67e9b2365d8e836609294f67de3a9f709b2db22b57c537ab04bd6e98f6ef329967ad935d96d48cbeda7b2c3c486e404f409d78df4096253dcc483157865b9'
            'ae29f075c1e2673a3e275f22592e5a4bdbbcfc24a1f8a4716c39af31812ea33e286d2644edfa99c1fd7d4d28cc1eba8c78e5a99b17b647a9c7528888d6ffd624'
            'f55dd4df36358f96bdf46415376245b715508429e8e3ea328003f61a522fbd386c41b73edc83281e9db288fe8f7ca4731e0d50e7aeb8d8239311fa5a145bf89a'
            '8ae9549063288e28354ca6cd1a99bd9f89d85c4c900c7b8c730110030ca333478076147d8708067c0259d587d3fcc0365d76cf05c3cfcb9ccb045a58b50bea02'
            '863f0d1a4df096ac4026ac98f3cb4c06ecfd4a02659592a0294f6abbb7a3bf9c43bde18241dc042f0136d450fdcc0c174894038994fc1179e90c51ff66d97d82'
            '71d354550f68f3e88e9e06d5d49fe11fa1d749fa10d6fbf71bd42a25d6e43d362aa49954dd994296a62646e7807faf182120e00aaec9c705160c2a3e691bb44d'
            'a54daf7744743831392fff0c4182731c36428362b555623d3868223fe51569aac34e41a61a780047da3c22c76602a19069fa72207aeeb05fdb27afde8f21b615'
            '53b784eb404dd59f0e37df4f681b32d50edd6f96a003a74a7dc72ee1d9ce8044fa138e7375cf204f4d4041cb854d91b1233f416d154457538e72f855fa116f42'
            '1da4419e8d3c7818cf17f34eccb16e27d0bce4474e13527d9b419fb523bf7d30242bbbe08206603798501a44950ced03a328195fa17dd83e88bfff349906513c'
            '950382bd9d4c0c0f9594a7a8f97671c349650b65016203b0a65f6a42e548757440e317a4c74799a0b6d2e659c6ebc231245be654c7a0ed1a5aab4465b05615bf'
            'a8c264f831d2fcb569ddacc8f954b8f50cb96003f089c0f0248f941cba621b6ef4d6dc3c16eca878823bd192e8be5f5702e26c7afbf1bc779ab263cf46b7e071'
            '7129ddc38e6d51d1393b13d3970f418095127409909f59d4c6de366bf22ed34db44efa652c68bc336498f80431a09022f06fb5b4f098ddfbfe92a3215b6bae0d'
            '37b3fb1b67325f89ba5b2b5c9586c5525ee2e476a8fb9f1e7c392ba83d64d4688c955db3ed88448990538055d3eee9c5fb21c44582bb6a27899bd74d2f56b090'
            '8f3c9e8b36de76ab52fd6419d0123a7c4c4f7b877e94553afa275845e1bb00c2b83e2f053df49c8a6e2b0065cb8d1b20e4fe1fcdde58ac12a60ac2564623c228'
            '1a0201cf4cd9a0eec699b25885a5f1f942b6340cffc9cbf3aae6f945ccdcfe0fe6c8fb21fe0531aa65619c2a12df43efd2db898bcc3a4b27806d0b0c86672c90'
            'f0219b8efca1cd6e41af6d9dcbaee02f71f26f0d50674bcc676b17da02f46485494c724480f0b8b51085a918476bdae9809003311cffbbc703beeaa54ed2fe25'
            '44c3a2ac8a5a7c2074b03db35063b6cd6ba1733ac0832f59971c0c4aef2d48ecd7bcfa25ff0981263fc36fe1f71709c57d1ca55db3420d92a6c6fab78cda86b1'
            'b2277a66d79f6e6bfe28fe30b476c888ce162fd438027d9153b822f18f016e3e87cbca13e56bbf9055d6c2af7dc34ef768526ce423e7f548db1daf48e23fb0c2'
            '5a8907fd08cab0949a13925815cb615d527be178c71bfe1f75de2552d6a950c1740421cd827687422cefe4abf23da4ca328575f050d5f3bade456e4b60a80a3e'
            '1e35069afae53b4ae0ebc5762a3bf3518284b001ca9ce3ecf78b1d13a4cec29ce6097debe37f743d8fc153b588a880189799ebc91c0e3966bfbd79bdf1f14bd6'
            'bc684070369db702b7f17b0517e0af9de1a3841a5f7703620bb280304476b9b863bc31aef5bf6f5d93e3b25705670ea98ab967a30b17e3491f5ba02b283870ed'
            '793349f9608a6877bae011e39740f05b7dcfed1a02c827e49edc08e9aaf7aada3c94e72f1008eaaa234bccebd4d1d68415815094edd4cf15602f240a8254a101'
            '9bb0a1be47785091d8abfe68f39d347338c2286e805cbde9e9367e2f2ad4e0df1dd675abaa2a8abcc3033b7f88aaef4509f5fcaafa2df311d76bfb916e3dc70a'
            'b7bdf57febd682487b962947ebc21b9c7f2dc21c4b0f62df5518bf67f2ab4eade4d0233ddc58886cdb3400770ac6af3b1f275d843fc9267deefc127aad2ffdfc'
            '755625bc60f0b696acf25b519e2ea14571e1f114ccd95b0c3745bb5b5bfaa5a471e284343431afaa2ff954b12c615fd1391438c8b62d7e51d1269f99f5efde88'
            '438d05e0514b4fba293068216f72229472d063f534371a49b03f544e7ac5d5a17a7b9c2fe9ba80c39d069610a14c1038f2503fed9baf3dd365111eca99ab96a4'
            'b068ede619c0e8be0699b8a16c0706a3181ac4a3c7321256adfc5ea843cdbf830c5529be91b4f27eceaa8fda02c627632599440c61a60f5ad161db5ffe596e48'
            'bfc4b169b4382b163b94019eaf28a9ca3bcdff2e12d1beb914b851c5dc35225e2b6c1374e7c7534b8c7c3d9a17573d55b8ff48104579eae9802968c74842233e'
            'f8f091e3b79ad6bfc5c20a7a58fb33747c5de2fb7e8894ccdafa962e8f4ccc6e96342461988a7e2c696cd7c885ca557319aa70b79482030625c8c69499ef289f'
            '0e696eae90da27e3d075dab29b682e1871a54f61d06d3cbedae46c1da5b2130ddaa388def4cb04cae14556aa9bc2a2c70e2b31348f54f34dae68273d0dcdc373'
            'dde1d995f284be84f265d2e66a83c1d014f477dde3d77dbba1f6c1ee75148fe991f8f7042b265d73cb02a33e28e0ae3b1a34bdcbbfe44c251946a68f65c5552a'
            '922b32875756dc36dce4ca79c659425266fe227e41daaaa6abb0cbbc7f7db6c8d762654bc70973ae5488bbedc1cf0733a1740b78e36805e9f782ea4feb2cf055')


# vim:set sw=2 et:
