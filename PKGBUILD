# Maintainer: Douglas Chimento <dchimento @ gmail.com>
pkgname=elements-project
pkgver=0.21.0.2
pkgrel=1
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
pkgdesc="Elements blockchain platform, a collection of feature experiments and extensions to the Bitcoin protocol"
url="https://github.com/ElementsProject/elements"
license=('MIT')
conflicts=("elements-project-bin")
provides=("elements-project")
backup=('etc/elements/elements.conf')
depends=('boost' 'boost-libs' 'zeromq' 'libevent' 'libnatpmp')
checkdepends=('python')
makedepends=('autoconf' 'automake' 'binutils' 'libtool' 'm4' 'make' 'pkg-config' 'systemd')

source=("https://github.com/ElementsProject/elements/archive/refs/tags/elements-${pkgver}.tar.gz"
	elements.conf
        elementsd.service
        elementsd-test.service
        elements-sysusers.conf
        elements-core-01-systemd-sysusers.hook
	elements-core-02-chown.hook)

sha256sums=('0f94576aad13ce6baf84b5326fb0162e5778c44ba37dd32597d093b13d04af58'
	    'SKIP'
	    'SKIP'
	    'SKIP'
            'SKIP'
            'SKIP'
	    'SKIP')

# half of available processing units or one if only one is available
_nproc=$(($(nproc)/2))
[[ ${_nproc} < 1 ]] && _nproc=1


build() {
  cd "$srcdir/elements-elements-$pkgver"

  msg2 'Building...'
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/elementsd \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/elements \
    --localstatedir=/var/lib/elementsd \
    --enable-hardening \
    --with-gui=no \
    --disable-wallet \
    --without-miniupnpc \
    --with-gnu-ld
  make -j$_nproc
}

check() {
  cd "$srcdir/elements-elements-$pkgver"
  msg2 'Testing...'
  make -j$_nproc check
}


package() {
  cd "$srcdir/elements-elements-$pkgver"
  msg2 'Installing essential directories'
  install -dm 700 "$pkgdir/etc/elements"
  install -dm 750 "$pkgdir/var/lib/elementsd"

  msg2 'Installing element.conf...'
  install -Dm 600 "$srcdir/elements.conf" -t "$pkgdir/etc/elements"

  msg2 'Installing elementd.service...'
  install -Dm 644 "$srcdir/elementsd.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm 644 "$srcdir/elementsd-test.service" -t "$pkgdir/usr/lib/systemd/system"

  msg2 'Installing element-sysusers.conf...'
  install -Dm 644 "$srcdir/elements-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/elements.conf"
    
  msg2 'Installing element...'
  for i in elements-cli elementsd elements-tx; do
    install -Dm 755 "src/$i" "$pkgdir/usr/bin/$i"
  done

  msg2 'Installing man...'
  for i in elements-cli.1 elementsd.1 elements-tx.1; do
    install -Dm 644 "doc/man/$i" "$pkgdir/usr/share/man/man1/$i"
  done
  msg2 'Installing pacman hooks...'
  install -Dm 644 "$srcdir"/*.hook -t "$pkgdir/usr/share/libalpm/hooks"
}
