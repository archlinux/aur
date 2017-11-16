# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: Alexey D. <lq07829icatm@rambler.ru>

pkgname=psi-plus-webkit-git
pkgver=1.2.105.1.g6e2bdef
pkgrel=1
pkgdesc="Psi+ is a powerful Jabber client (Qt, C++) designed for the Jabber power users (built with Qt 5.x and Webkit)"
url="http://psi-plus.com"
license=('GPL2')
arch=('x86_64')
depends=('qt5-base' 'qt5-webkit' 'qt5-multimedia' 'qt5-x11extras' 'qca-qt5' 'libidn' 'aspell' 'libxss' 'qt5-webengine')
makedepends=('git' 'patch' 'qconf-git')
optdepends=('qca-gnupg: encrypted client-to-client connection')
provides=("psi-plus=$pkgver" "psi-plus-qt5-git=$pkgver" "psi-plus-git=$pkgver" "psi-plus-webkit-qt5-git=$pkgver")
conflicts=('psi-plus' 'psi-plus-qt5-git' 'psi-plus-git' 'psi-plus-webkit-qt5-git')
source=("git://github.com/psi-plus/psi-plus-snapshots"
	"git://github.com/psi-plus/main.git"
	'conf.diff'
	'join.patch')
md5sums=('SKIP'
         'SKIP'
         '238c14567b9b74670de4df84a3b6cdab'
         '52af0da67fbd783ac80ccfb544a04aee')
pkgver() {
  cd psi-plus-snapshots
  git describe --long --tags | sed 's/^v//;s/-/./g'
}            
            
prepare() {
  cd psi-plus-snapshots
  # make build date in --version output a bit more readable
  #sed "s/yyyyMMdd/yyyy-MM-dd/" -i qcm/conf.qcm
  mkdir -p iconsets
  cp -r "$srcdir"/main/iconsets/* ./iconsets
  echo "$pkgver ($(date +"%Y-%m-%d"))" >version
  patch -p1 <"$srcdir"/join.patch
}

build() {
  cd psi-plus-snapshots
  qconf
  patch -p0 < "$srcdir"/conf.diff
  ./configure --prefix=/usr \
              --libdir=/usr/lib \
              --enable-webkit \
              --disable-enchant
  make
  patch -Rp0 < "$srcdir"/conf.diff
}

package() {
  cd psi-plus-snapshots

  make INSTALL_ROOT="$pkgdir" install

  install -dm755 "$pkgdir/usr/include/psi-plus/plugins"
  install -m644 src/plugins/include/*.h "$pkgdir/usr/include/psi-plus/plugins"
}
