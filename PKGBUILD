# Maintainer: Doclic <doclic@tutanota.com>

pkgname=vtex2-git
pkgver=0.1.r86.825dc77
pkgrel=1
epoch=
pkgdesc="A VTF conversion and creation tool"
arch=(i686 x86_64 aarch64)
url="https://github.com/StrataSource/vtex2"
license=('MIT')
groups=()
depends=()
makedepends=(cmake make git)
checkdepends=()
optdepends=(qt6-base)
provides=(vtex2)
conflicts=(vtex2)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/StrataSource/vtex2.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd vtex2
	printf "0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd vtex2
	git submodule update --init --recursive
}

build() {
	mkdir vtex2/build
	cd vtex2/build
	if ! pacman -Qs qt5-base > /dev/null; then
        BUILD_GUI=0
    else
		BUILD_GUI=1
	fi
	cmake -DBUILD_GUI=$BUILD_GUI ..
	make -j$(njproc)
}

package() {
	cd vtex2

	install -Dm755 build/vtex2 "${pkgdir}"/usr/bin/vtex2
	if [ -f build/vtfview ]; then
		install -Dm755 build/vtfview "${pkgdir}"/usr/bin/vtfview
	fi
	install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/vtex2/LICENSE
	install -Dm644 README.md "${pkgdir}"/usr/share/vtex2/README.md
}
