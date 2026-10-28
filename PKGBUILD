# Maintainer: npil
# Contributor: Konzertheld <aur /at/ konzertheld.de>
# Contributor: 3ED_0 <krzysztof1987 /at/ gmail.com>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: Hubert Czobodziński <hcz at onet dot eu>
# Contributor: Nathan Owe <ndowens dot aur at gmail dot com>

pkgbase=ddccontrol
pkgname=(ddccontrol gddccontrol)
pkgver=3.4.1
pkgrel=2
pkgdesc="DDCcontrol is a software used to control monitor parameters, like brightness, contrast, RGB color levels and others"
arch=('i686' 'x86_64')
url="https://github.com/ddccontrol/ddccontrol"
license=('GPL')
depends=('ddccontrol-db' 'libxml2' 'glib2')
makedepends=('gtk3' 'intltool' 'glib2-devel' 'rust')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/ddccontrol/ddccontrol/releases/download/${pkgver}/ddccontrol-${pkgver}-vendor.tar.gz")
options=('!libtool')
sha512sums=('a5ed61c426e5269d4a6343f3740a13d68bc7b81ec976c9e2907b80e6d9263e36688475e735ed5e72919fe9caee22d94052876a07efa7f3c67bb196ee52c9632e')

prepare() {
	cd "${srcdir}"/${pkgbase}-${pkgver}

	mkdir -p .cargo
	# upstream ships a release tarball with vendored Rust crates for offline builds
	cat > .cargo/config.toml <<-EOF
	[source.crates-io]
	replace-with = "vendored-sources"

	[source.vendored-sources]
	directory = "vendor"
	EOF
}

build() {
	cd "${srcdir}"/${pkgbase}-${pkgver}
	export CARGO_NET_OFFLINE=true
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc
	make
}

check() {
	cd "${srcdir}"/${pkgbase}-${pkgver}
	export CARGO_NET_OFFLINE=true
	make check
}

package_ddccontrol() {
	install=ddccontrol.install

	cd "${srcdir}"/${pkgbase}-${pkgver}

	for i in data src/lib src/daemon src/ddccontrol po man; do
		make DESTDIR="${pkgdir}" install -C $i
	done

	# cleanups
	rm "$pkgdir/usr/share/man/man1/gddccontrol.1"
}

package_gddccontrol() {
	depends=('gtk3' 'ddccontrol')
	pkgdesc="Control your monitor by software using the DDC/CI protocol (GUI)"
	conflicts=("ddccontrol-git")

	cd "${srcdir}"/${pkgbase}-${pkgver}

	for i in src/gddccontrol man; do
		make DESTDIR="${pkgdir}" install -C $i
	done

	# cleanups
	rm "$pkgdir/usr/share/man/man1/ddccontrol.1"
	rm "$pkgdir/usr/share/man/man1/ddccontrol-scanmonitor.1"
}
