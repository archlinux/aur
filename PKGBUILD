# Maintainer: Tatsunori Aoki <ginjiro.135 at gmail dot com>
# Contributor: kuina <kuinanein at gmail dot com>
pkgname=man-pages-ja
pkgver=0.5.0.0.20150805
pkgrel=2
pkgdesc="Man pages for Japanese"
arch=('any')
url="http://osdn.jp/projects/linuxjm/"
license=('custom')
makedepends=('git' 'expect')
provides=('man-pages-ja-git')
conflicts=('man-pages-ja-git')
source=('git+http://scm.osdn.jp/gitroot/linuxjm/jm.git'
        'mkconfig.expect'
        'README.en')
md5sums=('SKIP'
         'd9ef996a4bb92abd7dfc7bb19013ce95'
         'eb138d945bba86fbc8c83768581178c8')

pkgver() {
  cd $srcdir/jm
  echo 0.5.0.0.$(git log --pretty=format:%ci -n1 | cut -f 1 -d " " | sed "s/-//g")
}

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
