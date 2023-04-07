# Maintainer: bgh <aur at bgh dot io>

pkgname=it-tools-web
_pkgname=it-tools
pkgver=2.19.0
pkgrel=1
pkgdesc='Collection of handy online tools for developers, with great UX'
arch=('any')
url=https://github.com/CorentinTh/it-tools
license=('GPL3')
makedepends=('npm')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a00161c9009ac4f953b61873b46ad45dae7f83a7c0602f7d7160773100b3d08f')

build() {
    npm install "v${pkgver}.tar.gz"
    cd "node_modules/${_pkgname}"
    npm install
    # Happy medium value works around fatal OOM error and hangs building on machine with 2 GB RAM
    # https://github.com/vitejs/vite/issues/2433
    export NODE_OPTIONS=--max-old-space-size=1792
    npm run build
}

package() {
    local dest_dir="/usr/share/webapps/${_pkgname}"

    install --directory --verbose "${pkgdir}${dest_dir}"
    cp --recursive --no-target-directory "node_modules/${_pkgname}/dist" "${pkgdir}${dest_dir}"
}
