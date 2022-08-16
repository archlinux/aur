# Maintainer: DilithiumNitrate <dilithium.no3 at proton me>

pkgname='wadcli'
pkgver=1.0
pkgrel=1
pkgdesc='Command-line Doom WAD file manipulator'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/JugadorXEI/wadcli'
license=('BSD')
depends=('gcc-libs' 'liblzf')
source=("https://github.com/JugadorXEI/wadcli/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('f134bf1c9138df9baee20d6b57b8b6651903721612eddbb90ac2956738cda8f22e895a0b28485b92797274113754dfc57e6533646037c3ff08c3a52249d59ba4')
sha256sums=('573140e6edb2579d9cbc83d698dcf25aebd784d9387e66c075c356f087955b64')

prepare() {
	cd "$srcdir/wadcli-$pkgver"
	# adjust lzf.h location and add extern "C"
	sed '/lzf\.h/ {
			i extern "C" {
			s:liblzf/::
			a }
		}' -i src/wadformat.cpp
	# open makefile up to external CXXFLAGS and LDFLAGS and remove -g
	sed 's:\bCPPFLAGS\b:CXXFLAGS:g
		/^LDFLAGS=$/d
		s:^CXXFLAGS=:CXXFLAGS+=:
		s:$(CXX) -g:$(CXX):' -i makefile
}

build() {
	cd "$srcdir/wadcli-$pkgver"
	make
}

package() {
	cd "$srcdir/wadcli-$pkgver"
	install -Dm755 wadcli "$pkgdir/usr/bin/wadcli"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
