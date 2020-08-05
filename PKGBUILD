# Maintainer: Parker Coates <parker.coates gmail com>
# Contributor: Christian Hammacher <bmasterc gmail com>

pkgname=shrew-vpn-client-qt5
_reponame=shrew-qt5
pkgver=2.2.1
pkgrel=0
pkgdesc="A portable VPN client for Linux - Qt5 port of GUI only"
arch=('i686' 'x86_64')
url='https://github.com/ben-foxmoore/shrew-qt5'
license=('osi')
depends=('qt5-base' 'ike')
makedepends=('git' 'gcc' 'cmake')
conflicts=('shrew-vpn-client')
source=("${_reponame}::git://github.com/ben-foxmoore/${_reponame}.git"
        'ikea.desktop'
        'gui_only.patch')
md5sums=('SKIP'
         '5b35a4246eb1b7bd4bfb6780c23d39f2'
         '376b119543b4bc00b7875a3c71ab2f18')

build() {
  cd $srcdir/${_reponame}

  # Remove all non-GUI targets from CMake
  patch -Np1 -i ../gui_only.patch

  cmake -G 'Unix Makefiles' -DQTGUI=YES -DNATT=YES -DLDAP=YES -DSBINDIR=/usr/bin \
    -DCMAKE_INSTALL_PREFIX=/usr -DMANDIR=/usr/share/man -DETCDIR=/etc

  make
}

package() {
  cd "$srcdir/${_reponame}"
  make DESTDIR="$pkgdir/" install
  
  # Copy our desktop files
  install -D -m644 $srcdir/${_reponame}/source/qikea/png/ikea.png $pkgdir/usr/share/icons/ikea.png
  install -D -m755 $startdir/ikea.desktop $pkgdir/usr/share/applications/ikea.desktop
}


