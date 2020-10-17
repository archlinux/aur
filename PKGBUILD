# Maintainer: SpacingBat3 https://github.com/spacingbat3
# Contributor: Hekuran https://github.com/narukeh

pkgname=sm64ex-nightly-git
pkgver=r592.2cf99649
pkgrel=1
pkgdesc='Nightly branch of sm64ex with 60fps patch. PKGBUILD based on sm64pc-git.'
arch=('any')
url='https://github.com/sm64pc/sm64ex'
license=('reverse-engineered and unlicensed')
makedepends=('git')
depends=('python' 'audiofile' 'sdl2' 'glew')
provides=(sm64ex-nightly)

_gitname=sm64ex
_region=us

source=('git+https://github.com/sm64pc/sm64ex.git#branch=nightly')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_gitname"
	cp "../../baserom.${_region}.z64" . || {
		printf "%$(stty size | awk '{print $2}')s\n" | sed "s/ /░/g"
		printf "\\n%s\\n%s\\n\\n" \
			"NO ROM FOUND! Copy your sm64 ROM to \"$(realpath ../../)\" and rename it to \"baserom.${_region}.z64\"." \
			"The default ROM region is US. You have to edit the PKGBUILD if you would like to use a JP or EU version."
		printf "%$(stty size | awk '{print $2}')s\n" | sed "s/ /░/g"
	}
}

build() {
	cd "$srcdir/$_gitname"
	patch -p1 < "./enhancements/60fps_ex.patch"
	make VERSION=$_region BETTERCAMERA=1 ${MAKEFLAGS:--j$(nproc)}
}

package() {
	install -Dm755 "$srcdir/$_gitname/build/${_region}_pc/sm64.${_region}".* "${pkgdir}/usr/bin/sm64ex-nightly"
	install -Dm755 "$srcdir/../sm64ex-nightly.desktop" "${pkgdir}/usr/share/applications/sm64ex-nightly.desktop"
	install -Dm755 "$srcdir/../SM64nightly.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/SM64nightly.png"
}
