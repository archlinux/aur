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
source=("http://data.unrealvoodoo.org/uvsite/albumart/albumart-${pkgver}.tar.gz"
        "$pkgname-coding.patch"
        'use_pillow.patch')

sha512sums=('200492a9f8933db95eb7055f35b9bb93c87182a07bba45149f7f58e6f42365329b11b35633eb776a230323e30edf94905414c8d06e29e517309b76661e7ac55f'
            'd85da18d41e01fa2a9539d59464f0d125cb2b1787de100fba4e896359fe59815db435b5ae6d9c01fb8f09f68f4ccfda2f81342972130414663dcf0cf01ee71e1'
            '1f25dde465e89ec1de49ecfb5db8b2ad94643e0db5d92d173981738cd26daa080c65d787474b667ed7db6bd31d081a9bf9658659ed234fec7cf04017db09342c')

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
