# Maintainer: Haoqing Chen <chenhq2005@gmail.com>
# Special thanks to PKGBUILD authors of the goneovim-bin AUR package for the desktop profile and icon
pkgname=goneovim-git
pkgver=r2332.c87cba6
pkgrel=1
pkgdesc="Neovim GUI written in Golang, using a Golang qt backend (git build)"
arch=('x86_64')
url="https://github.com/akiyosi/goneovim"
license=('MIT')
depends=('neovim' 'glibc' 'gcc-libs' 'libx11' 'nss' 'nspr' 'fontconfig' 'freetype2' 'expat' 'zlib' 'libglvnd' 'libxcb' 'gdk-pixbuf2')
makedepends=('git' 'go' 'qt5-base' 'qt5-tools' 'qt5-webengine' 'qt5-multimedia' 'qt5-svg' 'qt5-declarative' 'qt5-webchannel')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "goneovim-bin")
source=('goneovim::git+https://github.com/akiyosi/goneovim.git' 'goneovim.ico')
sha256sums=('SKIP'
            '0a36211b6ada93d811575b5ca9b33511e405f61cca791858ea2fe1eb5d29279e')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    export GO111MODULE=off
    export GOPATH="$srcdir/go"
    export GOPROXY=https://goproxy.io
    go get -v github.com/therecipe/qt/cmd/...
    go get -v -d github.com/akiyosi/goneovim/...
    cd "$srcdir/${pkgname%-git}"
    $(go env GOPATH)/bin/qtmoc
}

build() {
    export GOPATH="$srcdir/go"
    cd "$srcdir/${pkgname%-git}/cmd/goneovim"
    $(go env GOPATH)/bin/qtdeploy build desktop
    cp -pR ../../runtime ./deploy/linux/
    sed -e 's/\/path\/to\/goneovim\/goneovim/\/opt\/goneovim\/goneovim/' -e 's/\/path\/to\/goneovim.ico/\/usr\/share\/pixmaps\/goneovim.ico/' -i "${srcdir}/${pkgname%-git}/cmd/goneovim/goneovim.desktop"
}

package() {
    install -Dm644 "${srcdir}/goneovim.ico" "${pkgdir}/usr/share/pixmaps/goneovim.ico"
    install -Dm644 "${srcdir}/${pkgname%-git}/cmd/goneovim/goneovim.desktop" "${pkgdir}/usr/share/applications/goneovim.desktop"

    mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/bin"
    cp -r "${srcdir}/${pkgname%-git}/cmd/goneovim/deploy/linux" "${pkgdir}/opt/goneovim"
    ln -snf "/opt/goneovim/goneovim" "${pkgdir}/usr/bin/goneovim"
}
