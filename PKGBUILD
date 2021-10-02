# Maintainer: Daniel Eklöf <daniel at ekloef dot se>

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

pkgdesc="Wayland terminal emulator - fast, lightweight and minimalistic"
pkgname=foot
pkgver=1.9.2  # Don’t forget to update CHANGELOG.md
pkgrel=1
arch=('x86_64' 'aarch64')
url=https://codeberg.org/dnkl/foot
license=(mit)
changelog=CHANGELOG.md
depends=('libxkbcommon' 'wayland' 'pixman' 'fontconfig' 'libutf8proc' 'fcft' 'foot-terminfo')
makedepends=('meson' 'ninja' 'scdoc' 'python' 'ncurses' 'wayland-protocols' 'tllist')  # ‘llvm’, for PGO with clang
checkdepends=('check')
optdepends=('libnotify: desktop notifications'
            'xdg-utils: URI launching'
            'bash-completion: bash completions for foot itself')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=('5859d8d7293da4c7c52f45a9756fc7989edc364057e8b86b4e1fbea7bc2b4009')

build() {
  cd foot
  ./pgo/pgo.sh ${PGO} . build --prefix=/usr --wrap-mode=nodownload -Dterminfo=disabled
}

check() {
  cd foot
  ninja -C build test
}

package() {
  cd foot
  DESTDIR="${pkgdir}/" ninja -C build install
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
