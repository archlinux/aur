# Maintainer: Pavers_Career <pavers_career_0d@icloud.com>
pkgname="bee-git"
_pkgname="bee"
_branch="chrysalis-pt-2"
_pkgver="0.2.1"
pkgver=0.2.1.r0.g1fbe96ab
pkgrel=1
pkgdesc="A framework for IOTA nodes, clients and applications in Rust"
arch=('x86_64')
url="https://github.com/iotaledger/bee"
license=("Apache")
depends=('openssl')
makedepends=('rustup' 'npm' 'clang' 'llvm' 'cmake' 'git')
source=("git://github.com/iotaledger/$_pkgname.git#branch=$_branch"
	"$_pkgname.service"
	"https://github.com/iotaledger/bee/releases/download/v$_pkgver/config.chrysalis-comnet.toml"
	"https://github.com/iotaledger/bee/releases/download/v$_pkgver/config.chrysalis-mainnet.toml")
sha256sums=('SKIP'
            '2a0b6c70f7e1480a35c38a697f2b5d6d4181854b5d83941a7b684a5476f9cd17'
            '2b52c5613b9eed26a676bbe5d877ce949048a01ccbb6c7c73fd82d0d3b783df8'
            'd1c6466269c5f581d2072496f431cbaf8169c280a9026454d4e57efddcf0c583')
backup=('etc/bee/config.chrysalis-mainnet.toml' 'etc/bee/config.chrysalis-comnet.toml')
install=$_pkgname.install

pkgver() {
	cd ${_pkgname}
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd ${srcdir}/bee/bee-node

	# Check/update rust toolchain
	if ! rustup show | grep 'stable\|nightly' > /dev/null 2>&1; then
		printf	"#########################################\
			\n# NO RUST TOOLCHAIN FOUND. PLEASE RUN   #\
			\n# rustup toolchain install stable FIRST #\
			\n#########################################\n"
		exit
	else
		rustup update
	fi
        
        # Build with Dashboard
        git submodule update --init
        cd src/plugins/dashboard/frontend
        npm install
        npm run build-bee
        cd ../../../../
        cargo build --release --features dashboard
}

package() {

	# Install files
	install -Dm600 ${srcdir}/config.chrysalis-comnet.toml ${pkgdir}/etc/bee/config.chrysalis-comnet.toml
	install -Dm600 ${srcdir}/config.chrysalis-mainnet.toml ${pkgdir}/etc/bee/config.chrysalis-mainnet.toml
	
	install -D ${srcdir}/bee/target/release/bee ${pkgdir}/usr/bin/bee
	
	# Install systemd service
	install -D ${srcdir}/bee.service ${pkgdir}/usr/lib/systemd/system/bee.service
}
