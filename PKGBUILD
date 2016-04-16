pkgname="psi-plus-webkit-qt5-git"
pkgver=0.16.545.532
pkgrel=2
pkgdesc="Psi+ is a powerful Jabber client (Qt, C++) designed for the Jabber power users (built with Qt 5.x and Webkit)"
url="http://psi-plus.com"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('qt5-base' 'qt5-webkit' 'qt5-multimedia' 'qt5-x11extras' 'qca-qt5' 'libidn' 'aspell' 'libxss')
makedepends=('git' 'patch' 'qconf-git')
optdepends=('qca-gnupg: encrypted client-to-client connection')
provides=("psi-plus=$pkgver" "psi-plus-qt5-git=$pkgver" "psi-plus-git=$pkgver")
replaces=('psi-plus' 'psi-plus-webkit-git' 'psi-plus-git')
conflicts=('psi-plus' 'psi-plus-webkit-git' 'psi-plus-git')
install=psi-plus-git.install
source=('git://github.com/psi-plus/psi-plus-snapshots' 'git://github.com/psi-plus/main.git' 'conf.diff')
md5sums=('SKIP'
         'SKIP'
         '238c14567b9b74670de4df84a3b6cdab')
pkgver() {
    cd psi-plus-snapshots
    git describe --tags | cut -d - -f 1-2 --output-delimiter=.
    #git log -1 --format="%ci" HEAD | cut -d\  -f1 | tr -d '-'
}

prepare() {
  cd psi-plus-snapshots
  # make build date in --version output a bit more readable
  #sed "s/yyyyMMdd/yyyy-MM-dd/" -i qcm/conf.qcm
  cp -r "$srcdir"/main/iconsets/* ./iconsets
  echo "$pkgver ($(date +"%Y-%m-%d"))" >version
}

build() {
  cd psi-plus-snapshots
  qconf
  patch -p0 < "$srcdir"/conf.diff
  ./configure --prefix=/usr \
              --libdir=/usr/lib \
              --enable-plugins \
              --enable-webkit \
              --disable-enchant \
              --qtdir="/usr/lib/qt"
  make
  patch -Rp0 < "$srcdir"/conf.diff
}

package() {
  cd psi-plus-snapshots

  make INSTALL_ROOT="$pkgdir" install

  install -dm755 "$pkgdir/usr/include/psi-plus/plugins"
  install -m644 src/plugins/include/*.h "$pkgdir/usr/include/psi-plus/plugins"
}

