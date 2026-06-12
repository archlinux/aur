# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=tarotcaster
_pkgname=TarotCaster
pkgver=1.2.9
pkgrel=2
pkgdesc='Tarot Casting Application with AI Interpretation of Spreads'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/alamahant/${_pkgname}"
license=('GPL-3.0-only')
depends=('qt6-base' 'hicolor-icon-theme')
makedepends=('cmake' 'ninja' 'qt6-tools')
#conflicts=('')
#provides=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2d99171763ca8dc16798e783b9a7a3df4616f091a89e5c841dbbce1705c2f117')


build(){
  cd "$srcdir/${_pkgname}-${pkgver}"
  
  cmake -B build_dir -S . -G Ninja \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build_dir
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  DESTDIR="$pkgdir" cmake --install ./build_dir/

  # TarotCaster installs almost completely to /usr/bin - this is unacceptable.
  # 1) move everything into folder /usr/lib/tarotcaster:
  install -d -m755 $pkgdir/usr/lib
  install -d -m755 $pkgdir/usr/lib/${pkgname}
  mv $pkgdir/usr/bin $pkgdir/usr/lib/${pkgname}
  # 2) manually create a small shell script, that will just yield control to executable in /usr/lib/tarotcaster
  install -d -m755 $pkgdir/usr/bin
  touch $pkgdir/usr/bin/${_pkgname}
  chmod 755 $pkgdir/usr/bin/${_pkgname}
  echo "#!/bin/sh" >> $pkgdir/usr/bin/${_pkgname}
  echo "exec /usr/lib/tarotcaster/bin/TarotCaster \"\$\@\"" >> $pkgdir/usr/bin/${_pkgname}
}
