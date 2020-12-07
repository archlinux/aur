# Maintainer: Louis Holbrook <dev@holbrook.no>
pkgname=go-bee
pkgver=0.4.0
pkgrel=1
epoch=
pkgdesc="Censorship resistant storage and communication infrastructure for a truly sovereign digital society"
arch=('x86_64')
url="https://swarm-gateways.net/bzz:/docs.swarm.eth/"
license=('BSD')
groups=(eth-swarm)
depends=()
makedepends=('go>=1.15.0' 'git')
checkdepends=()
optdepends=('go-ethereum' 'systemd')
provides=('go-bee')
conflicts=()
replaces=()
backup=()
options=()
install=bee.install
source=("git+https://github.com/ethersphere/bee#commit=625d64e656241a058678e310ba7b02e40f3ec50d" "bee.yaml" "bee.service" "bee.install" "bee.yaml.sig" "bee.service.sig" "bee.install.sig")
noextract=()
sha256sums=("SKIP" "8841026f29b181f0582c6e7e08c28e472f073cf5f42f729abc5bf696802a08ae" "04a72c89f76b4649046c9a588216657803a5a6a29f3c22484bf11dd8639be2b4" "3158225705621a572fadfc9c552e748fec338535eb29923af558669c549329db" "SKIP" "SKIP" "SKIP")
validpgpkeys=("0826EDA1702D1E87C6E2875121D2E7BB88C2A746")

build() {
	msg "Building the bee binaries"
	msg2 "using gopath $GOPATH"
	pushd bee

	# makepkg seems to set LDFLAGS, and they break the build
	_LDFLAGS=$LDFLAGS
	unset LDFLAGS
	make binaries
	LDFLAGS=$_LDFLAGS
}

package() {
	pushd bee
	install -v -D -m0755 dist/bee ${pkgdir}/usr/bin/bee
	install -v -D -m0755 dist/bee-split ${pkgdir}/usr/bin/bee-split
	install -v -D -m0755 dist/bee-join ${pkgdir}/usr/bin/bee-join
	install -v -D -m0755 dist/bee-file ${pkgdir}/usr/bin/bee-file

	#install -v -d -m0755 ${pkgdir}/usr/share/licenses/bee
	install -v -D -m0644 LICENSE ${pkgdir}/usr/share/licenses/bee/LICENSE
	popd
	install -v -D -m0644 bee.yaml ${pkgdir}/etc/bee/bee.yml
	install -v -D -m0644 bee.service ${pkgdir}/usr/lib/systemd/system/bee.service
}

