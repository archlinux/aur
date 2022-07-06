# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=xawtv
pkgver=3.107
pkgrel=2
pkgdesc="A simple Xaw-based TV program which uses the bttv driver or video4linux"
arch=(x86_64)
url="https://git.linuxtv.org/${pkgname}3.git"
license=(GPL)
depends=(aalib v4l-utils libxv libxrandr libglvnd libdv zvbi libxinerama lirc libxft libxaw xorg-fonts-misc libxxf86vm)
makedepends=(mesa git xorgproto)
_commit=8e3feea862db68d3ca0886f46cd99fab45d2db7c
source=("git+${url}#commit=${_commit}")
sha512sums=('SKIP')

prepare() {
  # sys_siglist deprecated, see https://man.archlinux.org/man/core/man-pages/sys_siglist.3.en
  sed -i 's/sys_siglist\[termsig\]/strsignal(termsig)/' ${pkgname}3/x11/rootv.c
  sed -i 's/sys_siglist\[signal\]/strsignal(signal)/' ${pkgname}3/console/record.c
  sed -i 's/sys_siglist\[termsig\]/strsignal(termsig)/' ${pkgname}3/console/fbtools.c
  cd ${pkgname}3
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd ${pkgname}3
  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
  ./configure --prefix=/usr --disable-motif --disable-quicktime
  make
}

package() {
  cd ${pkgname}3
  make DESTDIR="${pkgdir}" install
}
