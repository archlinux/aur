# Maintainer: Oleksandr Knyshuk <kigen745 at gmail dot com>

_pkgname=Havoc
pkgname=havoc-c2-git
pkgver=r619.f163210
pkgrel=1
pkgdesc="Modern and malleable post-exploitation command and control framework"
arch=('x86_64')
url="https://havocframework.com/"
license=('GPL3')
depends=('openssl' 'qt5-base' 'qt5-websockets' 'python3' 'fontconfig' 'gtest'
		 'spdlog' 'boost' 'boost-libs' 'ncurses' 'gdbm' 'readline' 'libffi'
		 'sqlite' 'bzip2' 'nasm' 'mingw-w64-gcc' 'go' 'mesa' 'glu')
makedepends=('git' 'base-devel' 'cmake')
optdepends=('qt5-wayland: wayland support')
source=('git+https://github.com/HavocFramework/Havoc.git#branch=dev')
install='havoc-c2-git.install'
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	(	set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

prepare() {
	cd "$_pkgname/client"
	if [ -d "Modules" ]; then echo "Modules installed"; else git clone https://github.com/HavocFramework/Modules; fi
	cd ../teamserver
	go mod download golang.org/x/sys
	go mod download github.com/ugorji/go
}

build() {
	cd $_pkgname
	sed -i '/sudo/d' makefile && sed -i '/apt/d' teamserver/Install.sh
	make all
}

package() {
	install -d "$pkgdir"/{opt,usr/bin,usr/share/licenses}
	cp -r $_pkgname "$pkgdir"/opt/
	rm -rf "$pkgdir"/opt/"$_pkgname"/assets
	install -Dm755 ../havoc_runner.sh "${pkgdir}"/usr/bin/havoc
	install -Dm644 "$_pkgname"/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
