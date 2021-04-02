# Maintainer: setBoolean <setboolean@icloud.com>
pkgname="bee-git"
_pkgname="bee"
_branch="chrysalis-pt-2"
pkgver="0.1.0"
pkgrel="2"
pkgdesc="A framework for IOTA nodes, clients and applications in Rust"
arch=('x86_64')
url="https://github.com/iotaledger/bee"
license=("Apache")
depends=('rustup' 'npm' 'clang' 'llvm' 'cmake' 'openssl' 'git')
source=("git://github.com/iotaledger/$_pkgname.git#branch=$_branch"
	"$_pkgname.service")
sha256sums=('SKIP'
            '2ae3649f7912b742a0b84f3573b2baf5fb60ea9448323f84faba03137f4cc250')
backup=('etc/bee/config.toml')
install=$_pkgname.install

package() {
	cd ${srcdir}/bee/bee-node
	
	# Update rust

	rustup update 
	
	# Build with Dashboard
	
	git submodule update --init
	cd src/plugins/dashboard/frontend
	npm install
	npm run build-bee
	cd ../../../../
	cargo build --release --features dashboard

	# Move executable to /usr/bin
	
	mkdir -p ${pkgdir}/usr/bin/
	mv ${srcdir}/bee/target/release/bee ${pkgdir}/usr/bin/
	
	# Move files to /var/lib/bee
	#
	mkdir -p ${pkgdir}/var/lib/bee/
	# cp -R ${srcdir}/bee/target/release/* ${pkgdir}/var/lib/bee/
	
	# Move config to standard location

	mkdir -p ${pkgdir}/etc/bee/
	cp ${srcdir}/bee/bee-node/config.example.toml ${pkgdir}/etc/bee/config.toml
	
	# Install systemd service

	mkdir -p ${pkgdir}/usr/lib/systemd/system/
	cp ${srcdir}/bee.service ${pkgdir}/usr/lib/systemd/system/
}
