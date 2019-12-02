# Maintainer: Louis Holbrook <dev@holbrook.no>
pkgname=go-swarm
pkgver=0.5.4
pkgrel=1
epoch=
pkgdesc="Censorship resistant storage and communication infrastructure for a truly sovereign digital society"
arch=('x86_64')
url="https://swarm.ethereum.org"
license=('LGPL3')
groups=(eth-swarm)
depends=()
makedepends=('go>=1.10.0' 'git')
checkdepends=()
optdepends=('python-scrypt' 'python-ecdsa' 'python-pycryptodome' 'go-ethereum' 'systemd')
provides=('go-swarm')
conflicts=()
replaces=()
backup=()
options=()
install=${pkgname}.install
changelog="CHANGELOG_v0.5.4"
source=("https://github.com/ethersphere/swarm/archive/v${pkgver}.tar.gz"
	"v${pkgver}.tar.gz.sig"
	"swarm-resources.tar.gz"
	"swarm-resources.tar.gz.sig"
	"README")
noextract=()
md5sums=("0b123c44f2f69a32899fef10c656dbe8"
	"SKIP"
	"19eea4bf47a58afb05fc3eaef209ec84"
	"SKIP"
	"02f48077fb06278a5b9eed4950b2ce3e")
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
