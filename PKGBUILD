# Maintainer: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>

pkgname=howm-x11
_pkgname=howm
pkgver=0.5
pkgrel=6

pkgdesc='A lightweight, tiling X11 window manager that mimics vi by offering operators, motions and modes.'
arch=('i686' 'x86_64')
url='https://github.com/HarveyHunt/howm'
license=('GPL')

depends=('bash' 'xcb-util-wm' 'sxhkd' 'cottage')
checkdepends=('linux-headers')
source=("https://github.com/HarveyHunt/howm/archive/${pkgver}.tar.gz")
sha256sums=('568247262381ee34ba3e48217a42e372fea0b056920b17a2590d927f9f17b846')
install=howm.install

build() {
  cd "$_pkgname-$pkgver"
  make release
}

check() {
  cd "$_pkgname-$pkgver"
  find /usr/lib/modules -name checkpatch.pl -print -quit | xargs -i cp {} .

  echo "spellingtxt||disable" > spelling.txt
  make check
}

package() {
  cd "$_pkgname-$pkgver"

  find examples/ -type f ! -executable -execdir \
       install -Dm644 {} "$pkgdir"/usr/share/howm/examples/{} \;
  find examples/ -type f -executable -execdir \
       install -Dm755 {} "$pkgdir"/usr/share/howm/examples/{} \;
  
  install -Dm755 bin/release/howm "$pkgdir"/usr/bin/howm
  install -Dm644 howm.xsession.desktop "$pkgdir"/usr/share/xsessions/howm.xsession.desktop
}

# vim:set ts=2 sw=2 et:
