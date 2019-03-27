# Maintainer:
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Giovanni Scafora <linuxmania@gmail.com>

pkgname=driconf
pkgver=0.9.1
pkgrel=14
pkgdesc="Graphical configuration tool for the Direct Rendering Infrastructure"
arch=('any')
url="https://dri.freedesktop.org/wiki/DriConf/"
license=('GPL')
depends=('mesa-demos' 'pygtk' 'xorg-xdriinfo')
makedepends=('imagemagick')
source=(http://ftp.debian.org/debian/pool/main/d/$pkgname/${pkgname}_$pkgver.orig.tar.gz
        driconf_simpleui.patch)
sha256sums=('4849a43f6324498e943c03777bce571229b5446985b1cec596b365505e76f73f'
            'a2f9c4fd50cb694cc743cdde0f4efe310cb11fbef347c1a1d5fbec9a99d3499b')

prepare() {
  cd $pkgname-$pkgver

  # Fix uninitialized variable (FS#36934)
  patch -Np0 -i ../driconf_simpleui.patch

  # Install into /usr instead of /usr/local
  sed -i 's|/usr/local|/usr|' *.py driconf setup.cfg
  sed -i 's/^Icon=.*/Icon=drilogo/
          s/AdvancedSettings;//' driconf.desktop
}

build() {
  cd $pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -dm755 "$pkgdir"/usr/share/pixmaps/
  convert drilogo.jpg +set date:create +set date:modify "$pkgdir"/usr/share/pixmaps/drilogo.png
}
