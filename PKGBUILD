# Maintainer: Alex Smith <azphreal19@protonmail.com>
_pkgname=koel-app
pkgname="${_pkgname}-git"
pkgver=r39.000bc57
_dpkgver=0.0.0
pkgrel=1
pkgdesc="The desktop application for Koel."
arch=('x86_64')
url="https://github.com/phanan/koel-app"
license=("MIT")
depends=("nss" "alsa-lib" "libnotify" "gtk3" "gconf" "libxtst")
makedepends=("npm")
source=("git+https://github.com/phanan/koel-app.git")
md5sums=("SKIP")

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"
    npm install
    npm run release
    ar p "releases/${_pkgname}_${_dpkgver}_amd64.deb" "data.tar.xz" | tar xvJ -C "${srcdir}"
}

package() {
    cd "${srcdir}"
    install -d "${pkgdir}/opt"
    cp -R "opt/${_pkgname}" "${pkgdir}/opt"
    install -Dm644 "usr/share/applications/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
