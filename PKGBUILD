# Maintainer: npil
# Contributor: Konzertheld <aur /at/ konzertheld.de>
# Contributor: 3ED_0 <krzysztof1987 /at/ gmail.com>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: Hubert Czobodziński <hcz at onet dot eu>
# Contributor: Nathan Owe <ndowens dot aur at gmail dot com>

pkgbase=ddccontrol
pkgname=(ddccontrol gddccontrol)
pkgver=3.3.0
pkgrel=1
pkgdesc="DDCcontrol is a software used to control monitor parameters, like brightness, contrast, RGB color levels and others"
arch=('i686' 'x86_64')
url="https://github.com/ddccontrol/ddccontrol"
license=('GPL')
depends=('ddccontrol-db-git' 'libxml2' 'glib2')
makedepends=('gtk3' 'intltool' 'glib2-devel' 'rust')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/ddccontrol/ddccontrol/releases/download/${pkgver}/ddccontrol-${pkgver}-vendor.tar.gz")
options=('!libtool')
sha512sums=('c71187f708e5c33ab198120257ae13db3b1edc77074d7825100c695ab0eb3ec745571a7f146d63e021650a853947d888e3b0291d3e3cb704d550c683d6a1f455')

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
}
