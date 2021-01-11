# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

_pkgbasename=mesa-demos
pkgname=lib32-$_pkgbasename-git
pkgver=8.4.0
pkgrel=1
arch=(x86_64)
pkgdesc="Mesa demos and tools (32-bit)"
url="http://mesa3d.sourceforge.net"
license=('custom')
depends=('lib32-libgl' 'lib32-glew' 'mesa-demos')
makedepends=(gcc-multilib 'lib32-mesa')
provides=(lib32-mesa-demos)
conflicts=(lib32-mesa-demos)
source=("git+https://gitlab.freedesktop.org/mesa/demos")
sha512sums=('SKIP')
#validpgpkeys=('E390B9700582FAEA959ACAD41EEF53D38A3A9C67') # "Andreas Boll <andreas.boll.dev@gmail.com>"

pkgver() {
  cd demos
  git describe --tags | sed 's/-/+/g'
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd demos

  ./autogen.sh
  ./configure --prefix=/usr \
    --without-glut

  make
}

package() {
  depends=('lib32-glew' mesa-demos)

  cd "${srcdir}/mesa-demos-${pkgver}"
  make DESTDIR="${pkgdir}" install

  for i in "$pkgdir/usr/bin/"*; do
    mv "$i" "$i"32
  done

  rm -r "$pkgdir/usr/share/mesa-demos"

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
