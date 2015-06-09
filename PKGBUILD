# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

# Patches taken from upstream svn to fix specific problems that
# Arch Linux users were having (see AUR comments) - 2014-06-09

pkgname=fslint
pkgver=2.44
pkgrel=2
pkgdesc="A utility to find and clean various forms of lint on a filesystem"
arch=('any')
url="http://www.pixelbeat.org/fslint/"
license=('GPL')
depends=('pygtk' 'python2')
source=(http://www.pixelbeat.org/$pkgname/$pkgname-$pkgver.tar.gz
        fslint-2.44_fix-multiselect-regression_r291.patch
        fslint-2.44_gtk-init-graceful_r292.patch)
sha256sums=('8491a9cd76725e652ac8fe07288ba1f896d9331e30593c0ff3ab9e82e863f0ae'
            'f8786f1c564678e01cd2b52674a48e61858661f5337f5332a7635de5f082c239'
            '4a87d8bbe6699f0932af2c06d38ba6547bd8905e4db51404b3db4c3e3d36c9a9')

prepare() {
  cd "${srcdir}"/$pkgname-$pkgver
  sed -i -e s_^liblocation=.*_liblocation=\'/usr/share/fslint\'_ fslint-gui

  # fixes a regression with multiple select in duplicate file finder
  patch -p2 -i ../fslint-2.44_fix-multiselect-regression_r291.patch

  # handle gtk init problem gracefully
  patch -p2 -i ../fslint-2.44_gtk-init-graceful_r292.patch

  sed -i 's/env python/&2/' fslint-gui \
                            fslint/fstool/dupwaste \
                            fslint/supprt/rmlint/fixdup \
                            fslint/supprt/rmlint/merge_hardlinks
  sed -i 's/bin.python/&2/' fslint/supprt/md5sum_approx
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  install -d "${pkgdir}"/usr/share/{man/man1,doc/$pkgname,pixmaps}
  install -d "${pkgdir}"/usr/share/$pkgname/fslint/{fstool,supprt/rmlint}

  install -D -m755 -t "${pkgdir}"/usr/share/$pkgname/$pkgname $pkgname/find* $pkgname/zipdir $pkgname/fslint
  install -D -m755 -t "${pkgdir}"/usr/share/$pkgname/$pkgname/fstool $pkgname/fstool/*
  install -D -m755 -t "${pkgdir}"/usr/share/$pkgname/$pkgname/supprt $pkgname/supprt/get* $pkgname/supprt/fslver $pkgname/supprt/md5sum_approx
  install -D -m755 -t "${pkgdir}"/usr/share/$pkgname/$pkgname/supprt/rmlint fslint/supprt/rmlint/*
  install -D -m755 $pkgname-gui "${pkgdir}"/usr/bin/$pkgname-gui
  install -D -m644 $pkgname.glade "${pkgdir}"/usr/share/$pkgname/$pkgname.glade
  install -D -m644 $pkgname.desktop "${pkgdir}"/usr/share/applications/$pkgname.desktop
  install -D -m644 fslint_icon.png "${pkgdir}"/usr/share/$pkgname/fslint_icon.png
  ln -s /usr/share/$pkgname/fslint_icon.png "${pkgdir}"/usr/share/pixmaps/fslint_icon.png

  cp -r "${srcdir}"/$pkgname-$pkgver/man/* "${pkgdir}"/usr/share/man/man1
  cp -r "${srcdir}"/$pkgname-$pkgver/doc/* "${pkgdir}"/usr/share/doc/$pkgname

  make -C po DESTDIR="${pkgdir}" install
}
