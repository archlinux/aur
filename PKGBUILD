# Maintainer: Yunhui Fu <yhfudev at gmail dot com>

pkgname=wxmedit-git
pkgver=r1282.a6d6fce
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
    "$pkgname::git://github.com/hltj/wxMEdit.git"
    wxmedit-encdet-mozilla.patch
    )
install=wxmedit.install
md5sums=(
    'SKIP'
    '357585e05be0a807e4416d31e76df17c'
    )

pkgver_git() {
    cd "${srcdir}/${pkgname}"
    #local ver="$(git show | grep commit | awk '{print $2}' )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

pkgver() {
  pkgver_git
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
  make -j $(cat /proc/cpuinfo | grep processor | wc -l | awk '{print $0 + 1;}')
}

package() {
  cd "$srcdir/$pkgname"
  #cd "$srcdir/wxMEdit-$pkgver"
  make DESTDIR="${pkgdir}" install
}
