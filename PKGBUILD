# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: ShadowKyogre <shadowkyogre.public+aur@gmail.com>
# Contributor: Peter Garceau <rockychimp@gmail.com>
pkgname=metamorphose2
pkgver=0.8.4
pkgrel=2
pkgdesc="Batch Rename Utility"
arch=(i686 x86_64)
license=('GPL')
url="http://file-folder-ren.sourceforge.net"
depends=('python2' 'wxpython2.8' 'python2-wxpython3' 'exif-py')
optdepends=('python2-imaging: Required for previewing images' 'python2-mutagen: ID3 Tag renaming')
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/metamorphose/${pkgname}/archive/v2.${pkgver}.tar.gz")
sha1sums=('1850f86f45b9adeeb3f663d724d6fb4ca943624a')

prepare() {
  cd "$srcdir/metamorphose2-2.$pkgver"
  sed -e 's#cp \*\.html#cp changelog.rst#g' -i Makefile
}

package() {
  cd "$srcdir/metamorphose2-2.$pkgver"

  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
             -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
             $(find ./ -name '*.py')
  sed -i "s|exec python|exec python2|g" metamorphose2
  sed -i "s|from exif import EXIF|import EXIF|g" $(find ./ -name '*.py')

  messages/update_langs.sh
  install -d "$pkgdir"/usr/{bin,share/man/man1,share/pixmaps,share/applications,share/app-install/icons,share/app-install/desktop,share/locale}

  make DESTDIR="$pkgdir" all
}
