# Maintainer: dequis <dx@dxzone.com.ar>
# Previous maintainer: Joel Teichroeb <joel@teichroeb.net>

pkgname=rr
pkgver=4.5.0
pkgrel=3
pkgdesc='Record and Replay framework: lightweight recording and deterministic debugging'
arch=(i686 x86_64)
url='http://rr-project.org/'
license=('custom')
depends=('python2-pexpect' 'gdb')
makedepends=('git' 'cmake' 'gdb')
[ "$CARCH" = 'x86_64' ] && makedepends+=('gcc-multilib')
source=(https://github.com/mozilla/${pkgname}/archive/${pkgver}.tar.gz
        https://patch-diff.githubusercontent.com/raw/mozilla/rr/pull/2001.patch
        https://github.com/mozilla/rr/commit/5a16d15ef348c069b82449dcdeaeea3c1eb8639b.patch)
sha1sums=('70d3902c36fb1d0cd423cf1046df06f5153cba5b'
          'e05f9c5081cb67b53d730097731fa382a1bb0194'
	  'cee1884633ecd377a6ca0c7cfcfe2ae257c0876a')

prepare() {
	cd $pkgname-$pkgver
	mkdir -p build

	# -Werror fixes
	patch -p1 -i ../2001.patch
	# "Newer versions of glibc are deprecating the implicit sys/sysmacros.h
	# include via sys/types.h, so include it explicitly"
	patch -p1 -i ../5a16d15ef348c069b82449dcdeaeea3c1eb8639b.patch
}

build() {
	cd $pkgname-$pkgver/build
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr ..

	make
}

package() {
	cd $pkgname-$pkgver/build
	make DESTDIR="${pkgdir}" install
	cd ..
	install -D LICENSE "${pkgdir}/usr/share/licenses/rr/LICENSE"
}
