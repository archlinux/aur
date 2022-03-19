# Maintainer: John <graysky@archlinux.us>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=distcc-git
_pkgname=distcc
pkgver=v3.4.r26.gae9922c
pkgrel=1
_gccver=11.2.0 # Current GCC version, used for symlinks. See FS#69044
pkgdesc='Distributed compilation service for C, C++ and Objective-C'
arch=(x86_64)
url='https://github.com/distcc/distcc'
license=(GPL)
depends=(avahi popt python)
makedepends=(git gtk3)
optdepends=("gcc=$_gccver")
conflicts=(distcc)
provides=(distcc)
backup=(etc/conf.d/distccd
        etc/distcc/hosts)
source=(git+https://github.com/distcc/distcc
        distccd.conf.d
        distccd.service
        sysusers.conf)
b2sums=('SKIP'
        'c48a6daea2cae5e5865c488e612c819e6f9bf4a1b205e2cd264b795de3450d40b0fe05264fbd8a3fe861f03e38d91e7e791ad67e22da5b5d0b43bcb380b8b4c9'
        '9b6ffc02e9360fd92f7595e96ef2d69b5f6d72acf343009375fa081f86b26f51960b139c4f6e0e3c8befa37eba4894d61351bbfab6386389c262db0cc01a8b8e'
        'd1b057ce49994ac61e9d5a861c1c770452102300d47a9c396b3272d7f5afbd3fe3e865e6db11c046e73ae3b6886bc8970a10624650731d55132362436904f989')
pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  ./autogen.sh
  sed -i 's/ install-gnome-data//g' Makefile.in
  # FS#66418, support Python 3.9
  find . -name '*.py' -type f -exec sed -i 's,e.clock(,e.perf_counter(,g' {} \;
  # Remove debug print, ref. https://github.com/distcc/distcc/commit/2df787cc0c02743254d5e6c04a38da82f1e3d9f6
  sed -i '/fisk state/d' src/mon-gnome.c
}

build() {
  cd "$_pkgname"
  export CFLAGS+=' -fcommon'
  ./configure \
    --enable-rfc2553 \
    --mandir=/usr/share/man \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --with-gtk
  make WERROR_CFLAGS= INCLUDESERVER_PYTHON=/usr/bin/python
}

package() {
  make -C "$_pkgname" \
    DESTDIR="$pkgdir" \
    INCLUDESERVER_PYTHON=/usr/bin/python \
    install

  install -Dm644 distccd.conf.d "$pkgdir/etc/conf.d/distccd"
  install -Dm644 distccd.service \
    "$pkgdir/usr/lib/systemd/system/distccd.service"

  # Package symlinks
  _targets=(c++ c89 c99 cc clang clang++ cpp g++ gcc $CARCH-pc-linux-gnu-g++
            $CARCH-pc-linux-gnu-gcc $CARCH-pc-linux-gnu-gcc-$_gccver)
  install -d "$pkgdir/usr/lib/$pkgname/bin"
  for bin in "${_targets[@]}"; do
    # For whitelist since version 3.3, see FS#57978
    ln -sf ../../bin/$pkgname "$pkgdir/usr/lib/$pkgname/$bin"
    # Needed for makepkg to work
    ln -sf ../../../bin/$pkgname "$pkgdir/usr/lib/$pkgname/bin/$bin"
  done

  # FS#67629
  install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/distccd.conf"
}
# vim: ts=2 sw=2 et:
