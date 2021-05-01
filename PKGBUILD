# Maintainer: setBoolean <setboolean@icloud.com>
pkgname="bee-git"
_pkgname="bee"
_branch="chrysalis-pt-2"
_pkgver=0.1.0
pkgver=0.1.0.r3.g854f48f2
pkgrel="1"
pkgdesc="A framework for IOTA nodes, clients and applications in Rust"
arch=('x86_64')
url="https://github.com/iotaledger/bee"
license=("Apache")
depends=('openssl')
makedepends=('rustup' 'npm' 'clang' 'llvm' 'cmake' 'git')
source=("git://github.com/iotaledger/$_pkgname.git#branch=$_branch"
	"$_pkgname.service"
	"https://github.com/iotaledger/bee/releases/download/v$_pkgver/config.toml"
	"https://github.com/iotaledger/bee/releases/download/v$_pkgver/config_as.toml")
sha256sums=('SKIP'
            '2ae3649f7912b742a0b84f3573b2baf5fb60ea9448323f84faba03137f4cc250'
            '1d43988957e84d32679562aef005dfc1086be627031d0b8c6e3c8e93b0e30142'
            'd676edf941cd4109d0ea6d159345b2d9cc3c598ed57a003bd4d6b2a66591d190')
backup=('etc/bee/config.toml')
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
	install -Dm600 ${srcdir}/config.toml ${pkgdir}/etc/bee/config.toml
	install -Dm600 ${srcdir}/config_as.toml ${pkgdir}/etc/bee/config_as.toml
	
	install -D ${srcdir}/bee/target/release/bee ${pkgdir}/usr/bin/bee
	
	# Install systemd service
	install -D ${srcdir}/bee.service ${pkgdir}/usr/lib/systemd/system/bee.service
}
