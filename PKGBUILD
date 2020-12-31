# Maintainer: Nick Econopouly <wry at mm dot st>
pkgname=jami-client-qt-git
pkgver=r274.dc634fe
pkgrel=1
pkgdesc="Free and universal communication platform which preserves the users’ privacy and freedoms (QT client)"
arch=('x86_64')
provides=('jami-client-qt')
url="https://git.jami.net/savoirfairelinux/jami-client-qt"
license=('GPL3')
depends=('jami-daemon-git' 'libjamiclient-git' 'qt5-base')
makedepends=('git' )
source=("git+$url.git" '0001.patch' )
sha512sums=(SKIP 2772ecf10cc20e9183957324507dfcb047119452feb4d9610d69fdc9a41bce837726b70ff6d40b1e2ecd35f9daa391d767543315ffc5941b5227cd5b2927c9e3 )

pkgver() {
  cd $srcdir/jami-client-qt
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#   git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $srcdir/jami-client-qt
	git apply ../0001.patch
	mkdir -p build
}

build() {
	cd jami-client-qt/build
	/usr/bin/qmake-qt5 ../jami-qt.pro "LRC=/usr/include/libringclient"
	make -j4
}


# package() {
#	cd "$srcdir/${pkgname%-VCS}"
#	make DESTDIR="$pkgdir/" install
# }

package() {
  cd jami-client-qt/build
  # make DESTDIR="${pkgdir}/" install # waiting on upstream fixes
  install -Dm755 ./jami-qt "$pkgdir/usr/bin/jami-qt"
  install -Dm644 ../License.rtf "$pkgdir/usr/share/licenses/jami-client-qt/LICENSE" # waiting on an upstream rename
}
