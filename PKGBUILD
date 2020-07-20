pkgname=stacer-git
_gitname=Stacer
pkgver=v1.1.0.r59.g2af6e58
pkgrel=1
pkgdesc="Linux System Optimizer and Monitoring"
url="https://github.com/oguzhaninan/Stacer"
arch=('any')
license=('GPL3')
depends=('git' 'qt5-charts' 'qt5-svg' 'hicolor-icon-theme')
conflicts=('stacer' 'stacer-bin')
source=("git://github.com/oguzhaninan/$_gitname.git" $pkgname.desktop)
sha256sums=('SKIP'
            '5c1a6698d1dd4ac2b09ef684564fc120765dd028dbe31fe17ce1d745f1fc4291')
pkgver() {
  cd "$_gitname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname"
  [ -d build ] && rm -fr build
  mkdir build
  cd build

  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=/qt/path/bin .. 
  sed -i s/\;/" "/g ./stacer/CMakeFiles/stacer.dir/link.txt
  make -j $(nproc)
  
  # Build translations
  #lrelease ../stacer/stacer.pro
}

package() {
  cd "$srcdir/$_gitname"/build
  mkdir -p "${pkgdir}"/usr/lib/stacer
  
  install -Dm755 ./output/lib/libstacer-core.a "${pkgdir}"/usr/lib
  
  mkdir -p "${pkgdir}"/usr/bin
  install -Dm755 ./output/stacer "${pkgdir}"/usr/bin/stacer

  install -Dm644 ../LICENSE "{$pkgdir}"/usr/share/licenses/stacer/LICENSE
  
  mkdir -p "${pkgdir}"/usr/share/
  cp -ar ../icons "${pkgdir}"/usr/share/
  
  install -Dm644 ../applications/stacer.desktop "${pkgdir}"/usr/share/applications/stacer.desktop

  # Install translations
  mkdir -p "${pkgdir}"/usr/lib/stacer/translations
  install -Dm644 ../translations/*.ts "${pkgdir}"/usr/lib/stacer/translations/
}