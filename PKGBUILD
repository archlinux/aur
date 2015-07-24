# Maintainer: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>

pkgname=howm-x11
pkgver=0.5.1
pkgrel=1

pkgdesc='A lightweight, tiling X11 window manager that mimics vi by offering operators, motions and modes.'
arch=('i686' 'x86_64')
url='https://github.com/HarveyHunt/howm'
license=('GPL')

depends=('bash' 'xcb-util-wm' 'sxhkd' 'cottage')
checkdepends=('linux-headers')
source=("https://github.com/HarveyHunt/howm/archive/$pkgver.tar.gz")
sha256sums=('0a790c7b67e19fac026e8abd3dca1d97f72ff25e8b6e84b03b5e246e58520181')
install=howm.install

build() {
  cd howm-$pkgver
  make release
}

check() {
  cd howm-$pkgver
  find /usr/lib/modules -name checkpatch.pl -print -quit | xargs -i cp {} .

  printf 'spellingtxt||disable\n' > spelling.txt
  make check
}

package() {
  cd howm-$pkgver

  find examples/ -type f ! -executable -execdir \
       install -Dm644 {} "$pkgdir"/usr/share/howm/examples/{} \;
  find examples/ -type f -executable -execdir \
       install -Dm755 {} "$pkgdir"/usr/share/howm/examples/{} \;
  
  install -Dm755 bin/release/howm "$pkgdir"/usr/bin/howm
  install -Dm644 howm.xsession.desktop "$pkgdir"/usr/share/xsessions/howm.xsession.desktop
}

# vim:set ts=2 sw=2 et:
