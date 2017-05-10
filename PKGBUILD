# Maintainer: Tatsunori Aoki <ginjiro.135 at gmail dot com>
# Contributor: kuina <kuinanein at gmail dot com>
pkgname=man-pages-ja-git
pkgver=20170510.55e1091
pkgrel=1
pkgdesc="Man pages for Japanese(git version)"
arch=('any')
url="http://osdn.jp/projects/linuxjm/"
license=('custom')
makedepends=('git' 'expect')
conflicts=('man-pages-ja')
source=('git+http://scm.osdn.jp/gitroot/linuxjm/jm.git'
        'mkconfig.expect'
        'README.en')
md5sums=('SKIP'
         'd9ef996a4bb92abd7dfc7bb19013ce95'
         'eb138d945bba86fbc8c83768581178c8')

prepare() {
  cp $srcdir/jm/JM.rules $srcdir/jm/JM.rules.orig
  sed -e "s!JMHOME\=.*\$!JMHOME\=$srcdir/jm/pkgbuild!g" \
    -e "s!POD2MAN\=.*\$!POD2MAN=$(which pod2man)!g" \
    $srcdir/jm/JM.rules.orig > $srcdir/jm/JM.rules
}

build() {
  cd $srcdir/jm
  make tarball
}

package() {
  install -D -m644 $srcdir/README.en "${pkgdir}/usr/share/licenses/${pkgname}/README.en"
  install -D -m644 $srcdir/jm/dist/README "${pkgdir}/usr/share/licenses/${pkgname}/README"
  cd $srcdir/jm/pkgbuild/tmp
  cd $(ls | egrep "man-pages-ja-[0-9]+$")
  cp $srcdir/mkconfig.expect ./
  env PKGDIR="$pkgdir" ./mkconfig.expect
  make install
}
