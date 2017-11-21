# Maintainer: Wei Li <liwei@anbutu.com>
pkgname=hyperd-git
pkgver=v1.0.0.r5.f2baf06
pkgrel=1
pkgdesc="HyperContainer Daemon"
arch=('i686' 'x86_64')
url="https://github.com/hyperhq/hyperd"
license=('Apache')
depends=('libvirt')
makedepends=('git' 'go' 'device-mapper' 'sqlite3' 'libvirt' 'btrfs-progs')
optdepends=('hyperstart: boot files for hyperd instances')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip' '!emptydirs')
source=("${pkgname%-git}::git+${url}.git"
	'btrfs-progs-4.5.diff')
md5sums=('SKIP'
	 '4858adb29a450c9e5775e4cae875fae7')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	# https://github.com/hyperhq/hyperd/issues/643
	# https://github.com/moby/moby/commit/a038cccf88998814249a7a40b71a33a680e3f02f
	patch -Np0 -i "$srcdir/btrfs-progs-4.5.diff"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	local _srcpath="src/github.com/hyperhq/"
	export GOPATH="${srcdir}"
	install -d "$GOPATH/$_srcpath"
	ln -sf "$(pwd)" "$GOPATH/$_srcpath/hyperd"
	cd "$GOPATH/$_srcpath/hyperd"

	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D cmd/hyperctl/hyperctl "${pkgdir}/usr/bin/hyperctl"
	install    cmd/hyperd/hyperd     "${pkgdir}/usr/bin/hyperd"
	install    cmd/vmlogd/vmlogd     "${pkgdir}/usr/bin/vmlogd"
	install -D -m644 package/dist/etc/hyper/config "${pkgdir}/etc/hyper/config"
	install -D -m644 package/dist/lib/systemd/system/hyperd.service \
		"${pkgdir}/usr/lib/systemd/system/hyperd.service"
	install    -m644 package/dist/lib/systemd/system/hyper-vmlogd.service \
		"${pkgdir}/usr/lib/systemd/system/hyper-vmlogd.service"
}
