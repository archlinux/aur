# Maintainer: JamesVorder <info at massmesh dot org>
# Contributor: cure <info at massmesh dot org>
# Contributor: Stephen304 <info at massmesh dot org>
pkgname=autoygg-git
_pkgname="autoygg"
pkgver=v0.2.2.dev20210323005448
pkgrel=1
pkgdesc="An easy internet egress client/server for Yggdrasil network."
arch=('x86_64' 'i686' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/massmesh/autoygg"
license=('AGPL3')
depends=('yggdrasil')
makedepends=('git' 'go')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=('etc/autoygg/server.yaml' 'etc/autoygg/accesslist.yaml' 'etc/autoygg/client.yaml')
options=()
install=autoygg.install
source=('autoygg::git+https://github.com/MassMesh/autoygg.git#branch=main')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	./version-at-commit.sh
}

build() {
	cd "$srcdir/$_pkgname"
	make build
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 "$srcdir/$_pkgname/cmd/autoygg-server/autoygg-server" "${pkgdir}/usr/bin/autoygg-server"
	install -Dm755 "$srcdir/$_pkgname/cmd/autoygg-client/autoygg-client" "${pkgdir}/usr/bin/autoygg-client"
	install -Dm644 "$srcdir/$_pkgname/cmd/autoygg-server/server.yaml" "${pkgdir}/etc/autoygg/server.yaml.example"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
	install -Dm644 systemd/autoygg-server.service -t "${pkgdir}/usr/lib/systemd/system"
	install -Dm644 systemd/autoygg-client.service -t "${pkgdir}/usr/lib/systemd/system"
}
