# Maintainer: Hekuran https://github.com/narukeh

pkgname=sm64pc-git
pkgver=r504.f5005418
pkgrel=1
pkgdesc='Super Mario 64 PC (sm64ex aka. sm64pc) - OpenGL adaptation of n64decomp/sm64'
arch=('any')
url='https://github.com/sm64pc/sm64ex'
license=('reverse-engineered and unlicensed')
depends=('python' 'audiofile' 'sdl2' 'glew')
provides=(sm64ex)

_gitname=sm64ex
_region=us

source=('git+https://github.com/sm64pc/sm64ex.git')
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
	make VERSION=$_region BETTERCAMERA=1 ${MAKEFLAGS:--j$(nproc)}
}

package() {
	install -Dm755 "$srcdir/$_gitname/build/${_region}_pc/sm64.${_region}".* "${pkgdir}/usr/bin/sm64ex"
	ln -sf "${pkgdir}/usr/bin/sm64ex" "${pkgdir}/usr/bin/sm64pc"
	install -Dm755 "$srcdir/../sm64ex.desktop" "${pkgdir}/usr/share/applications/sm64ex.desktop"
	install -Dm755 "$srcdir/../SuperMario64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/SuperMario64.png"
}
