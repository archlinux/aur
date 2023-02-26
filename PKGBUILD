# Maintainer: Serge K <arch@phnx47.net>

# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

pkgname=xawtv
pkgver=3.107
pkgrel=3
pkgdesc="A simple Xaw-based TV program which uses the bttv driver or video4linux"
arch=(x86_64)
url="https://linuxtv.org"
license=(GPL)
depends=(aalib v4l-utils libxv libxrandr libglvnd libdv zvbi libxinerama lirc libxft libxaw xorg-fonts-misc libxxf86vm)
makedepends=(mesa git xorgproto)
source=("${pkgname}-${pkgver}.tar.bz2::https://linuxtv.org/downloads/xawtv/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('29935e9265a96223097e6c4ab65d06c45233238992901d63aa3008e6f35cb59d474cebabd4136e47451242ba35df9ef08f9ef762c01ad688833429bc72d61536')

prepare() {
  cd ${pkgname}-${pkgver}
  # sys_siglist deprecated, see https://man.archlinux.org/man/core/man-pages/sys_siglist.3.en
  sed -i 's/sys_siglist\[termsig\]/strsignal(termsig)/' "x11/rootv.c"
  sed -i 's/sys_siglist\[signal\]/strsignal(signal)/' "console/record.c"
  sed -i 's/sys_siglist\[termsig\]/strsignal(termsig)/' "console/fbtools.c"
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd ${pkgname}-${pkgver}
  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
  ./configure --prefix=/usr --disable-motif --disable-quicktime
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
