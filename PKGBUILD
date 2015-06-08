# Maintainer: Ashley Whetter <(firstname) @ awhetter.co.uk>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=albumart
pkgver=1.6.6
pkgrel=3
pkgdesc="Semi-automatic downloader for album cover images for your music collection."
arch=('i686' 'x86_64')
url="http://www.unrealvoodoo.org/hiteck/projects/albumart/"
license=('GPL')
depends=('python2' 'pyqt3' 'python2-pillow')
source=("https://www.googledrive.com/host/0B3j8F3jHfinZOFFXLXdvYVZKNFU/albumart/albumart-1.6.6.tar.gz"
        "$pkgname-coding.patch"
        'use_pillow.patch')

md5sums=('445a487eea4b8e41e85b47134edb330a'
         '582a0584c6a27a33c00d4909988b3d0b'
         'SKIP')

build() {
  cd $srcdir/$pkgname-$pkgver
  patch -Np1 -i $srcdir/use_pillow.patch
  python2 setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir --prefix=/usr

  cd $pkgdir
  patch -Np1 -i $srcdir/$pkgname-coding.patch
  sed "s/\#\!\/usr\/bin\/python/\#\!\/usr\/bin\/python2/" -i $pkgdir/usr/bin/albumart-qt

  if [ -f /usr/bin/startkde ]; then
    echo "Installing with KDE support"
    install -d $pkgdir/opt/kde/share
    mv $pkgdir/usr/share/{applnk,apps} $pkgdir/opt/kde/share
  else
    install -d $pkgdir/usr/share/applications/
    mv $pkgdir/usr/share/applnk/Multimedia/albumart.desktop \
            $pkgdir/usr/share/applications/
    rm -rf $pkgdir/usr/share/{applnk,apps}
  fi
}
