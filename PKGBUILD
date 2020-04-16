# Maintainer: Duong Do Minh Chau <duongdominhchau@gmail.com>
pkgname=o20-git
pkgver=r133.4f14dbe
pkgrel=1
pkgdesc="Office365 on your Linux PC"
arch=(x86_64)
url="https://gitlab.com/abstractsoftware/o20/o20coreapps"
license=('GPL')
depends=(zlib syntax-highlighting sonnet breeze
    qt5-{base,svg,quickcontrols{,2}}
    k{textwidgets,widgetsaddons,archive,config,iconthemes,coreaddons}
)
makedepends=(git cmake extra-cmake-modules)
provides=(${pkgname/-git/})
conflicts=(${pkgname/-git/})
source=("${pkgname}::git+https://gitlab.com/abstractsoftware/o20/o20coreapps.git")
sha256sums=(SKIP)

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
    mkdir -p build && cd build
    # TODO: Use existing font packages instead
    cmake \
        -DCOMPILE_ONLY_WORD=On \
        -DINSTALL_FONT=On \
        ..
    make
}

package() {
    cd "${pkgname}/build"
    make DESTDIR="${pkgdir}" install
    cd ..
    install -Dm644 -t "${pkgdir}/usr/share/licenses/o20" \
        COPYING LICENSE
}
