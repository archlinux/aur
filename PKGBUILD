# Maintainer: Yunhui Fu <yhfudev at gmail dot com>

pkgname=wxmedit-git
pkgver=dee626e
pkgrel=1
pkgdesc="Cross-platform Text/Hex Editor, a fork of MadEdit with bug fixes and improvements"
arch=("i686" "x86_64")
url="https://wxmedit.github.io/"
license=('GPL')
conflicts=('wxmedit')
#depends=('wxgtk' 'libucd-git' 'icu' 'desktop-file-utils' 'boost')
depends=('wxgtk' 'libucd-git' 'desktop-file-utils' 'boost')
makedepends=('git' 'libucd-git' 'boost' 'wxgtk')
source=(
    "$pkgname::git+https://github.com/hltj/wxMEdit"
    wxmedit-encdet-mozilla.patch
    )
install=wxmedit.install
md5sums=(
    'SKIP'
    '46277ca991dc2d7bf227bb6628561f4e'
    )

pkgver() {
  cd "$srcdir/$pkgname"
  local ver="$(git show | grep commit | awk '{print $2}'  )"
  #printf "r%s" "${ver//[[:alpha:]]}"
  echo ${ver:0:7}
}

prepare() {
  cd "$srcdir/$pkgname"
  #cd "$srcdir/wxMEdit-$pkgver"
  patch -p1 < "$srcdir/wxmedit-encdet-mozilla.patch"
}

build() {
  cd "$srcdir/$pkgname"
  #cd "$srcdir/wxMEdit-$pkgver"

  ./autogen.sh
  ./configure --prefix=/usr --with-wx-config=/usr/bin/wx-config-2.8
  make
}

package() {
  cd "$srcdir/$pkgname"
  #cd "$srcdir/wxMEdit-$pkgver"
  make DESTDIR="${pkgdir}" install
}
