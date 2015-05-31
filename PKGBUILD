# Maintainer Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Mathias Burén (fackamato) <mathias.buren@gmail.com>

pkgname=unigine-tropics
_pkgname=Unigine_Tropics
pkgver=1.3
pkgrel=2
pkgdesc="Demonstration and benchmarking of the Unigine 3D engine"
arch=('i686' 'x86_64')
url="http://unigine.com/"
license=('custom')
md5sums=('73729f5ccde2bcf991ecff10feb6dbdf'
         '322eea429002108ec286be641c5b9549')
[ `uname -m` = 'i686' ] &&
  depends=('libstdc++5' 'libxrandr' 'libgl' 'openal' 'libxinerama')
[ `uname -m` = 'x86_64' ] &&
  depends=('lib32-libstdc++5' 'lib32-libxrandr' 'lib32-libgl' 'lib32-openal' 'lib32-libxinerama')
source=(http://mirror74.ddns.school-adm.ru/Soft/Info-Test/Unigine_benchmarks/${_pkgname}-${pkgver}.run \
  LICENSE)

build() {
  cd "$srcdir"
  sh ${_pkgname}-$pkgver.run
}

package() {
  cd "$srcdir"
  install -m755 -d $pkgdir/opt/$pkgname
  cp -r tropics/* $pkgdir/opt/$pkgname/
  
  for _file in $pkgdir/opt/$pkgname/*.sh; do
    sed -i "s_\./bin_/opt/$pkgname/bin_" $_file
    install -m755 -D $_file $pkgdir/usr/bin/${pkgname}_${_file/*\//}
    rm -f $_file
  done
  
  find $pkgdir/opt/$pkgname -type d -exec chmod 755 {} +
  find $pkgdir/opt/$pkgname -type f -exec chmod 644 {} +
  find $pkgdir/opt/$pkgname -name Tropics -exec chmod 755 {} +
  install -m644 -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
