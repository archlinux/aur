# Maintainer: Rup <boraxkasein [at] gmail [dot] com>

_pkgname=zatackax
pkgname="${_pkgname}-git"
pkgver=0.3.1.r1.g350fdb4
pkgrel=1
pkgdesc="A modern, free remake of the classic Achtung, die Kurve!"
arch=('x86_64' 'i686')
url="https://github.com/simenheg/zatackax"
license=('GPL3')
depends=('sdl>=1.2' 'sdl_image>=1.2' 'sdl_ttf>=2.0' 'sdl_mixer>=1.2')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/simenheg/zatackax.git"
        "path-for-game-data.patch"
        "${_pkgname}.png"
        "${_pkgname}.desktop")
sha256sums=('SKIP'
            '74f286abf0acaada6069dfa801f7b99ca90aca4c7943cec3131145b27340f244'
            'b6feb8f64b918f637cb0a5e4989d1bd242ee3aee1a9d05d952b77812bdb41545'
            '424c0e5e693efc269fdeddcf46351724b8e95dedff57390fda96d3f79f623e1b')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tag | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    ls -al
    cd "${_pkgname}/src"
    patch -p1 -i "${srcdir}/path-for-game-data.patch"
}

build() {
    cd "${_pkgname}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${_pkgname}"

    # executable
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    # data folder
    find data -type f -exec install -Dm644 {} "$pkgdir"/usr/share/games/"$_pkgname"/{} \;

    # icon and desktop file
    install -Dm644 "${srcdir}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
