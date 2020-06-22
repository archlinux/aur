# Maintainer: Duong Do Minh Chau <duongdominhchau@gmail.com>
pkgname=gitqlient
pkgver=1.1.0
pkgrel=2
pkgdesc="A Git client originally forked from QGit that has continued its own path"
arch=(x86_64)
url="https://github.com/francescmm/GitQlient"
license=('LGPL')
depends=(git qt5-base qlogger)
source=("https://github.com/francescmm/GitQlient/archive/v${pkgver}.tar.gz" include.patch)
sha256sums=(
    SKIP
    0f2467a31bad6609e1f85d1dd4182e4918502d58447703a39d78c7c13532f584
)

prepare() {
	cd "GitQlient-$pkgver"

	sed -ie '/include(QLogger\/QLogger.pri)/d' GitQlient.pro

	# Use QLogger from other package instead of cloning it as submodule
	echo 'LIBS += -lQLogger' >> GitQlient.pro

	# Install into /usr/bin instead of /opt/GitQlient/bin
	echo 'target.path = /usr/bin' >> GitQlient.pro

	qmake
    sed -Eie 's/-Werror//g' Makefile

    # Fix missing include
    cd src/history
    patch --forward --unified --input "${srcdir}/include.patch"
}

build() {
	cd "GitQlient-$pkgver"
    make
}

package() {
	cd "GitQlient-$pkgver"
	# Actually this make install only one file: the executable...
	make INSTALL_ROOT="${pkgdir}" install
	# So we need to install other files by ourselves
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/gitqlient/LICENSE"
	cp -r "AppImage/GitQlient/usr" "${pkgdir}"
}
