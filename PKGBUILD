# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Your Name <youremail@domain.com>
pkgname=freedns-go-git # '-bzr', '-git', '-hg' or '-svn'
pkgname_raw=freedns-go
pkgver=r71.9977496
pkgrel=1
pkgdesc="Optimized DNS Server for Chinese users."
arch=(any)
url="https://github.com/tuna/freedns-go"
license=('MIT')
groups=()
depends=()
makedepends=('git' 'go' 'python') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/tuna/freedns-go.git')
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "freedns-go"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {
	cd "$srcdir/${pkgname_raw}"
	make update_db
}

build() {
	cd "$srcdir/${pkgname_raw}"
	make
}

package() {
	cd "$srcdir/${pkgname_raw}"
	osarch=$CARCH
	echo "$osarch"
	if [ "$osarch" == "x86_64" ]
	then
		osarch="amd64"
	fi
	mkdir -p "$pkgdir/usr/bin"
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	install -m +x "build/freedns-go-linux-$osarch" ${pkgdir}/usr/bin/freedns-go
}
