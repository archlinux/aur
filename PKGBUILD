# Maintainer: unterschall <github.com.kitten172@passmail.com>
#
# librewolf-hellfire-git
# ----------------------
# VCS package: always tracks the `main` branch of the integration repo
#   https://codeberg.org/FailsafeDX/librewolf-hellfire
# (a fork of LibreWolf's `source` build system with HellFire's mozconfig — full
# LTO, PGO, -march=native, sandbox, JXL, strip — already applied).
#
# Because HellFire's mozconfig uses `-march=native`, this package produces a
# binary tuned to *your* CPU. For a portable prebuilt binary use
# librewolf-hellfire-bin instead.
#
# Unlike a tagged package, the Firefox version is only known after cloning HEAD,
# so the matching Firefox source is downloaded + GPG-verified by the upstream
# Makefile during prepare() rather than declared as a makepkg source.
#
# NOTE: This is a full Firefox/LibreWolf source build with LTO + PGO. Expect a
#       multi-hour compile and ~40 GB of free disk + plenty of RAM.

pkgname=librewolf-hellfire-git
pkgver=152.0.2_1.r0          # placeholder; the real value is set by pkgver()
pkgrel=1
pkgdesc="LibreWolf + HellFire optimizations, built from the latest upstream git (AVX2/SSE4.2, full LTO, hardened, sandboxed)"
arch=(x86_64)
url="https://codeberg.org/FailsafeDX/librewolf-hellfire"
license=(MPL-2.0)

_pkgbase=librewolf-hellfire   # base name used for desktop/icon artifacts
_appname=librewolf            # app-name / branding baked into the build

provides=(librewolf librewolf-hellfire)
conflicts=(librewolf librewolf-bin librewolf-hellfire librewolf-hellfire-bin)

depends=(
  alsa-lib at-spi2-core bash cairo dbus ffmpeg fontconfig freetype2
  gdk-pixbuf2 glib2 glibc gtk3 hicolor-icon-theme libpulse libx11 libxcb
  libxcomposite libxdamage libxext libxfixes libxrandr libxss libxt
  mime-types nspr nss pango ttf-font
)
makedepends=(
  base-devel git gnupg wget
  binutils cbindgen clang diffutils imake inetutils jack jq lld llvm mesa
  nasm nodejs pciutils python python-setuptools rust unzip yasm zip
  wasi-compiler-rt wasi-libc wasi-libc++ wasi-libc++abi
  # for the PGO profiling stage (HellFire sets MOZ_PGO=1)
  xorg-server-xvfb
)
optdepends=(
  'hunspell-en_US: Spell checking, American English'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland'
)

backup=('usr/lib/librewolf/librewolf.cfg'
        'usr/lib/librewolf/distribution/policies.json')
options=(!debug !emptydirs !lto !makeflags)
install="${pkgname}.install"

source=(
  "${pkgname}::git+https://codeberg.org/FailsafeDX/librewolf-hellfire.git"
  "${_pkgbase}.desktop"
)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  # <firefox-version>_<librewolf-release>.r<commit-count>, e.g. 152.0.2_1.r1234
  printf '%s_%s.r%s' "$(cat version)" "$(cat release)" "$(git rev-list --count HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"

  # The integration repo pulls LibreWolf's prefs/policies from a git submodule.
  git submodule update --init --depth 1

  # librewolf-patches.py copies assets/mozconfig.new, which this fork does not
  # ship; its assets/mozconfig is also wrapped in markdown ``` fences. Strip the
  # fences to produce the mozconfig.new that `make dir` expects. (-march=native
  # is left intact here — a local build tuned to this machine's CPU.)
  grep -v '^```' assets/mozconfig > assets/mozconfig.new

  # Download the matching Firefox release (GPG-verified by the Makefile) and
  # apply the LibreWolf + HellFire patch stack -> ./librewolf-<ver>-<rel>/.
  make dir

  local _ver _rel
  _ver="$(cat version)"; _rel="$(cat release)"

  # Append Arch-specific packaging options. mozconfig is processed in order, so
  # these override the upstream defaults where they overlap.
  cat >>"librewolf-${_ver}-${_rel}/mozconfig" <<END

# --- Arch packaging overrides (appended by PKGBUILD) ---
ac_add_options --prefix=/usr
ac_add_options --disable-bootstrap
ac_add_options --enable-linker=lld
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot
export CC='clang'
export CXX='clang++'
END
}

build() {
  cd "${srcdir}/${pkgname}"
  local _ver _rel
  _ver="$(cat version)"; _rel="$(cat release)"
  cd "librewolf-${_ver}-${_rel}"

  export MOZBUILD_STATE_PATH="${srcdir}/mozbuild"
  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip
  export MOZ_NOSPAM=1
  export MOZ_BUILD_DATE="$(date -u${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH} +%Y%m%d%H%M%S)"

  # LTO/PGO open a lot of files.
  ulimit -n 4096 || true

  # HellFire's mozconfig enables MOZ_PGO=1, so `mach build` runs an instrumented
  # browser to gather profiles. Provide a virtual display + dbus session for it.
  dbus-run-session -- \
    xvfb-run -a -s "-screen 0 1920x1080x24 -nolisten local" \
    ./mach build --priority normal
}

package() {
  cd "${srcdir}/${pkgname}"
  local _ver _rel
  _ver="$(cat version)"; _rel="$(cat release)"
  cd "librewolf-${_ver}-${_rel}"

  DESTDIR="${pkgdir}" ./mach install

  # Use system dictionaries.
  install -Dvm644 /dev/stdin \
    "${pkgdir}/usr/lib/${_appname}/browser/defaults/preferences/vendor.js" <<END
// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");
END

  install -Dvm644 /dev/stdin \
    "${pkgdir}/usr/lib/${_appname}/distribution/distribution.ini" <<END
[Global]
id=io.gitlab.${_appname}-community
version=1.0
about=LibreWolf HellFire

[Preferences]
app.distributor="LibreWolf HellFire"
app.distributor.channel=${_pkgbase}
app.partner.librewolf=${_pkgbase}
END

  # Icons (from the LibreWolf branding shipped in the patched source tree).
  for i in 16 32 48 64 128 256; do
    install -Dvm644 "browser/branding/${_appname}/default${i}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_pkgbase}.png"
  done
  install -Dvm644 "browser/branding/${_appname}/default16.png" \
    "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/${_pkgbase}-symbolic.png"

  install -Dvm644 "${srcdir}/${_pkgbase}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgbase}.desktop"

  # Launcher wrappers.
  install -Dvm755 /dev/stdin "${pkgdir}/usr/bin/${_appname}" <<END
#!/bin/sh
exec /usr/lib/${_appname}/${_appname} "\$@"
END
  ln -srfv "${pkgdir}/usr/bin/${_appname}" "${pkgdir}/usr/bin/${_pkgbase}"

  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "${pkgdir}/usr/bin/${_appname}" "${pkgdir}/usr/lib/${_appname}/${_appname}-bin"

  # Use the system CA store.
  local nssckbi="${pkgdir}/usr/lib/${_appname}/libnssckbi.so"
  [[ -e ${nssckbi} ]] && ln -srfv "${pkgdir}/usr/lib/libnssckbi.so" "${nssckbi}"
}
