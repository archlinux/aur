# Maintainer: Duong Do Minh Chau <duongdominhchau@gmail.com>
pkgname=gitqlient-git
pkgver=1.6.3.r144.f634298d
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
    fix_include_in_test_graph.patch
)
sha256sums=(
    SKIP
    3f18f24933fae8faff8f4d950f82e16a959dbab94db27ea742023cea4dd2d8a1
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
    echo git apply "${srcdir}/fix_include_in_test_graph.patch"
    git apply "${srcdir}/fix_include_in_test_graph.patch"
}

build() {
    cd "$project_name"
    mkdir -p build && cd build
    cmake ..
    make
}

package() {
    cd "$project_name/build"
    make INSTALL_ROOT="${pkgdir}" install
    install -Dm755 "app/${project_name}" "${pkgdir}/usr/bin/gitqlient"
    install -Dm644 "${srcdir}/${project_name}/LICENSE" -t "${pkgdir}/usr/share/licenses/gitqlient"
}
