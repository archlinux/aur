# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgbase=libsigc++3
pkgname=(libsigc++3 libsigc++3-docs)
pkgver=3.0.6
pkgrel=1
pkgdesc="Callback Framework for C++"
url="https://libsigcplusplus.github.io/libsigcplusplus/"
arch=(x86_64)
license=(LGPL)
depends=(gcc-libs)
makedepends=(git mm-common meson)
options=(!emptydirs)
_commit=0f31f9ac23bf7db22928b01ecf9c3a372661817c  # tags/3.0.6^0
source=("git+https://github.com/libsigcplusplus/libsigcplusplus#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd libsigcplusplus
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd libsigcplusplus
}

build() {
  arch-meson libsigcplusplus build -D maintainer-mode=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

# Do not remove the space before the () or commitpkg will
# accidentally to run this function on the system (!!!) 
package_libsigc++3 () {
  provides=("libsigc++3.0=${pkgver}")
  replaces=('libsigc++3.0')
  conflicts=('libsigc++3.0')

  DESTDIR="$pkgdir" meson install -C build

  mkdir -p docs/usr/share
  mv "$pkgdir"/usr/share/{devhelp,doc} docs/usr/share
}

package_libsigc++3-docs() {
  pkgdesc+=" (documentation)"
  depends=()
  provides=("libsigc++3.0-docs=${pkgver}")
  replaces=('libsigc++3.0-docs')
  conflicts=('libsigc++3.0-docs')
  options=(!strip)

  mv docs/* "$pkgdir"
}
