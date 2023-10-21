# Maintainer: kraftwerk28 <kefirchik3 at gmail dot com>

# Select PGO (Performance Guided Optimizations) build type.
#
#  - auto: choose best available option
#
#  - none: disable PGO
#
#  - full-current-session: run a “full” PGO build in an existing
#    Wayland session. This will pop up a foot window running a script
#    that generates random terminal output.
#
#  - full-headless-sway: run a “full” PGO build inside a headless Sway
#    instance. Requires Sway >= 1.7.
#
#  - full-headless-cage: run a “full” PGO build inside a headless Cage
#    instance. Requires cage to be installed. Will generate lots of
#    Cage warnings, but seems to produce a fully working (and well
#    optimized) foot build.
#
#  - partial: run a “partial” PGO build. This requires neither a
#    running Wayland session, nor an installed Wayland compositor, but
#    the resulting binary is slower compared to “full” PGO builds
#    (though still faster than regular release builds).
#
# Note that “full-*” (which “auto” will prefer) requires an UTF-8
# locale. Either make sure LC_CTYPE is set to an UTF-8 locale, or do a
# “partial” PGO build (or disable PGO altoghether).

PGO=auto

_branch=add-extended-underlines
pkgdesc='Wayland terminal emulator - fast, lightweight and minimalistic'
pkgname=foot-ext-underline-git
pkgver=1.13.1.r449.ge95b52ed
pkgrel=2
conflicts=('foot' 'foot-git')
replaces=('foot-themes')
provides=('foot')
arch=('x86_64' 'aarch64')
url="https://codeberg.org/kraftwerk28/foot/src/branch/${_branch}"
license=(mit)
makedepends=('git' 'meson' 'ninja' 'scdoc' 'python' 'wayland-protocols' 'tllist')  # ‘llvm’, for PGO with clang
checkdepends=('check')
depends=('libxkbcommon' 'wayland' 'pixman' 'fontconfig' 'libutf8proc' 'ncurses' 'fcft>=3.0.0')
optdepends=("foot-terminfo: alternative to ncurses' terminfo, with additional non-standard capabilities"
            "libnotify: desktop notifications"
            "xdg-utils: URI launching"
            "bash-completion: bash completions for foot itself")
source=("git+https://codeberg.org/kraftwerk28/foot.git#branch=${_branch}")
sha256sums=('SKIP')

pkgver() {
  cd foot
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd foot
  ./pgo/pgo.sh \
    ${PGO} \
    . build \
    --prefix=/usr \
    --wrap-mode=nodownload \
    -Dterminfo=enabled \
    -Ddefault-terminfo=foot-ext-underline \
    -Dext-underline=enabled
}

check() {
  cd foot
  ninja -C build test
}

package() {
  cd foot
  DESTDIR="${pkgdir}/" ninja -C build install
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/foot/LICENSE"
}
