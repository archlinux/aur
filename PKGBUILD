# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: John <graysky@archlinux.us>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=distcc-arm-avahi
pkgver=3.3.3
pkgrel=7
pkgdesc='Distributed compilation service for C, C++ and Objective-C (with zeroconf)'
provides=('distcc=3.3.3')
conflicts=('distcc')
arch=(arm armv6h armv7h aarch64)
url='https://github.com/distcc/distcc'
license=(GPL)
depends=(avahi popt)
makedepends=(git python)
optdepends=(python)
backup=(etc/conf.d/distccd
        etc/distcc/hosts)
source=("git+$url#commit=4cde9bcfbda589abd842e3bbc652ce369085eaae" # tag: v3.3.3
        distccd.conf.d
        distccd.service
        sysusers.conf)
sha256sums=('SKIP'
            '43e02b461841ca2976816c244a0eca8b24820ca143f73cc0924403d75a8c012f'
            '360493245590d8c1480ff93cd30c9e81cb86efebacd78e45f37e7d6cdbcc2136'
            '4e037a6225f498b51d6902d117be979454ac78ec5fd2f65f1d5a38e10859612a')

prepare() {
  cd "$srcdir/distcc"

  ./autogen.sh
  sed -i 's/ install-gnome-data//g' Makefile.in

  # FS#66418, support Python 3.9
  find . -name "*.py" -type f -exec sed -i 's/time.clock()/time.perf_counter()/g' {} \;
}

build() {
  cd "$srcdir/distcc"

  export CFLAGS+=' -fcommon'
  ./configure \
    --enable-rfc2553 \
    --mandir=/usr/share/man \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc
  make WERROR_CFLAGS= INCLUDESERVER_PYTHON=/usr/bin/python
}

package() {
  make -C "$srcdir/distcc" \
    DESTDIR="$pkgdir" \
    INCLUDESERVER_PYTHON=/usr/bin/python \
    install

  # Configuration
  install -Dm644 distccd.conf.d "$pkgdir/etc/conf.d/distccd"
  install -Dm644 distccd.service \
    "$pkgdir/usr/lib/systemd/system/distccd.service"

  # Symlinks
  _targets=(c++ c89 c99 cc clang clang++ cpp g++)
  install -d "$pkgdir/usr/lib/distcc/bin"
  for bin in "${_targets[@]}"; do
    # For whitelist since version 3.3, see FS#57978
    ln -sf "../../bin/distcc" "$pkgdir/usr/lib/distcc/$bin"
    # Needed for makepkg to work
    ln -sf "../../../bin/distcc" "$pkgdir/usr/lib/distcc/bin/$bin"
  done

  # FS#67629
  install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/distccd.conf"
}

# getver: distcc.org
# vim: ts=2 sw=2 et:
