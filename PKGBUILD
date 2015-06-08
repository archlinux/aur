# Maintainer: Niels Abspoel <aboe76@gmail.com>
pkgname=reclass
pkgver=1.4.1
pkgrel=1
pkgdesc="hierarchical inventory backend for configuration management systems (salt, ansible, puppet)"
arch=('i686' 'x86_64')
url="http://reclass.pantsfullofunix.net/"
license=("PerlArtistic")
depends=('python2')
backup=('etc/reclass/reclass-config.yml')
makedepends=()
optdepends=()
options=()
conflicts=('reclass-git')
provides=('reclass')
source=("http://debian.c3sl.ufpr.br/debian/pool/main/r/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz" 'reclass-config.yml' '.AURINFO')
md5sums=('bb8d46cd739ca76befb12ebc70e79b14' 'ad011bd9cf89152b9eaaeebc0862732f' 'SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  #create default dir
  mkdir -p $pkgdir/etc/reclass/nodes
  mkdir -p $pkgdir/etc/reclass/classes
  install -Dm644 ${srcdir}/reclass-config.yml ${pkgdir}/etc/reclass/reclass-config.yml
  
  #examples are usefull
  mkdir -p $pkgdir/usr/share/doc/${pkgname}/examples
  for i in ${srcdir}/${pkgname}-${pkgver}/examples/*; do
    cp -R $i ${pkgdir}/usr/share/doc/${pkgname}/examples/"$(basename $i)"
    chown -R root:root ${pkgdir}/usr/share/doc/${pkgname}/examples/"$(basename $i)"
  done
}
