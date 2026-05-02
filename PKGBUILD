# Maintainer: Toni500 <tonino512@linuxmail.org>
pkgname="oshot-git"
_pkgname="oshot"
pkgver=0.4.4.r3.c1c32ca
pkgrel=1
pkgdesc="A fast and lightweight screenshot tool for extracting text on the fly (git)"
arch=('x86_64' 'aarch64')
url="https://github.com/Toni500github/oshot"
license=('BSD-3-Clause')
depends=(
  'libx11'
  'libxcb'
  'libpng'
  'glfw'
  'tesseract'
  'tesseract-data-eng'
  'zbar'
  'libappindicator-gtk3'
)
makedepends=('base-devel')
optdepends=(
	'grim: wlroots-based screen capture'
	'wl-clipboard: Wayland clipboard'
)
conflicts=('oshot' 'oshot-bin')
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --tags --long --abbrev=7 | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    cmake -B build -S . \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr

    cmake --build build
}

package() {
    mkdir -p "${pkgdir}/usr/bin"
    cd "${srcdir}/${_pkgname}"
    install -Dm755 ./build/${_pkgname}  "${pkgdir}/usr/bin"
    install -Dm644 LICENSE              "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 ${_pkgname}.desktop  "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
