# Maintainer: Duong Do Minh Chau <duongdominhchau@gmail.com>
pkgname=gitqlient-git
pkgver=1.6.3.r146.7dc55729
pkgrel=1
pkgdesc="Development branch of GitQlient"
arch=(x86_64)
url="https://github.com/francescmm/GitQlient"
license=('LGPL')
depends=(git qt6-base)
makedepends=(vulkan-headers)
provides=(gitqlient)
conflicts=(gitqlient)
source=(
    "git+https://github.com/francescmm/GitQlient#branch=future/2.0.0"
)
sha256sums=(
    SKIP
)
project_name=GitQlient

pkgver() {
    cd "$project_name"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "$project_name"
    sed -iEe 's|url = ../|url = https://github.com/francescmm/|g' .gitmodules
    git submodule update --init
}

build() {
    cd "$project_name"
    cmake -B build
    cmake --build build
}

package() {
    cd "$project_name"
    cmake --install build
    cp -r build/install/usr "${pkgdir}"
    install -Dm644 "${srcdir}/${project_name}/LICENSE" -t "${pkgdir}/usr/share/licenses/gitqlient"
}
