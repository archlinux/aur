# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=checkmake
pkgname=${_name}-git
pkgver=0.2.1.r0.g7c87b7f
pkgrel=1
pkgdesc="Experimental linter/analyzer for makefiles"
arch=('any')
url="https://github.com/mrtazz/checkmake"
license=('MIT')
makedepends=('git' 'go' 'pandoc')
conflicts=('checkmake')
source=("git+https://github.com/mrtazz/checkmake.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_name}"
	git describe --long --tags | sed 's/_/./;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
    cd "${srcdir}/${_name}"
    export CGO_LDFLAGS="$LDFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_CPPFLAGS="$CPPFLAGS"
    export BUILDER_NAME="${BUILDER_NAME:-$(git config user.name || echo makepkg)}"
    export BUILDER_EMAIL="${BUILDER_EMAIL:-$(git config user.email || echo makepkg)}"
    make clean
    make EXT_LDFLAGS="-linkmode external" GOFLAGS="-buildmode=pie -trimpath"
}

package() {
    cd "${srcdir}/${_name}"
    install -Dm755 checkmake "${pkgdir}/usr/bin/checkmake"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 checkmake.1 "${pkgdir}/usr/share/man/man1/checkmake.1"
}
