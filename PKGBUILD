# Maintainer: Nick Econopouly <wry at mm dot st>
pkgname=jami-client-qt-git
pkgver=r296.8caf659
pkgrel=1
pkgdesc="A free and private communication platform (QT client)"
arch=('x86_64')
provides=('jami-client-qt')
url="https://git.jami.net/savoirfairelinux/jami-client-qt"
license=('GPL3')
depends=('jami-daemon-git' 'libjamiclient-git' 'qt5-base' 'libnm' 'qrencode')
makedepends=('git' )
conflicts=('jami-gnome-git' 'jami-gnome')
source=("git+$url.git" '0002.patch')
sha512sums=(SKIP 1b10011ac78f71457b1a391c8a192d9a024e202f20b34e13d0d9d3c0092c1ef4fb9826c2ac092d2e60d72e8f4f68cb87275dd4a7397e72d1ac1157caacf9e33d)


pkgver() {
  cd $srcdir/jami-client-qt
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


 prepare() {
	cd $srcdir/jami-client-qt
	git apply ../0002.patch
	mkdir -p build
 }


build() {
	cd jami-client-qt
	cd build
	# /usr is necessary for Arch; see https://archlinux.org/news/binaries-move-to-usrbin-requiring-update-intervention/
	cmake .. -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr"
	make -j`nproc` # -j`nproc` uses as many cores as possible to speed up the build
}

package() {
    cd jami-client-qt/build
    make install
}
