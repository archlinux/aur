# Maintainer: Benjamin Goodger <ben at goodger dot nl>
# Contributor: Steven Honeyman <stevenhoneyman at gmail dot com>
# Contributor: Jaroslav Lichtblau <dragonlord at aur dot archlinux dot org>

pkgbase=fslint
pkgname=('fslint' 'fslint-gui')
pkgver=2.46
pkgrel=2
pkgdesc="Finds and clean various forms of lint on a filesystem"
arch=('any')
url="http://www.pixelbeat.org/fslint/"
license=('GPL')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pixelb/fslint/archive/${pkgver}.tar.gz")
sha256sums=('5b7403bde841cbca2cb4906ff56482a0476c5860b3486d88c675f4d6a26be0b1')

prepare() {
  cd "${srcdir}"/$pkgbase-$pkgver
  sed -i -e s_^liblocation=.*_liblocation=\'/usr/share/fslint\'_ fslint-gui
}

package_fslint() {
  depends=('python2')
  cd "${srcdir}"/$pkgbase-$pkgver

  install -d "${pkgdir}"/usr/share/{man/man1,doc/$pkgname}
  install -d "${pkgdir}"/usr/share/$pkgname/fslint/{fstool,supprt/rmlint}

  install -D -m755 -t "${pkgdir}"/usr/share/$pkgname/$pkgname $pkgname/find* $pkgname/zipdir $pkgname/fslint
  install -D -m755 -t "${pkgdir}"/usr/share/$pkgname/$pkgname/fstool $pkgname/fstool/*
  install -D -m755 -t "${pkgdir}"/usr/share/$pkgname/$pkgname/supprt $pkgname/supprt/get* $pkgname/supprt/fslver $pkgname/supprt/md5sum_approx
  install -D -m755 -t "${pkgdir}"/usr/share/$pkgname/$pkgname/supprt/rmlint fslint/supprt/rmlint/*
  cp -r "${srcdir}"/$pkgbase-$pkgver/man/* "${pkgdir}"/usr/share/man/man1
  cp -r "${srcdir}"/$pkgbase-$pkgver/doc/* "${pkgdir}"/usr/share/doc/$pkgbase
}

package_fslint-gui() {
  depends=('python2' 'pygtk')
  cd "${srcdir}"/$pkgbase-$pkgver
  install -d "${pkgdir}"/usr/share/pixmaps
  install -D -m755 $pkgname "${pkgdir}"/usr/bin/$pkgname
  install -D -m644 $pkgbase.glade "${pkgdir}"/usr/share/$pkgbase/$pkgbase.glade
  install -D -m644 $pkgbase.desktop "${pkgdir}"/usr/share/applications/$pkgbase.desktop
  install -D -m644 fslint_icon.png "${pkgdir}"/usr/share/$pkgbase/fslint_icon.png
  install -D -m644 fslint_icon.png "${pkgdir}"/usr/share/pixmaps/fslint_icon.png

  make -C po DESTDIR="${pkgdir}" install
}
