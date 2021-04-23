# Maintainer: novenary <streetwalkermc@gmail.com>
# Contributor: Braden Pellett (daBrado) <aurcontact@dabrado.net>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Vesa Kaihlavirta <vegai@iki.fi>
# Contributor: Kristoffer Fossgård <kfs1@online.no>
# Contributor: clonejo <clonejo@shakik.de>
# Contributor: Daniel Micay <danielmicay@gmail.com>

pkgname=terminus-font-ll2
pkgver=4.49.1
pkgrel=2

pkgdesc='Monospace bitmap font (for X11 and console) with ll2 patch (pass the il1I test)'
url='http://terminus-font.sourceforge.net/'
arch=('any')
license=('GPL2' 'custom:OFL')
makedepends=('xorg-bdftopcf' 'python')
provides=('terminus-font')
conflicts=('terminus-font' 'terminus-font-otb')
replaces=('terminus-font-ll2-td1-otb')
source=("https://downloads.sourceforge.net/project/terminus-font/terminus-font-${pkgver%.1}/terminus-font-$pkgver.tar.gz"
        fix-75-yes-terminus.patch)
sha256sums=('d961c1b781627bf417f9b340693d64fc219e0113ad3a3af1a3424c7aa373ef79'
            'ddd86485cf6d54e020e36f1c38c56e8b21b57c23a5d76250e15c1d16fed9caa5')

prepare() {
  cd "terminus-font-$pkgver"
  patch -p1 <"$srcdir"/fix-75-yes-terminus.patch
  patch < alt/ll2.diff
}

build() {
  cd "terminus-font-$pkgver"

  ./configure \
    --prefix=/usr \
    --x11dir=/usr/share/fonts/misc \
    --otbdir=/usr/share/fonts/misc \
    --psfdir=/usr/share/kbd/consolefonts
  make all otb
}

package() {
  make -C "terminus-font-$pkgver" DESTDIR="$pkgdir" install install-otb

  install -Dm644 "$srcdir/terminus-font-$pkgver/75-yes-terminus.conf" \
    "$pkgdir/usr/share/fontconfig/conf.avail/75-yes-terminus.conf"
  install -Dm644 "$srcdir/terminus-font-$pkgver/OFL.TXT" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -d "$pkgdir/usr/share/fontconfig/conf.default"
  ln -sr "$pkgdir/usr/share/fontconfig/conf.avail/75-yes-terminus.conf" \
    "$pkgdir/usr/share/fontconfig/conf.default/75-yes-terminus.conf"
}

# vim:set ts=2 sw=2 et:
