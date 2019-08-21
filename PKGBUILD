# Maintainer: Louis Holbrook <dev@holbrook.no>
pkgname=go-swarm
pkgver=0.4.3
pkgrel=1
epoch=
pkgdesc="Censorship resistant storage and communication infrastructure for a truly sovereign digital society"
arch=('x86_64')
url="https://swarm.ethereum.org"
license=('LGPL3')
groups=()
depends=()
makedepends=('go>=1.10.0' 'git')
checkdepends=()
optdepends=('python-scrypt' 'python-ecdsa' 'python-pycryptodome' 'go-ethereum')
provides=('go-swarm')
conflicts=()
replaces=()
backup=()
options=()
install=${pkgname}.install
source=("https://github.com/ethersphere/swarm/archive/v${pkgver}.tar.gz"
	"v${pkgver}.tar.gz.sig"
	"swarm-resources.tar.gz"
	"swarm-resources.tar.gz.sig")
noextract=()
md5sums=("7f394b218657463761a555d5c598a320"
	"SKIP"
	"ed8552f2daae230a7b67c76adbea2f51"
	"SKIP")
validpgpkeys=("0826EDA1702D1E87C6E2875121D2E7BB88C2A746")
_pythonwalletdepends=1

prepare() {
	for m in ${optdepends[@]}; do
		if [ ! pacman -Qi $m &> /dev/null ]; then
			if [ $m =~ /^python-/ ]; then
				_pythonwalletdepends=0
			fi
		fi
	done

	export GOPATH=${srcdir}/go
	export SWARMPATH=${GOPATH}/src/github.com/ethersphere
	if [ -d "$GOPATH" ]; then
		rm -vrf "$GOPATH"
	fi
	if [ ! -d "${srcdir}/build" ]; then
		mkdir -vp "${srcdir}/build"
	fi
	if [ ! -d "$SWARMPATH" ]; then
		mkdir -vp "$SWARMPATH"
	fi
	mv -v ${srcdir}/swarm-${pkgver} ${SWARMPATH}/swarm
	
}

build() {
	msg "Building the swarm binary"
	msg2 "using gopath $GOPATH"
	go build -o build/swarm -v ${SWARMPATH}/swarm/cmd/swarm

	getent group bzz > /dev/null || groupadd -r bzz
	getent passwd bzz > /dev/null || useradd -g bzz -d /var/lib/bzz -m -r
}

check() {
	warning "still need to add checks"
}

package() {
	install -v -D -m0755 build/swarm ${pkgdir}/usr/local/bin/swarm
	install -v -D -m0644 swarm.service ${pkgdir}/usr/lib/systemd/system/swarm.service
	if [ ${_pythonwalletdepends} -eq 1 ]; then
		install -v -D -m0700 swarm-genkey.py ${pkgdir}/usr/local/bin/swarm-genkey
	fi
}
