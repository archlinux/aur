# Maintainer: Jaroslav Lichtlbau <dragonlord@aur.archlinux.org>

pkgname=gringotts
pkgver=1.2.10
pkgrel=2
pkgdesc="Secure notes manager for UNIX-like systems."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/gringotts.berlios/"
license=('GPL')
depends=('libgringotts' 'gtk2' 'popt')
makedepends=('patch')
install=$pkgname.install
source=(http://sourceforge.net/projects/gringotts.berlios/files/$pkgname-$pkgver.tar.gz
        $pkgname.diff
        desktopfile.diff)
sha256sums=('19784f68f76b211d076124c74d2f5ca5a156e4af7ed32d72a1ba45547782179d'
            '44e26544d3d80db2804db6b769f53fc31d78cfd3a04c04b6f51c107bb09bac4f'
            '2068f465170d80ea4e2ed18addfd82c0fb73fed073f4926e45e91c99092292c1')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr

  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

#patching source code and the gringotts.desktop file
  patch -Np0 -i "${srcdir}"/$pkgname.diff
  patch -Np0 -i "${srcdir}"/desktopfile.diff

  make DESTDIR="${pkgdir}" install

#.desktop file
  install -Dm644 $pkgname.desktop "${pkgdir}"/usr/share/applications/$pkgname.desktop

#adding suid bit to the executable
  chmod u+s "${pkgdir}"/usr/bin/$pkgname
}
