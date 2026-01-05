# Maintainer (arch:firefox): Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>
# Contributor: Henry Jensen <hjensen@connochaetos.org>
# Maintainer (archarm:firefox): Kevin Mihelich <kevin@archlinuxarm.org>
# Maintainer (arch32:firefox): Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Erich Eckner <git@eckner.net>
# Contributor: Andreas Grapentin <andreas@grapentin.org>
# Contributor: Luke Shumaker <lukeshu@parabola.nu>
# Contributor: André Silva <emulatorman@hyperbola.info>
# Contributor: Márcio Silva <coadde@hyperbola.info>
# Contributor: fauno <fauno@kiwwwi.com.ar>
# Contributor: vando <facundo@esdebian.org>
# Contributor: Figue <ffigue at gmail>
# Contributor: evr <evanroman at gmail>
# Contributor: Muhammad 'MJ' Jassim <UnbreakableMJ@gmail.com>
# Contributor: vando <facundo@esdebian.org>
# Contributor: taro-k <taro-k@movasense_com>
# Contributor: Michał Masłowski <mtjm@mtjm.eu>
# Contributor: Luke R. <g4jc@openmailbox.org>
# Contributor: Isaac David <isacdaavid@isacdaavid.info>
# Contributor: bill-auger <bill-auger@programmer.net>
# Contributor: grizzlyuser <grizzlyuser@protonmail.com>


# parabola changes and rationale:
# libre:
#  - Modify the add-ons GUI to search the Gnuzilla Mozzarella website
#    instead of the Mozilla add-ons website, which hosts non-free addons
#  - Disable EME, which is implemented via the non-free libWideVine CDM
#  - Disable Normandy that let Mozilla push messages with recommendations
#    of nonfree software
#  - Make Remote Settings work completely offline using local data
#  - Use system python libs. The arch package uses 'pip' to download
#    dependencies from the internet at build-time, despite that those needed
#    dependencies are already packaged in the arch repos. So strictly-speaking,
#    the package is not built from source, as some sources will be missing
#    from the published source package, and will not be required as makedepends.
#
# technical:
#  - build 32-bit arches with GCC instead of clang (sometimes)
#  - disable rust-SIMD, LTO, PGO, and skip profiling build for armv7h and i686
#  - allow skipping profiling build for x86_64 (_SKIP_PGO).
#    this is to avoid OOM problems, and occasional deadlocks in some versions,
#    which expect active netwokring or internet access at build time.
#  - prefer as many system libs as possible, over their vendored couterparts
#
# branding:
#  - Rebrand to Iceweasel, per the mozilla trademark policy, due to the FSDG changes
#  - set user profile directory to ~/.parabola/iceweasel
#
# privacy:
#  - Remove Google API keys and usage
#  - Disable Mozilla telemetry and crash reporting
#    (good manners because of all of the other patching we're doing)
#  - do not compile/upload remote debug symbols


# NOTE: This PKGBUILD is kept in-sync, as closely as possible,
#       with arch{,arm,32} (firefox), and parabola {iceweasel,icecat},
#       for the sake of documentation and cleaner diffs.
#       That also helps to identify which changes were made by Parabola vs upstream.
#       Therefore, this PKGBUILD may declare blacklisted dependencies, non-free sources,
#       or include code for anti-features; but those will be filtered-out subsequently.
#       Any code which implements an anti-feature should be commented-out;
#       and include an 'anti-feature' comment, for clarity.
#       Any blacklisted dependencies and non-free sources should be filtered,
#       and include a 'non-free' comment, for clarity.
#       Without those over-rides, the resulting program may not be FSDG-fit.
#       Do not circumvent those over-rides, if compiling for the Parabola repos.


pkgname=iceweasel
epoch=1
pkgver=146.0
pkgrel=1
_brandingver=138.0.1
_brandingrel=1
pkgdesc="Fast, Private & Safe Web Browser"
url=https://wiki.parabola.nu/Iceweasel
arch=(x86_64)
arch+=(armv7h i686)
license=(MPL-2.0)
depends=(
  alsa-lib
  at-spi2-core
  bash
  cairo
  dbus
  ffmpeg4.4
  fontconfig
  freetype2
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libpulse
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxrandr
  libxss
  libxt
  mime-types
  nspr
  nss
  pango
  ttf-font
)
makedepends=(
  cbindgen
  clang
  diffutils
  imake
  inetutils
  jack
  lld
  llvm
  mesa
  nasm
  nodejs
  python
  rust
  unzip
  wasi-compiler-rt
  wasi-libc
  wasi-libc++
  wasi-libc++abi
  xorg-server-xvfb
  yasm
  zip
)
makedepends+=(
  git                      # clean source-ball
  imagemagick              # process branding images
  jq                       # anti-features check
  libxslt                  # process branding images
  python-jsonschema        # process-json-files.py
  python-setuptools        # de-pip
  python-typing_extensions # de-vendoring
  python-zstandard         # de-pip
  quilt                    # apply branding patches
)
optdepends=(
  'hunspell-en_US: Spell checking, American English'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland'
)
# install=${pkgname}.install # TODO: redmine #2164
# provides=('firefox')       # TODO: redmine #2164 - currently conflicts with 'your-freedom'
replaces=('firefox')
options=(
  !emptydirs
  !lto
  !makeflags
)
source=(
  https://archive.mozilla.org/pub/firefox/releases/$pkgver/source/firefox-$pkgver.source.tar.xz{,.asc}
  $pkgname-symbolic.svg
  $pkgname.desktop
  org.mozilla.$pkgname.metainfo.xml
  0001-Install-under-remoting-name.patch
  0002-Bug-1995035-Allow-F_DUPFD_QUERY-in-the-Linux-sandbox.patch
)
source=( ${source[*]/${pkgname}-symbolic.svg/} )  # branding over-ride
source=( ${source[*]/org.mozilla./nu.parabola.} ) # branding over-ride
source+=( vendor.js.in )                          # FSDG config options
source+=( zstandard-0.25.0.diff )
source_armv7h=(
  0001-Install-under-remoting-name.patch
)
source_i686=(
  avoid-libxul-OOM-python-check.patch
  firefox-111.0.1-fdlibm.patch
  fix-i686-build-moz-1792159.patch
  fix-i686-xsimd-incomplete.patch
)
validpgpkeys=(
  # Mozilla Software Releases <release@mozilla.com>
  # watch https://blog.mozilla.org/security/
  # key is available to `gpg` only via keys.openpgp.org keyserver,
  # or manually from mozilla nightly source code or the security blog
  14F26682D0916CDD81E37B6D61B7B526D98F0353
)
validpgpkeys+=(
  3954A7AB837D0EA9CFA9798925DB7D9B5A8D4B40 # bill-auger        (branding source-ball)
  BFA8008A8265677063B11BF47171986E4B745536 # Andreas Grapentin (branding source-ball)
  3954A7AB837D0EA9CFA9798925DB7D9B5A8D4B40 # bill-auger        (libre source-ball)
)
sha256sums=('08d4cae010abc31603ef74091a5d1f81da8e62d3b66c806690e70f03c422df16'
            'SKIP'
                                                                                # $pkgname-symbolic.svg
            '614f2ab3f7bbe783ca50b94f4c78081ee1f98605156ee8ff379e251191b61bdb'  # $pkgname.desktop
            'a6e4ab312203ae1df50537f4e6631417b84df46bac4cce2d51145751a405cd8f'  # nu.parabola.$pkgname.metainfo.xml
            '883ca2fa723a7572269d18559d5b82412782ad63e5dd3820eeb0540e3fe34314'
            '3b8bae25a05e6075c7025be387ee8e1a2dc57c19d89d3028b457128530f6c24b')
sha256sums+=('86bd54db6026ff65bd24ac4f05d0679a645ff447e2f81b0ee44037c0c4285e06'  # vendor.js.in
             'c69dd93e92afcd78af7c84fd7c71b04f75686424d0b5115fd08da915bf5f6670') # zstandard-0.25.0.diff
sha256sums_armv7h=('883ca2fa723a7572269d18559d5b82412782ad63e5dd3820eeb0540e3fe34314')
sha256sums_i686=('65395a49fd3d998f7e06a430bdd656ad453254dafcc34e21ec7931902d8c1809'  # avoid-libxul-OOM-python-check.patch
                 'ed3bb281697af7c4353a34067ffb4b18a971d40757bef2d6af3c8bf2d28d42d1'  # firefox-111.0.1-fdlibm.patch
                 '2fb39374fd3d80eea9e346032a2a4b2bc2e357dee7380855b24bcf19b1335d06'  # fix-i686-build-moz-1792159.patch
                 'c3ce181fbb0142055aa6dd17f3cda2ba6a1e54d7a689a8c6e9cce76aa40e6544') # fix-i686-xsimd-incomplete.patch
b2sums=('da28aeff1bdd88ad612127196497a37acbe6bc83944b08cf2ea9a1eb4122899326fbd90ca2b1f4d2a6f331afd08d1699108cd09171f20c945f3f3fe006909029'
        'SKIP'
                                                                                                                                             # $pkgname-symbolic.svg (deleted)
        '49b4776b3ec8c70194a8f7c5a6467f71820c6a5d6e2033a519fe2742282c6dc141855c6213c67e34b4e0774227d3c15f9083e708c33e7cd6e4c3a982830fefdf'   # $pkgname.desktop
        '80cf1f7644f9b509fe374cd51fea288ffcca73f735c7d4c8e2a22be7543aa7e0f3c84a619315e5fb4b82967f1cc7b2b4282658af859be1a08d2f29c39f2815d7'   # nu.parabola.$pkgname.metainfo.xml
        '8a894b01e405b628877483e40e9b018647977cb053b6af02afc901ed24d6e1f767f3db8c321070e33aea4a05ba16f1eb47ae600e5299b5f9caad03d20ba38cf5'
        'e97f22602666465d418cbbb260cf8de936ca101b2c800247b45a63444c36fadee2c0dc8b93ee203409e27fb99a82e24d8c7bd20a7e53eddc979cd21b7cdaedde')
b2sums+=('f3f344196d03499f3f0392d5dfc5310e131d8c85772edd340faf1df3f04ebf2931eb1dda1b7fe6870d61d498618f4d8ae9f1dd446acbe83e0ce324e04b38f3f9'  # vendor.js.in
         '0520eda97ee321a369cab971cba42a56c71a3a56f84d0e77f13031a39738235655fa419b26ecae08f2841099bdc8fca4c2ffca8b1bd8f60b2f52da5f10959012') # zstandard-0.25.0.diff
b2sums_armv7h=('8a894b01e405b628877483e40e9b018647977cb053b6af02afc901ed24d6e1f767f3db8c321070e33aea4a05ba16f1eb47ae600e5299b5f9caad03d20ba38cf5')
b2sums_i686=('572bb35d7aee0ac847a864b4309f73390435f16b750b8fa3c78b986181d57cdad434bca006d7438c903b2fdc08385292d08fee1d68c87240af72688d60cb8657'  # avoid-libxul-OOM-python-check.patch
             '05c7c9727201971650df4ca2e00539767fc9e159539835c641fccab5ec9577a7294e8f62f5d0670158316e5467ea121c03a36fd4ba153e1d60f3402f0430548d'  # firefox-111.0.1-fdlibm.patch
             'd20ce3eff595f85df86eaa0dfb665fc356f8987117a771f76adc4ac12046a7e82b0af182fa99f87ea1362a5026c9d0216c7b714649fef0c7294c61c8e8f4d790'  # fix-i686-build-moz-1792159.patch
             '3e6fd4cebe0fd4c250ccf5b04e12b93e5f4cc2d139301316c987cc07a57b4b6b49b830d745520a82f5ac59da8d17f728a3ecce4dccf21804a2d6a256a6f76472') # fix-i686-xsimd-incomplete.patch

# Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact foutrelis@archlinux.org for
# more information.
_google_api_key= # anti-feature


## source tweaks ##

# manage duplicate patches - arch and archarm apply these sporadically and independently
_remotingname_patch=0001-Install-under-remoting-name.patch
_no_remotingname_patch_err_msg="TODO: \"${_remotingname_patch}\" not declared - is it still needed? - or else remove this code block?"
_has_armv7h_remotingname_patch=$( [[ " ${source_armv7h[*]} " =~ " ${_remotingname_patch} " ]] ; echo $(( ! $? )) ; )
_has_x8664_remotingname_patch=$(  [[ " ${source[*]} "        =~ " ${_remotingname_patch} " ]] ; echo $(( ! $? )) ; )
_has_duplicate_remotingname_patch=$(( _has_armv7h_remotingname_patch * _has_x8664_remotingname_patch ))
_has_remotingname_patch=$((           _has_armv7h_remotingname_patch + _has_x8664_remotingname_patch ))
if   (( _has_duplicate_remotingname_patch ))
then source_armv7h=(     ${source_armv7h[*]:1}     )
     sha256sums_armv7h=( ${sha256sums_armv7h[*]:1} )
     b2sums_armv7h=(     ${b2sums_armv7h[*]:1}     )
     (( ${#source_armv7h[@]} )) || unset source_armv7h sha256sums_armv7h b2sums_armv7h
elif (( ! _has_remotingname_patch ))
then echo "${_no_remotingname_patch_err_msg}"
fi


## parabola mksource over-rides ##

_N_MKSOURCES=2 # number of sources=() to be isolated for mksource
_N_MKKEYS=3    # number of validpgpkeys=() to be isolated for mksource
mksource=(       ${source[*]:      0:${_N_MKSOURCES}} )
mksha256sums=(   ${sha256sums[*]:  0:${_N_MKSOURCES}} )
mkb2sums=(       ${b2sums[*]:      0:${_N_MKSOURCES}} )
mkvalidpgpkeys=( ${validpgpkeys[*]:0:${_N_MKKEYS}}    )
mksource+=( https://repo.parabola.nu/other/iceweasel/${pkgname}_${_brandingver}-${_brandingrel}.branding.tar.xz{,.sig}
            9001-FSDG-sync-remote-settings-with-local-dump.patch
            9002-FSDG-preference-defaults.patch
            9003-FSDG-urihandlers.patch
            9004-FSDG-misc.patch
            process-json-files.py )
mksha256sums+=( '5bc738051a1d23fcc6c3337e70f9b892da3c0c4d7586024100837df91a5d2b25'   # *.branding.tar.xz
                'SKIP'
                '294f76520eadae59013dde214b841f133dd191e91a3aa18a4539866285bbaa2c'   # 9001-FSDG-sync-remote-settings-with-local-dump.patch
                '34e7c766f01a5fe9e2e21355342f79ad5259e0f4420257ea33f5b08d015bfa43'   # 9002-FSDG-preference-defaults.patch
                '931dd421233e19b9577023b06ab7d309e99c6c6f3b377200a7a77be51f597cef'   # 9003-FSDG-urihandlers.patch
                '3fc2a5a91b41edc9c45c202f696ea33ebdd75391a168cd2314608924734af377'   # 9004-FSDG-misc.patch
                'e3fbe2f242afd5bb7ad23c0be69178437e26c664fc92faaaa5fca3de93f4c30c' ) # process-json-files.py
mkb2sums+=( '3b44327334e83803e991b65a479b6760eb36d6a72df510de3171ac2e3484e8a2d0c4117447c847ea146be3df93d3ef770dd28e48d4aa5cfe975db430113d65ad'   # *.branding.tar.xz
            'SKIP'
            '51474d6824ef7173a15d35f03257efce32362c12851c1bd44c52702cef39573f7cb2ad834524a45ce7a0135a1d672bd4cfcae96afbb0ed9a2d789dad6c940d57'   # 9001-FSDG-sync-remote-settings-with-local-dump.patch
            'fc8c6c63a3490f8042bf0eb2a0641d75f693b5d78917882c405d1201e6e4db8de47b99c9d8e99ab2139722fc84fe49ebde2df0c9ad75ea5f7e480b4c13dc308b'   # 9002-FSDG-preference-defaults.patch
            '2ae2c346a1907e292688d1636062425e4b90f13f13348e37d6ec1159de66652c31edeafebfdf9bdfd77ca744e2ef37ea2f22aee0c2f07d7b444fc247c549a58c'   # 9003-FSDG-urihandlers.patch
            '8195a53251ccda3a56523933882a6bfe474a243937483965856800b6380845c403ebf8a6612a56e14dc8dc79c73df9a4b737b2e2bab887a0dbe9a6394262bf25'   # 9004-FSDG-misc.patch
            '5b730a5e1eab388d1289e208610794b8b4393a93e1244d25bf7c0e69354341eed4cd3f5f85845efbd7cb703aa1d4cb6bdaf3e0413cc63355759a659920c4926c' ) # process-json-files.py
source=( https://repo.parabola.nu/other/${pkgname}/${pkgname}-${pkgver}.tar.zst{,.sig}
         ${source[*]:${_N_MKSOURCES}} )
sha256sums=( '266f167ce68896f535812536a0ee7510846439b0dccc0e256a4b80cd938a615b' # libre source-ball
             'SKIP'
             ${sha256sums[*]:${_N_MKSOURCES}} )
b2sums=( 'bb19ed52f0ea80b929ee4226772a2d6736b24ee5b91f043601fe61adf37b68ac5c3c4c596bd5ff6f4561ac7cf8d08c51cb9191e2dd09d555c9245086c8e07f53' # libre source-ball
         'SKIP'
         ${b2sums[*]:${_N_MKSOURCES}} )
validpgpkeys=( ${validpgpkeys[*]:${_N_MKKEYS}} )


## compiler and optimization tweaks ##

# Use GCC vs LLVM
# One option or the other may resolve compiler/linker discrepancies for some releases.
# This option implies $_SKIP_PGO.
#   ERROR: Cannot use cross-language PGO with GCC.
# Kown past causes:
#   * option/flag discrepancies
#   * toolchain incompatb=abilities
readonly _USE_ALT_COMPILER=$(case "${CARCH}" in none) echo 1 ;; *) echo 0 ;; esac)

# Disable PGO build
# PGO is said to afford some marginal performance gains at run-time.
# However, it doubles the build time and requires gobs of memory to build.
# Build hosts with less than ~50GB RAM+swap available will need to set $_SKIP_PGO.
# This option alone is usually sufficient for a typical laptop/SBC build host.
# It is possible to build with less memory if the build chroot is on a ZRAM drive
# (see this ticket for details https://pagure.io/abslibre/pull-request/89).
# Otherwise, try this if the build hangs indefinitely during the profiling stage,
# or as an alternative or supplement to $_USE_ALT_LINKER and/or $_USE_LESS_MEMORY
# to reduce memory usage of the remaining build stages.
# Known past causes:
#   * resource exhaustion
#   * a test which misbehaves in environments without networking
readonly _SKIP_PGO=$(case "${CARCH}" in armv7h|i686) echo 1 ;; *) echo $_USE_ALT_COMPILER ;; esac)

# Use 'bfd' linker vs 'lld'
# Most significantly, this also disables LTO and debugging.
# The final build with --enable-lto=cross,full requires ~50GB RAM+swap.
# Try this as an alternative or supplement to $_SKIP_PGO if while linking,
# the build freezes, is killed, or the host otherwise suffers resource exhaustion.
# Known past causes:
#   * resource exhaustion
#   * option/flag discrepancies
readonly _USE_ALT_LINKER=$(case "${CARCH}" in i686) echo 1 ;; *) echo 0 ;; esac)

# Try hard to tell ld and rust not to use too much memory.
# Mainly for x86_64, this is the union of explicit optimizations for 32-bit builds.
# In addition to $_USE_LESS_MEMORY, reducing $_N_JOBS may fit tighter memory constraints.
# Known past causes:
#   * resource exhaustion
readonly _USE_LESS_MEMORY=$(case "${CARCH}" in none) echo 1 ;; *) echo 0 ;; esac)
readonly _N_JOBS=4

( (( _USE_ALT_LINKER || _USE_LESS_MEMORY )) && options+=( !debug !lto ) ) ||
( (( _NO_DEBUG                           )) && options+=( !debug      ) )


## general dependency tweaks ##

depends+=( libicui18n.so libicuuc.so ) # --with-system-icu
depends+=( libvpx.so )                 # --with-system-libvpx


## arch-specific dependency tweaks ##

case "${CARCH}" in
armv7h)
  makedepends=( ${makedepends[*]/wasi-*/} ) # armv7h has no wasi compiler
  makedepends=( ${makedepends[*]/nodejs/nodejs-lts-iron} ) # from archarm since v128 - the reason is not obvious

  # obj/dist/system_wrappers/new:3:15: fatal error: 'new' file not found
  if ! (( _USE_ALT_COMPILER ))
  then makedepends+=( libc++ ) ; export CXXFLAGS+=' -stdlib=libc++' ;
  fi

  # obj/dist/system_wrappers/aom/aomcx.h:3:15: fatal error: 'aom/aomcx.h' file not found
  makedepends+=( aom )

  # checking for nodejs... /usr/bin/node: error while loading shared libraries: libicui18n.so.76: cannot open shared object file: No such file or directory
  # ERROR: could not find Node.js executable later than 12.22.12; ensure `node` or `nodejs` is in PATH or set NODEJS in environment to point to an executable.
  makedepends+=( icu-compat-76 )
  ;;
i686)
  # disable wasm for i686 - 'wasi-compiler-rt' (in extra) supports only clang 18 (in staging)
  #  > DEBUG: | wasm-ld: error: cannot open /usr/lib/clang/15.0.7/lib/wasi/libclang_rt.builtins-wasm32.a: No such file or directory
  #  > DEBUG: | clang-15: error: linker command failed with exit code 1 (use -v to see invocation)
  #  > ERROR: Cannot find wasi libraries or problem with the wasm linker. Please fix the problem. Or build with --without-wasm-sandboxed-libraries.
  makedepends=( ${makedepends[*]/wasi-*/} )

  # armv7h and i686 FTBS due to 'nss' version mismatch
  #  > ERROR: Package 'nss' has version '3.107', required version is '>= 3.108'
  # we will not be able to build iceweasel for i686 until arch32 upgardes 'nss'
  makedepends+=( 'nss>=3.108' )
  ;;
esac


## helpers ##

_check_patching() {
  echo "Verifying libre patching..."

  pushd "${srcdir}"/firefox-${pkgver} > /dev/null

  # Remote Settings
  local settings_server_regex='firefox.settings.services.(mozilla|allizom).org'
  local settings_err_msg="ERROR: 9001-FSDG-sync-remote-settings-with-local-dump.patch needs reworking"
  ! grep -qrE $settings_server_regex || ! echo "${settings_err_msg}" || return 1

  # Model Hub
  local model_hub_server_regex='model-hub.(mozilla|allizom).org'
  local model_hub_err_msg="ERROR: Found ${model_hub_server_regex} in the sources. 9002-FSDG-preference-defaults.patch needs reworking"
  ! grep -qrE $model_hub_server_regex || ! echo "${model_hub_err_msg}" || return 1

  # Merino
  local merino_server_regex='merino.services.(mozilla|allizom).com'
  local merino_err_msg="ERROR: Found ${merino_server_regex} in the sources. 9002-FSDG-preference-defaults.patch needs reworking"
  ! grep -qrE $merino_server_regex || ! echo "${merino_err_msg}" || return 1

  # services.addons.mozilla.org API endpoint
  local amo_api_endpoint='services.addons.mozilla.org'
  local amo_err_msg="ERROR: 9002-FSDG-preference-defaults.patch needs reworking: AMO API endpoint hostname found in source tree"
  ! grep -qr $amo_api_endpoint || ! echo "${amo_err_msg}" || return 1

  # URI protocol handlers
  local uri_handlers=uriloader/exthandler/HandlerList.sys.mjs
  local webmails='google|yahoo'
  local misc_err_msg="ERROR: 9003-FSDG-urihandlers.patch needs reworking"
  grep   'name:'           $uri_handlers | grep -q  '"KiwiIRC",' &&
  ! grep 'name:'           $uri_handlers | grep -qv '"KiwiIRC",' &&
  ! grep -Eq "($webmails)" $uri_handlers                         ||
  ! echo "${misc_err_msg}"                                       || return 1

  popd > /dev/null

  echo "Verifying libre patching - OK"
}

_check_build_config() {
# WIP: the check for unsupported/obsolete options does not quite work yet for ARM;
#      but i always build i686 and x86_64 first, so the other checks would probably pass on armv7h too
[[ "${CARCH}" != armv7h ]] || return 0


  echo "Checking build configuration..."

  pushd "${srcdir}"/firefox-${pkgver} > /dev/null

  # Each of the [ARCH-SPECIFIC CONFIG] branches in prepare(), should have prepared a
  # $srcdir/mozconfig file with any arch-specific changes to the Arch x86_64 PKGBUILD.
  # Finally, that file should have been copied to $srcdir/firefox-$pkgver/.mozconfig
  [[ -f .mozconfig ]]                                        ||
  ! echo "ERROR: cannot continue without a .mozconfig file"  || return 1
  grep -q ' --with-distribution-id=nu.parabola' .mozconfig   ||
  ! echo "ERROR: .mozconfig file is not properly re-branded" || return 1

  # `./mach configure` produces mozinfo.json, reflecting the current configuration.
  # See build/docs/mozinfo.rst
  local test_options=( --disable-eme ) # inject important options to detect their validity
  cp .mozconfig mozconfig-backup
  for opt in ${test_options[*]} ; do echo "ac_add_options ${opt}" >> .mozconfig ; done ;
  local was_configure_success=$(./mach configure > configure.log && echo 1 || echo 0)
  local obj_directory=$(./mach environment | sed -En '/object directory:/{n;s/^\s+//;p;}')
  echo "obj_directory is: ${obj_directory}"

  # ensure that DRM (aka: EME) is properly de-configured
  # and report failures due to unsupported/obsolete config options (cleanly)
  local invalid_opts="$(grep 'InvalidOptionError: ' configure.log | cut -d ' ' -f 3-)"
  local is_eme_opt_valid=$([[ "${invalid_opts}" =~ --disable-eme ]] && echo 0 || echo 1)
  local is_eme_disabled=$(grep -Eq '[^#]*ac_add_options --disable-eme' mozconfig-backup && echo 1 || echo 0)
  mv mozconfig-backup .mozconfig
  if   (( ! is_eme_opt_valid &&   is_eme_disabled ))
  then echo "ERROR: '--disable-eme' should not be in .mozconfig"     ; return 1 ;
  elif ((   is_eme_opt_valid && ! is_eme_disabled ))
  then echo "ERROR: DRM (aka: EME) is not disabled in .mozconfig"    ; return 1 ;
  elif (( ! was_configure_success ))
  then [[ -n "${invalid_opts}" ]] || cat configure.log
       echo -e "ERROR: \`./mach configure\` failed\n${invalid_opts}" ; return 1 ;
  else rm configure.log
  fi

  # In this test, jq collects values of the following keys of mozinfo.json into array,
  # and checks if any of them are not equal to false, in which case it returns "true".
  # E.g. if the value of any key is true or null (in case the key is missing from mozinfo.json),
  # that means the build configuration has to be reworked.
  local antifeature_keys=( .crashreporter .datareporting .healthreport .normandy .telemetry .updater )
  local antifeatures_enabled=()
  for key in ${antifeature_keys[*]}
  do  if   jq -e "${key} != false" "${obj_directory}"/mozinfo.json &> /dev/null
      then antifeatures_enabled+=( ${key} )
      fi
  done
  if   (( ${#antifeatures_enabled[*]} ))
  then echo "ERROR: Some anti-features are not disabled - aborting:"
       printf "  - %s is enabled\n" ${antifeatures_enabled[*]}
       return 1
  fi

  popd > /dev/null

  echo "Checking build configuration - READY"
}


## FSDG patching ##

mksource() {
  cd firefox-$pkgver

  # delete unused code, such as android build support
  echo "Removing unused code..."
#   rm -rfv mobile/ # TODO: lets try to prune this
  rm -v toolkit/crashreporter/tools/upload_symbols.py

  # Upstream tarball can contain some ignored cruft,
  # including binaries (for example, python3).
  echo "Removing files specified in .gitignore..."
  git init -b master && git clean -dfX                                      \
    --exclude='!ipc/chromium/src/third_party/libevent/evconfig-private.h'   \
    --exclude='!toolkit/crashreporter/google-breakpad/src/third_party/lss/' \
    --exclude='!third_party/python/**/*.egg-info/'                          \
    --exclude='!gfx/cairo/cairo/src/cairo-features.h'
  rm -rf .git/
  echo "removing pre-built bits"
  rm -frv third_party/rust/winapi-{i686,x86_64}-pc-windows-gnu/**/*.a | sed 's|/[^/]*\.a$|/*.a|' | sort -u
  find \( ! -name 'test_remote_settings_startup_bundle.js' \
    -iregex '.+test.+bundle\.js' -o -iregex '.+[_.]min\.js' -o -name 'minified.js' \) -exec rm -v {} \;

  sed -i '/mappings.wasm/d' devtools/client/shared/vendor/source-map/lib/moz.build
  sed -i '/\.wasm/d' toolkit/components/pdfjs/jar.mn
  find -name '*.wasm' -exec rm -v {} \;

  sed -i '/vendor\//d' toolkit/components/ml/jar.mn
  rm -frv toolkit/components/ml/vendor

  # Remove test-related networking dumps, because they contain code from
  # some Amazon webpage with no clear licensing, thus nonfree.
  # Also they interfere with checking of Remote Settings patching done later,
  # because communication with RS server has been captured in them too.
  rm python/mozperftest/mozperftest/system/example.zip
  rm testing/mozbase/mozproxy/tests/files/mitm5-linux-firefox-amazon.zip

  # Disable various components at the source level
  sed -i 's/;1/;0/' toolkit/components/telemetry/components.conf
  sed -Ei 's/((MOZ_SERVICES_HEALTHREPORT|MOZ_NORMANDY).+)True/\1False/' browser/moz.configure
  #sed -i 's/;1/;0/' browser/experiments/Experiments.manifest
  #sed -i '/pocket/d'          browser/extensions/moz.build
  #sed -i '/activity-stream/d' browser/extensions/moz.build

  # Disable/neutralize Remote Settings (as best we can)
  local branding_srcdir="${srcdir}"/${pkgname}-${_brandingver}
  python ../process-json-files.py "${srcdir}"/firefox-${pkgver} "${branding_srcdir}"
  echo "applying 9001-FSDG-sync-remote-settings-with-local-dump.patch"
  patch -Np1 --no-backup-if-mismatch -i "${srcdir}"/9001-FSDG-sync-remote-settings-with-local-dump.patch

  # disable various phone-home/goelocation anti-featires
  echo "applying 9002-FSDG-preference-defaults.patch"
  patch -Np1 --no-backup-if-mismatch -i "${srcdir}"/9002-FSDG-preference-defaults.patch

  # over-ride/install default URI protocol handlers
  echo "applying 9003-FSDG-urihandlers.patch"
  patch -Np1 --no-backup-if-mismatch -i "${srcdir}"/9003-FSDG-urihandlers.patch

  # Remove remaining non-free bits
  echo "applying 9004-FSDG-misc.patch"
  patch -Np1 --no-backup-if-mismatch -i "${srcdir}"/9004-FSDG-misc.patch


  ## FSDG patching checks ##

  _check_patching
}


## business ##

prepare() {
  mkdir mozbuild
  cd firefox-$pkgver

  ## general technical patching ##

  # Make different channels installable in parallel
  patch -Np1 -i ../0001-Install-under-remoting-name.patch

  # Fix RDD crashes with Mesa 25.3
  patch -Np1 -i ../0002-Bug-1995035-Allow-F_DUPFD_QUERY-in-the-Linux-sandbox.patch

  # Unbreak build with python-zstandard 0.25.0
  echo "applying zstandard-0.25.0.diff"
  patch -Np1 -i ../zstandard-0.25.0.diff

  # Use system python-typing-extensions instead of the old vendored one to avoid
  # unresolvable dependency versions. They are probably downloaded when network
  # connectivity is enabled at built time, but that is not the case for Parabola.
  echo "deleting vendored 'python-typing-extensions'"
  rm -rfv third_party/python/typing_extensions | grep -Fq '' # de-vendoring

  # FTBS with LLVM:
  # intl/lwbrk/LineBreaker.cpp:459:17: error: static assertion failed due to requirement 'U_LB_COUNT == std::size(sUnicodeLineBreakToClass)': Gecko vs ICU LineBreak class mismatch
  # appears to be: https://bugzilla.mozilla.org/show_bug.cgi?id=1843007#c1
  # but --with-system-icu is still needed
  # crude fix, adapted from linuxfromscratch https://wiki.linuxfromscratch.org/blfs/ticket/22333
  sed -e '/VIRAMA = 47/a CLASS_CHARACTER,' \
    -i intl/lwbrk/LineBreaker.cpp


  ## [ARCH-SPECIFIC TECHNICAL PATCHING] ##

  case ${CARCH} in
  aarch64|armv7h)
    # Make different channels installable in parallel
    (( _has_duplicate_remotingname_patch )) || # arch applies it sometimes (above)
    patch -Np1 -i ../0001-Install-under-remoting-name.patch

    # ld.lld: error: undefined hidden symbol: std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::append(char const*)
    # ld.lld: error: undefined hidden symbol: std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::append(char const*, unsigned int)
    # ld.lld: error: undefined hidden symbol: std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::assign(char const*)
    # ld.lld: error: undefined hidden symbol: std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::operator=(std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>> const&)
    # ld.lld: error: undefined hidden symbol: std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::resize(unsigned int, char)
    # ld.lld: error: undefined hidden symbol: std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::insert(unsigned int, char const*)
    # ld.lld: error: undefined hidden symbol: std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::push_back(char)
    # ld.lld: error: undefined hidden symbol: std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__grow_by(unsigned int, unsigned int, unsigned int, unsigned int, unsigned int, unsigned int)
    # derived from: https://hg-edge.mozilla.org/integration/autoland/rev/7fcd412689f5
    sed -i 's|if target.kernel in ("Darwin", "FreeBSD", "OpenBSD"|&, "Linux"|' build/moz.configure/toolchain.configure
    ;;
  i686)
    # readelf: Error: Unable to seek to 0x801db328 for section headers
    echo "applying avoid-libxul-OOM-python-check.patch"
    patch -p1 -i ../avoid-libxul-OOM-python-check.patch

    # https://bugzilla.mozilla.org/show_bug.cgi?id=1729459
    # modules/fdlibm/src/math_private.h:34:21: error: conflicting declaration ‘typedef __double_t double_t’
    # /usr/include/math.h:156:21: note: previous declaration as ‘typedef long double double_t’
    echo "applying firefox-111.0.1-fdlibm.patch"
    patch -p1 -i "$srcdir/firefox-111.0.1-fdlibm.patch"

    # js/src/jit/shared/AtomicOperations-shared-jit.cpp:88:9: error: ‘AtomicCopyByteUnsynchronized’ was not declared in this scope; did you mean ‘AtomicMemcpyUpUnsynchronized’?
    echo "applying fix-i686-build-moz-1792159.patch"
    patch -p1 -i "$srcdir/fix-i686-build-moz-1792159.patch"

    # https://bugs.archlinux32.org/index.php?do=details&task_id=332
    # dom/base/nsTextFragmentGeneric.h:38:16: error: ‘any’ is not a member of ‘xsimd’
    # dom/base/nsTextFragmentGeneric.h:16:70: error: incomplete type ‘xsimd::batch<short int, xsimd::sse2>’ used in nested name specifier
    # dom/base/nsTextFragmentGeneric.h:35:31: error: ‘xsimd::batch<short int, xsimd::sse2> vectmask’ has incomplete type
    # dom/base/nsTextFragmentGeneric.h:37:64: error: incomplete type ‘xsimd::batch<short int, xsimd::sse2>’ used in nested name specifier
    echo "applying fix-i686-xsimd-incomplete.patch"
    patch -p1 -i "$srcdir/fix-i686-xsimd-incomplete.patch"
    ;;
  x86_64)
    ;;
  esac


  ## libre patching (mainly handled per mksource()) ##


  ## general configuration ##

  echo -n "$_google_api_key" >google-api-key

  cat >../mozconfig <<END
ac_add_options --enable-application=browser
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd
ac_add_options --enable-linker=lld
ac_add_options --disable-install-strip
ac_add_options --disable-bootstrap
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

# Branding
ac_add_options --disable-official-branding                 # branding over-ride
ac_add_options --enable-update-channel=release
ac_add_options --with-distribution-id=nu.parabola          # branding over-ride
ac_add_options --with-branding=browser/branding/${pkgname} # branding over-ride
ac_add_options --with-app-name=${pkgname}                  # branding over-ride
ac_add_options --with-app-basename=${pkgname}              # branding over-ride
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
# export MOZILLA_OFFICIAL=1                                # branding over-ride
export MOZ_APP_REMOTINGNAME=$pkgname
export MOZ_TELEMETRY_REPORTING=
export MOZ_REQUIRE_SIGNING=

# Keys
# ac_add_options --with-google-location-service-api-keyfile=${PWD@Q}/google-api-key # anti-feature
# ac_add_options --with-google-safebrowsing-api-keyfile=${PWD@Q}/google-api-key     # anti-feature

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss

# Features
ac_add_options --enable-alsa
ac_add_options --enable-jack
ac_add_options --disable-crashreporter # anti-feature
ac_add_options --disable-updater
ac_add_options --disable-tests
ac_add_options --disable-eme           # anti-feature
END


  ## de-vendor system libs ##

  cat >> ../mozconfig <<EOF
ac_add_options --with-system-ffi
ac_add_options --with-system-icu
ac_add_options --with-system-jpeg
ac_add_options --with-system-libevent
ac_add_options --with-system-libvpx
ac_add_options --with-system-nspr
ac_add_options --with-system-nss
ac_add_options --with-system-pixman
# ac_add_options --with-system-png # ERROR: --with-system-png won't work because the system's libpng doesn't have APNG support
ac_add_options --with-system-webp
ac_add_options --with-system-zlib
EOF


  ## [ARCH-SPECIFIC CONFIG] ##

  case ${CARCH} in
  aarch64|armv7h)
    # archarm configuration #

    # archarm recipe has mozconfig over-rides under the 'general configuration' section
    # NOTE: '--disable-eme' is currently an invalid option for armv7h.
    #       It must be deleted in order to compile.
    #       If ever it becomes valid, it should not be deleted below.
    sed -i '
      /--enable-hardening/d
      /--enable-optimize/d
      /--enable-rust-simd/d
      s| --with-wasi-sysroot=.*| --without-wasm-sandboxed-libraries|
      /--disable-eme/d
    ' ../mozconfig

    if [[ $CARCH == "armv7h" ]]; then
      # `--disable-elf-hack` is handled oddly - rather than minimizing the diff against arch
      # as it does for the other deleted options above, the archarm PKGBUILD omits it from
      # the 'general configuration' section, then declares it here for armv7 only
      echo "ac_add_options --disable-elf-hack" >> .mozconfig

      # archarm MAKEFLAGS are under the '[ARCH-SPECIFIC BUILD ENV]' section

      # archarm 'rust.mk' over-rides are under the '[ARCH-SPECIFIC BUILD CONFIG]' section
      # (also, for all arches, under the 'compiler and optimization tweaks' section)

      # webrtc on ARMv7 implies android, so disable it
      echo "ac_add_options --disable-webrtc" >> .mozconfig
    elif [[ $CARCH == "aarch64" ]]; then
      echo 'ac_add_options --enable-rust-simd' >> .mozconfig
      sed -i '/--disable-elf-hack/d' ../mozconfig
    fi

    echo 'ac_add_options --enable-optimize="-g0 -O2"' >> .mozconfig
    echo "mk_add_options MOZ_MAKE_FLAGS=\"${MAKEFLAGS}\"" >> .mozconfig

    # archarm `export` commands are under the '[ARCH-SPECIFIC BUILD ENV]' section

    # archarm patching is under the '[ARCH-SPECIFIC TECHNICAL PATCHING]' section

    # NOTE: At this point in the recipe, the arch, arch32, and parabola PKGBUILDs
    # have prepared a temporary ${srcdir}/mozconfig; but the archarm PKGBUILD
    # writes directly to the final firefox-$pkgver/.mozconfig.
    # We allowed .mozconfig to be written above, only to minimize the diff against archarm.
    # For consistency across arches, we append those changes to ${srcdir}/mozconfig now.
    # Later, ${srcdir}/mozconfig will clobber firefox-$pkgver/.mozconfig during build().
    cat .mozconfig >> ../mozconfig
    ;;
  i686)
    # arch32 configuration #

    # FIXME: see note in 'dependency tweaks' section
    sed -i 's| --with-wasi-sysroot=.*| --without-wasm-sandboxed-libraries|' ../mozconfig

    # arch32 `export` commands are under the '[ARCH-SPECIFIC BUILD ENV]' section

    # arch32 toolchain.configure patching is under the '[ARCH-SPECIFIC BUILD ENV]' section

    # arch32 recipe has mozconfig over-rides in mozconfig-i686.patch
    cat >>../mozconfig <<END
ac_add_options --disable-webrtc
END

    # arch32 patching is under the '[ARCH-SPECIFIC TECHNICAL PATCHING]' section
    ;;
  x86_64)
    ;;
  *) echo "no [ARCH-SPECIFIC CONFIG] for arch: ${CARCH}" ; return 1 ;
    ;;
  esac


  ## compiler and optimization tweaks ##

  if   (( _USE_ALT_COMPILER ))
  then cat >> ../mozconfig <<END
export CC=gcc
export CXX=g++
export AR=gcc-ar
export NM=gcc-nm
export RANLIB=gcc-ranlib
END
  fi

  if   (( _USE_ALT_LINKER ))
  then sed -i '/cargo_rustc_flags += -Clto/d' config/makefiles/rust.mk
       cat >> ../mozconfig <<END
ac_add_options --disable-linker=lld
ac_add_options --enable-linker=bfd
ac_add_options --disable-lto
ac_add_options --disable-rust-simd
ac_add_options --disable-debug
ac_add_options --disable-debug-symbols
END
  fi

  # Mainly for x86_64, this is the union of explicit optimizations for 32-bit builds.
  # These are maintained manually, collected from the various '[ARCH-SPECIFIC *]' sections.
  if   (( _USE_LESS_MEMORY ))
  then # reduce jobs due to RAM constraints
       export MAKEFLAGS+=' -j'${_N_JOBS:-4}
       echo 'ac_add_options --enable-optimize="-g0 -O2"' >> ../mozconfig
       echo "mk_add_options MOZ_MAKE_FLAGS=\"${MAKEFLAGS}\"" >> ../mozconfig

       # disable hard-coded LTO
       sed -i '/cargo_rustc_flags += -Clto/d' config/makefiles/rust.mk
       sed -i '/RUSTFLAGS += -Cembed-bitcode=yes/d' config/makefiles/rust.mk

       # increase codegen-units due to RAM constraints
       sed -i 's/codegen-units=1/codegen-units=16/' config/makefiles/rust.mk

       # specify tmp directory outside /tmp due to RAM constraints
       mkdir "$srcdir"/tmp
       export CARGO_TARGET_DIR="$srcdir"/tmp

       # avoid excessive debug symbols in rust leading to out-of-memory situations
       sed -i "s/debug_info = '\''2'\''/debug_info = '\''0'\''/" build/moz.configure/toolchain.configure

       # try hard to tell ld and rust not to use too much memory (no lto, no debug info, etc.)
       export RUSTFLAGS+=" -Cdebuginfo=0 -Clto=off"
       export LDFLAGS+=" -Wl,--no-keep-memory "
  fi


  ## branding ##

  local branding_srcdir="${srcdir}"/${pkgname}-${_brandingver}
  local branding_destdir="${srcdir}"/firefox-${pkgver}/browser/branding/${pkgname}
  local tippytopdir="${srcdir}"/firefox-${pkgver}/browser/components/topsites/content/tippytop
  local data www_url image_url favicon_url icon_base64 title desc
  declare -i link_n=0

  # setup default bookarks
  local distini="${srcdir}"/distribution.ini
  echo -e "\n[BookmarksToolbar]" > "${distini}"
  jq -c '.[]' "${tippytopdir}"/top_sites.json |
  while read data
  do    link_n=$(( link_n + 1 ))
        www_url=$(     jq -c '.domains[0]'  <<<${data} )
        image_url=$(   jq -c '.image_url'   <<<${data} ) ; image_url=https://${www_url}/${image_url}          ;
        favicon_url=$( jq -c '.favicon_url' <<<${data} ) ; favicon_url=https://${www_url}/${favicon_url}      ;
        title=$(       jq -c '.description' <<<${data} ) ; desc=${desc}                                       ; # TODO: branding package
        icon_base64=$( jq -c '.icon_base64' <<<${data} ) ; icon_base64="data:image/png;base64,${icon_base64}" ; # TODO: branding package
        echo "item.${link_n}.title=${title}"      >> "${distini}"
        echo "item.${link_n}.link=${www_url}"     >> "${distini}"
        echo "item.${link_n}.description=${desc}" >> "${distini}"
        echo "item.${link_n}.icon=${favicon_url}" >> "${distini}"
#         echo "item.${link_n}.iconData=${icon_base64}" >> "${distini}"
  done

  # "About Iceweasel" strings
  local friendly_name=${pkgname^}
  declare -A langs=( [de]="${friendly_name} für Parabola GNU/Linux-libre"
                     [eo]="${friendly_name} por Parabola GNU/Linux-libre"
                     [es-ES]="${friendly_name} para Parabola GNU/Linux-libre"
                     #[fr]="${friendly_name} for Parabola GNU/Linux-libre" # TODO:
                     [gl]="${friendly_name} para Parabola GNU/Linux-libre"
                     #[it]="${friendly_name} for Parabola GNU/Linux-libre" # TODO:
                     #[pl]="${friendly_name} for Parabola GNU/Linux-libre" # TODO:
                     [pt-BR]="${friendly_name} para Parabola GNU/Linux-libre" )
  echo -e "\n[Global]"                                               >> "${distini}"
  for lang in ${!langs[*]} ; do echo "about.${lang}=${langs[$lang]}" >> "${distini}" ; done ;

  # WIP: misc config tweaks # TODO: move to new VCS file if useful
  echo -e "\n# WIP # TODO: do these (and which) have any effect on this build?\n
[Global]
browser.newtabpage.enhanced=false
browser.search.geoSpecificDefaults=false

[LocalizablePreferences]
browser.startup.homepage=\"https://www.parabola.nu\"" >> "${distini}"

  # apply branding package
  echo "applying parabola branding"
  export QUILT_PATCHES="${branding_srcdir}"/patches
  export QUILT_REFRESH_ARGS='-p ab --no-timestamps --no-index'
  export QUILT_DIFF_ARGS='--no-timestamps'
  export QUILT_PC="${srcdir}"/.pc
  rm -rf -- "${branding_destdir}"
  cp -aT -- "${branding_srcdir}"/branding "${branding_destdir}"
  quilt push -av

  pushd "${branding_destdir}" > /dev/null

  # generate icons, logos, banners
  local blank_svg='<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"></svg>' # TODO: move to branding package
  echo "generating branding images"
  for size in 16 22 24 32 48 64 128 256
  do  rsvg-convert -w ${size} -h ${size}  iceweasel_icon.svg -o default${size}.png
  done
  cp                     iceweasel_logo.svg                        content/aboutlogins.svg
  cp                     iceweasel_logo.svg                        content/about-logo.svg
#   cp                     iceweasel_logo.svg                        content/about-logo.svg # RuntimeError: File "about-logo.svg" not found in browser/branding/iceweasel/content
  rsvg-convert -a -w 192 iceweasel_logo.svg                     -o content/about-logo.png
  rsvg-convert -a -w 384 iceweasel_logo.svg                     -o content/about-logo@2x.png
  cp                     content/about-logo.png                    content/about-logo-private.png
  cp                     content/about-logo@2x.png                 content/about-logo-private@2x.png
  echo "${blank_svg}"                                            > content/${pkgname}-symbolic.svg # TODO: move to branding package
  cp                     content/${pkgname}-symbolic.svg           "${srcdir}"/${pkgname}-symbolic.svg # minimize diff (in package())
  cp                     ../unofficial/document.ico                document.ico
  cp                     ../unofficial/content/document_pdf.svg    content/document_pdf.svg

  popd > /dev/null

  # custom new tab page
  # FIXME: the newtab page (aka "Start Page") has changed significantly
  #        the new upstream start page ('activity-streams') is an add-on now
  #        it must be forked and customized externally, then copied into the browser tree
  #        see: the branding-dev-build/ dir on the '68.0' branch of the branding git repo
  #        some of the branding components above and commented out below may no longer be used
  #        the following section aims to restore something similar
  #          to the previous parabola-branded "start page"
  #        once it is working well, all of these comments should be removed
  #          and any unused branding components may be deleted from the branding package
  # Put "Start Page" branding images in the source code
  # install -m644 -t browser/base/content/abouthome -- \
  #   "${branding_srcdir}"/branding/{drm-free,gnu_headshadow,parabola-banner}.png
  # install -m644 -t browser/extensions/onboarding/content/img -- \
  #   "${branding_srcdir}"/branding/watermark.svg

  # process default Top Sites and their icons
  echo "deleting unused \"Top Sites\""
  find "${tippytopdir}" -type f    \
       -not -name 'wikipedia-org*' \
       -not -name 'top_sites.json' \
       -exec rm -v {} \;
  [[ "${CARCH}" != armv7h ]] || export MAGICK_TIME_LIMIT=300 # magick: time limit exceeded
  for image in "${branding_srcdir}"/tippytop/*.svg; do
    local outname=$(basename -s .svg "${image}")
    local size=$(identify -format '%wx%h' "${tippytopdir}"/images/wikipedia-org@2x.png)
    local background=$( [[ "${outname}" == 'gnu' ]] && echo 'white' || echo 'none' )
    magick -density 300 ${image}                           \
           -gravity center -resize ${size} -extent ${size} \
           "${tippytopdir}"/images/${outname}@2x.png

    size=256x256
    magick -density 300 -background ${background} ${image} \
           -gravity center -resize ${size} -extent ${size} \
           -define icon:auto-resize=64,48,32,16            \
           "${tippytopdir}"/favicons/${outname}.ico
  done

  # misc branding
  sed -i "s|({ \$bits }-bit)|($CARCH)|" browser/locales/en-US/browser/aboutDialog.ftl


  ## search-engines ##

  pushd browser/components/search/extensions > /dev/null

  # Delete unused search engine configs
  echo "deleting unused search engine configs"
  find -mindepth 1 -maxdepth 1 \
       -not -name ddg          \
       -not -name wikipedia    \
       -exec rm -fr {} \;

  popd > /dev/null
}

build() {
  cd firefox-$pkgver


  ## general build env ##

  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=system # parabola policy
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZ_BUILD_DATE="$(date -u${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH} +%Y%m%d%H%M%S)"
  export MOZ_NOSPAM=1

  # malloc_usable_size is used in various parts of the codebase
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

  # Breaks compilation since https://bugzilla.mozilla.org/show_bug.cgi?id=1896066
  CFLAGS="${CFLAGS/-fexceptions/}"
  CXXFLAGS="${CXXFLAGS/-fexceptions/}"

  # LTO needs more open files
  ulimit -n 4096

  if ! (( _USE_ALT_COMPILER ))
  then # clang-16: error: unknown argument: '-fvar-tracking-assignments'
       export CFLAGS="${CFLAGS/-fvar-tracking-assignments/}"
       export CXXFLAGS="${CXXFLAGS/-fvar-tracking-assignments/}"
  fi


  ## [ARCH-SPECIFIC BUILD ENV] ##

  case ${CARCH} in
  aarch64|armv7h)
    export MOZ_DEBUG_FLAGS=" "
    export CFLAGS+=" -g0"
    export CXXFLAGS+=" -g0"
    export LDFLAGS+=" -Wl,--no-keep-memory"
#     export RUSTFLAGS+=" -Cdebuginfo=0 -Clto=off"
    export RUSTFLAGS+=" -Cdebuginfo=0"
    export MAKEFLAGS+=" -j${_N_JOBS:-1}"

    # clang-16: warning: argument unused during compilation: '-fstack-clash-protection' [-Wunused-command-line-argument]
    if ! (( _USE_ALT_COMPILER ))
    then export CFLAGS+=' -Wno-unused-command-line-argument'
         export CXXFLAGS+=' -Wno-unused-command-line-argument'
    fi

    # ld.lld: error: version script assignment of <MANY> to symbol <MANY> failed: symbol not defined
    # this was supposedly fixed in LLVM 17 https://reviews.llvm.org/D135402
    # but could also be de to using a version of LLVM (18) other than rust's vendored version (17)
    # https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=277075#c12
    (( _USE_ALT_LINKER )) || export LDFLAGS+=" -Wl,--undefined-version"
    ;;
  i686)
    # -fno-plt with cross-LTO -> LLVM ERROR: Function Import: link error
    CFLAGS="${CFLAGS/-fno-plt/}"
    CXXFLAGS="${CXXFLAGS/-fno-plt/}"

    # try hard to tell ld and rust not to use too much memory (no lto, no debug info, etc.)
    export RUSTFLAGS+=" -Cdebuginfo=0 -Clto=off"
    export LDFLAGS+=" -Wl,--no-keep-memory " # -Wl,--reduce-memory-overheads -Wl,--max-cache-size=16384000 "
    export MOZ_SOURCE_CHANGESET="DEVEDITION_${pkgver//./_}_RELEASE"
    export MAKEFLAGS+=" -j${_N_JOBS:-1}"

    # libvpx has some hard-coded compiler flags for MMX, SSE, SSE2, use the correct one
    # per CARCH (75.0 uses an intrisic _mm_empty now, which required the corresponding
    # architecture flag to be preset - before it was merely embedding some assembly
    # code with EMMS
    export CFLAGS+=" -mmmx"
    export CXXFLAGS+=" -mmmx"
    ;;
  x86_64)
    ;;
  *) echo "no [ARCH-SPECIFIC BUILD ENV] for arch: ${CARCH}" ; return 1 ;
    ;;
  esac
  export CFLAGS
  export CXXFLAGS
  export LDFLAGS+=' -licuuc' # FIXME: v136 build failed --with-system-icu with ICU 76.1


  ## [ARCH-SPECIFIC BUILD CONFIG] ##

  case ${CARCH} in
  aarch64|armv7h)
    # disable hard-coded LTO
    sed -i '/cargo_rustc_flags += -Clto/d' config/makefiles/rust.mk
    sed -i '/RUSTFLAGS += -Cembed-bitcode=yes/d' config/makefiles/rust.mk
    # increase codegen-units due to RAM constraints
    sed -i 's/codegen-units=1/codegen-units=16/' config/makefiles/rust.mk
    # specify tmp directory outside /tmp due to RAM constraints
    mkdir "$srcdir"/tmp
    export CARGO_TARGET_DIR="$srcdir"/tmp
    ;;
  i686)
    # avoid excessive debug symbols in rust leading to out-of-memory situations
    sed -i "s/debug_info = '\''2'\''/debug_info = '\''0'\''/" build/moz.configure/toolchain.configure
    ;;
  x86_64)
    ;;
  *) echo "no [ARCH-SPECIFIC BUILD CONFIG] for arch: ${CARCH}" ; return 1 ;
    ;;
  esac


  ## PGO build ##

  if (( _SKIP_PGO ))
  then
    # skipping "3-tier PGO" "instrumented browser"; so the final .mozconfig is ready now
    cp ../mozconfig .mozconfig
  else
    # Do 3-tier PGO
    echo "Building instrumented browser..."
    cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate=cross
END
    _check_build_config # FSDG check
    ./mach build --priority normal

    echo "Profiling instrumented browser..."
    ./mach package
    LLVM_PROFDATA=llvm-profdata JARLOG_FILE="$PWD/jarlog" \
      dbus-run-session \
      xvfb-run -s "-screen 0 1920x1080x24 -nolisten local" \
      ./mach python build/pgo/profileserver.py

    stat -c "Profile data found (%s bytes)" merged.profdata
    test -s merged.profdata

    stat -c "Jar log found (%s bytes)" jarlog
    test -s jarlog

    echo "Removing instrumented browser..."
    ./mach clobber objdir

    echo "Building optimized browser..."
    cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto=cross,full
ac_add_options --enable-profile-use=cross
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END
  fi # _SKIP_PGO


  ## FSDG config checks ##

  _check_build_config


  ## main build ##

  (( ! _SKIP_PGO )) ||
  echo "Building optimized browser..."
  ./mach build --priority normal
}

package() {
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"         # needed for `{libre,}makepkg -R`
  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=system # needed for `{libre,}makepkg -R`


  ## general install ##

  cd firefox-$pkgver
  DESTDIR="$pkgdir" ./mach install

  # basic vendor.js configuration
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

// Enable GNOME Shell search provider
pref("browser.gnome-search-provider.enabled", true);
END

  # Parabola additions to vendor.js
  cat "${srcdir}"/vendor.js.in >> "${vendorjs}"

  # basic distribution.ini configuration
  local distini="$pkgdir/usr/lib/$pkgname/distribution/distribution.ini"
  install -Dvm644 /dev/stdin "$distini" <<END
[Global]
id=parabola
version=(${_brandingver}-${_brandingrel} branding)
about=${pkgname^} for Parabola GNU/Linux-libre

[Preferences]
app.distributor=parabola
app.distributor.channel=$pkgname
app.partner.parabola=parabola
END

  # Parabola additions to distribution.ini
  cat "${srcdir}"/distribution.ini >> "${distini}"

  # Link up system ONNX runtime
  # non-free ONNX disabled

  # Install desktop icons and metadata
  local i theme=official
  theme=$pkgname # NOTE: browser/branding/$theme is $branding_destdir in prepare()
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

  install -Dvm644 ../$pkgname-symbolic.svg -t "$pkgdir/usr/share/icons/hicolor/symbolic/apps"
  install -Dvm644 ../$pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dvm644 ../nu.parabola.$pkgname.metainfo.xml -t "$pkgdir/usr/share/metainfo" # branding over-ride

  # Install a wrapper to avoid confusion about binary path
  install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<END
#!/bin/sh
exec /usr/lib/$pkgname/firefox "\$@"
END
  sed -i "s|/firefox |/${pkgname} |" "$pkgdir/usr/bin/$pkgname" # minimize diff


  ## [ARCH-SPECIFIC INSTALL] ##

  case ${CARCH} in
  aarch64|armv7h)
    ;;
  i686)
    # libxul.so cannot find it's libraries
    install -dm 755 "${pkgdir}/etc/ld.so.conf.d"
    echo "/usr/lib/${pkgname}" > "${pkgdir}"/etc/ld.so.conf.d/${pkgname}.conf
    ;;
  x86_64)
    ;;
  *) echo "no [ARCH-SPECIFIC INSTALL] for arch: ${CARCH}" ; return 1 ;
    ;;
  esac

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/bin/$pkgname" "$pkgdir/usr/lib/$pkgname/firefox-bin"
  mv "$pkgdir/usr/lib/$pkgname/firefox-bin" "$pkgdir/usr/lib/$pkgname/$pkgname-bin" # minimize diff

  # TODO: The code block below was removed from the upstream PKGBUILD in 140.0 release.
  # Need to check if that's because upstream uses Remote Settings to update them.
  # If that's the case, Iceweasel still needs this block, as it has networking access
  # to Remote Settings disservices disabled. It's important to keep certs up to date
  # for security reasons, please see "Disable CRLite entirely for now" patch from the
  # 9001-FSDG-sync-remote-settings-with-local-dump.patch for details.

  # Use system certificates
  local nssckbi="$pkgdir/usr/lib/$pkgname/libnssckbi.so"
  if [[ -e $nssckbi ]]; then
    ln -srfv "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
  fi

  # Configure GNOME Shell search provider
  local sprovider="$pkgdir/usr/share/gnome-shell/search-providers/$pkgname.search-provider.ini"
  install -Dvm644 /dev/stdin "$sprovider" <<END
[Shell Search Provider]
DesktopId=$pkgname.desktop
BusName=org.mozilla.${pkgname//-/_}.SearchProvider
ObjectPath=/org/mozilla/${pkgname//-/_}/SearchProvider
Version=2
END

  # BEGIN RENAME_PROFILE - temporary
  # Replace binary with a temporary wrapper, to rename the user profile directory
  #
  # NOTE: Prior to v98.0, per-user Iceweasel storage was under ~/.mozilla/firefox.
  #       Prior to v137.0, it was under ~/.mozilla/iceweasel.
  #       Since v137.0, it is expected to be ~/.parabola/iceweasel.
  # TODO: This has implications for ice{cat,dove,ape} as well.
  #       Eg: will (or should) icecat expect its user profile at ~/.gnuzilla/icecat?
  #       Let's take this opportunity to tame it once and for all, by patching the source
  #       such that we control the location (eg: ~/.local/share/parabola/),
  #       and hopefully never need to impose this hurdle again.
  #       We did it via MOZ_APP_PROFILE=mozilla/iceweasel in the branding package.
  #       Why did that not change? Is it ignored now? Where is our handle on this now?
  # TODO: This 'rename-profile.sh' source file, and the following two LOC,
  #       could be removed after a reasonable deprecation period (eg: in 2026).
  mv                                  "${pkgdir}"/usr/lib/iceweasel/ice{,-}weasel
  install -Dm755 ../rename-profile.sh "${pkgdir}"/usr/lib/iceweasel/iceweasel
  # END RENAME_PROFILE
}


# BEGIN RENAME_PROFILE - temporary - see note in package()
depends+=(gxmessage) ; source+=(rename-profile.sh) ;
sha256sums+=('b7ee08052c6d75fd68ad4ab394ed3b5785e6e706785e4479eaeba1692cd8db42')
b2sums+=('8162833a40513a48c49387bd1ab18c93378ec56be02a8a943737b7256bbd28c5a4391e4d0122f54661585b28179ba97adee87a54c3eb2fa9cc2192b1ec6d8123')
# END RENAME_PROFILE
