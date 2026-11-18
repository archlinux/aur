# Maintainer: Emanuele Sparvoli <sparvoli@gmail.com>
pkgname=openxlr-yabridge
pkgver=5.1.1.54
pkgrel=7
pkgdesc="Tested Windows plugin bridge for OpenXLR, with the Wine editor input fix"
arch=('x86_64')
url="https://github.com/emaspa/openxlr"
license=('GPL-3.0-only' 'GPL-3.0-or-later')
depends=('wine' 'gcc-libs' 'glibc' 'libxcb' 'dbus')
makedepends=('meson' 'ninja' 'cmake' 'pkgconf' 'python' 'rust')
optdepends=('openxlr: the mixer that uses this bridge')
options=('!strip' '!debug' '!lto')
_openxlr=0.9.2
source=("${pkgname}-${pkgver}-openxlr-${_openxlr}-source.tar.xz::https://github.com/emaspa/openxlr/releases/download/v${_openxlr}/openxlr-yabridge-${pkgver}-source.tar.xz")
sha256sums=('cb4fb33ba47dab5df874ff6e13b04fb8385e09a2b08ce0cf98bc37c76559a7bf')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  # With rustup in place of the rust package, cargo needs a toolchain named.
  export RUSTUP_TOOLCHAIN=stable
  python3 openxlr-packaging/build.py build \
    --source "$srcdir/${pkgname}-${pkgver}" \
    --output "$srcdir/build" \
    --jobs "$(nproc)"
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python3 openxlr-packaging/build.py stage \
    --source "$srcdir/${pkgname}-${pkgver}" \
    --output "$srcdir/build" \
    --destdir "$pkgdir" \
    --prefix /usr \
    --manager arch
}
