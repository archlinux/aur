# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Your Name <youremail@domain.com>
pkgname=wsa-git
pkgver=r8.f558403
pkgrel=1
pkgdesc="GPUOpen-Drivers Window System Agent"
arch=('x86_64')
url="https://github.com/GPUOpen-Drivers/wsa"
license=('custom')
groups=()
depends=('wayland')
makedepends=('git' 'cmake' 'ninja') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('wsa::git+https://github.com/GPUOpen-Drivers/wsa.git#branch=master'
        '0001-install-headers.patch')
noextract=()
sha256sums=('SKIP'
            'df079c020c45534e4015753e319f28345e269821b1abf2a3fea55627252dcd78')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/wsa"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/wsa"
	patch -p1 < ../../0001-install-headers.patch
}

build() {
	cd "$srcdir/wsa"
	cmake \
		-B build \
		-G Ninja \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		.
	ninja -C build
}

package() {
	cd "$srcdir/wsa"
	DESTDIR="$pkgdir" ninja -C build install
	cd "$pkgdir"
	mv usr/lib64 usr/lib
}
