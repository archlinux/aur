# Maintainer: Ikosse <andrelofgren@hotmail.co.uk>

pkgname=ethminer-etchash-git
pkgver=r14327.52ff22e7d
pkgrel=2
pkgdesc="Ethereum Classic miner with OpenCL, CUDA and stratum support"
arch=('x86_64')
url="https://github.com/etclabscore/ethminer"
license=('GPL3')
depends=('mesa' 'pth' 'cuda')
makedepends=('cmake' 'python' 'git')
provides=('ethminer-etchash')
conflicts=('ethminer')
source=("${pkgname%-git}::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare () {
	cd "$srcdir/${pkgname%-git}"
	git submodule update --init --recursive

	_BOOST_VERSION=1.66.0
	_BOOST_SHA1=f0b20d2d9f64041e8e7450600de0267244649766
	_BOOST_URL="https:\/\/boostorg.jfrog.io\/artifactory\/main\/release\/$_BOOST_VERSION\/source\/boost_${_BOOST_VERSION//./_}.tar.gz"
	
	# Force Hunter to download boost from boostorg instead of bintray	
	sed -i 's/hunter_config.*(Boost VERSION.*)/hunter_config(Boost VERSION '"$_BOOST_VERSION"'_boostorg_url SHA1 '"$_BOOST_SHA1"' URL '"$_BOOST_URL"')/' cmake/Hunter/config.cmake
}

build () {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p build && cd build

	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
	cmake --build .
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
	make DESTDIR=$pkgdir install
}
