# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>

pkgname=libshv-git
_gitname=libshv
pkgver=r2914.c8072229
pkgrel=1
pkgdesc='An RPC framework build around the ChainPack packing schema'
url='https://github.com/silicon-heaven/libshv'
arch=('i686' 'x86_64' 'armv7h')
license=('LGPL3')
depends=('necrolog' 'glibc' 'gcc-libs' 'qt6-base' 'qt6-serialport' 'qt6-websockets')
makedepends=('git' 'cmake' 'libldap' 'pkg-config')
checkdepends=('doctest' 'trompeloeil')
optdepends=('libldap: for LDAP support')
conflicts=('libshv' 'libshv-git')
provides=('libshv')
source=('git+https://github.com/silicon-heaven/libshv.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
	ctest --test-dir "$srcdir/build"
}

build() {
	cmake -S "$srcdir/$_gitname" -B "$srcdir/build" \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DLIBSHV_USE_LOCAL_NECROLOG=ON \
	-DLIBSHV_WITH_ALL=ON

	cmake --build "$srcdir/build"
}

package() {
	DESTDIR="$pkgdir" cmake --install "$srcdir/build"
	install -Dm644 "$srcdir/${pkgname%-git}/bash-completion/shv" "${pkgdir}/usr/share/bash-completion/completions/shv"
	for prog_name in shvcall shvdevice minimalshvclient minimalshvbroker; do
		ln -s shv "${pkgdir}/usr/share/bash-completion/completions/$prog_name"
	done

	rm "${pkgdir}/usr/bin/cp2cp" # To remove conflict with the rust version
}
