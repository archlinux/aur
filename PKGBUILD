# Maintainer: Yuuta Liang <yuuta@yuuta.moe>
pkgname=openbgpd
pkgver=7.2
pkgrel=1
epoch=
pkgdesc="A FREE implementation of the Border Gateway Protocol, Version 4"
arch=(x86_64)
url="https://openbgpd.com"
license=('ISC')
groups=()
depends=(glibc rpki-client)
makedepends=(git)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/openbgpd-portable/openbgpd-portable/archive/refs/tags/$pkgver.tar.gz"
"bgpd.service"
"sysusers.conf")
noextract=()
sha256sums=('b9a0da39e69fcd7aa96dc4c624de430a522160b669bc0bf548158c1f5db291b0'
            'd19c8a1ce86e09a5cf7ed9c77fe84bf725dd28cb0e71f912c09907b4e7130239'
            '66d091f846ea9202bc87c985918d69425fb0f165f38d753b02094569b9e1191c')
validpgpkeys=()

prepare() {
	cd "$pkgname-portable-$pkgver"
}

build() {
	cd "$pkgname-portable-$pkgver"
	./autogen.sh
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc/bgpd \
		--localstatedir=/var \
		--sbindir=/usr/bin \
		--with-privsep-user=bgpd
	make
}

check() {
	cd "$pkgname-portable-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-portable-$pkgver"
	make DESTDIR="$pkgdir/" install
	rm -r "$pkgdir/var/run"
	mkdir -p "$pkgdir/usr/share/licenses/openbgpd/"
        install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/openbgpd/"
	mkdir -p "$pkgdir/usr/lib/sysusers.d/"
        install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/bgpd.conf"
        mkdir -p "$pkgdir/usr/lib/systemd/system/"
        install -Dm644 "$srcdir/bgpd.service" "$pkgdir/usr/lib/systemd/system/bgpd.service"
}
