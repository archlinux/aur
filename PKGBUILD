
# Maintainer: Aron Young <tkf6fkt at gmail dot com>
# Contributor: Asuka Minato
# This doesn't update, just patch to qt5, so I remove the -git
pkgname=kscope
pkgver=1.9.4
pkgrel=1
pkgdesc="A source-code browsing, analysis and editing environment for large C projects."
arch=(x86_64)
url="https://sourceforge.net/projects/kscope/"
license=('GPL2')
depends=(qscintilla-qt5 qt5-base glibc gcc-libs)
makedepends=(git)
provides=(kscopeapp)
source=("git+https://github.com/chaoys/kscope.git#commit=20fc411f2a155121e9732b0945eb3af8ce373fe5")
sha256sums=('SKIP')

build() {
	cd "$pkgname"
	# https://stackoverflow.com/a/51235535
	sed -i "s/\$\${INSTALL_PATH}/\$\$\(INSTALL_PATH\)/g" ./**/*.pro
	for f in core editor cscope app; do
		pushd "$f"
		INSTALL_PATH=$pkgdir/usr/ qmake
		INSTALL_PATH=$pkgdir make -j8
		popd
	done
	INSTALL_PATH=$pkgdir/usr/ qmake
	INSTALL_PATH=$pkgdir make -j8
}

package() {
	cd "$pkgname"
	INSTALL_PATH=$pkgdir/usr/ make install
}
