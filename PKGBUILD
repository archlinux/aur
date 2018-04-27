# -*- mode: shell-script -*-
# Maintainer: Dylon Edwards <deltaecho at archlinux dot us>

pkgname='quartet-git'
pkgver=r2.a99c049
pkgrel=3
pkgdesc="A tetrahedral mesh generator that does isosurface stuffing with an acute tetrahedral tile."
arch=('x86_64')
url="https://github.com/crawforddoran/quartet"
license=('ISC')
changelog="${pkgname}.changelog"
makedepends=('git' 'gcc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
    "git+https://github.com/crawforddoran/${pkgname%-git}.git"
    "make-shared-lib.patch"
)
md5sums=(
    SKIP
    '8a34de71824f18b98d1c91c17857e174'
)

pkgver() {
    cd "${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname%-git}"
    git apply "${srcdir}/make-shared-lib.patch"
}

build() {
    cd "${pkgname%-git}"
    make depend
    make release
}

package() {
    cd "${pkgname%-git}"
    install -m 644 -D -t "${pkgdir}/usr/lib" libquartet.so
    install -m 755 -D -t "${pkgdir}/usr/bin" quartet view_tet
    install -m 644 -D -t "${pkgdir}/usr/include/quartet" \
        src/geometry_queries.h     \
        src/sdf.h                  \
        src/trimesh.h              \
        src/tet_mesh.h             \
        src/feature.h              \
        src/read_obj.h             \
        src/tet_quality.h          \
        src/match_features.h       \
        src/optimize_tet_mesh.h    \
        src/make_signed_distance.h \
        src/make_tet_mesh.h
}
