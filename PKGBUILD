# Maintainer: taotieren <admin@taotieren.com>

pkgbase=qdap-git
pkgname=qdap-git
pkgver=r59.e98842a
pkgrel=1
groups=()
pkgdesc="cmsis-dap upper by a Qt"
arch=($CARCH)
url="https://github.com/ma6254/QDAP"
license=('GPL-3.0-only')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=(
    bash
    gcc-libs
    glibc
    libgit2
    libusb
    hidapi
    qt5-base
    yaml-cpp
)
makedepends=(
    git
    cmake
    ninja
    qt5-tools
    rsync
    pkgconf
)
optdepends=()
source=("${pkgname}::git+${url}.git"
    "git+https://github.com/ma6254/qdap_chips.git"
    "yaml-cpp::git+https://github.com/jbeder/yaml-cpp.git"
    "QHexView::git+https://github.com/Dax89/QHexView.git"
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}/"
    #     git submodule update --init --recursive
    git submodule init
    git config submodule.vendor/yaml-cpp.url "$srcdir/yaml-cpp"
    git config submodule.vendor/QHexView.url "$srcdir/QHexView"
    git -c protocol.file.allow=always submodule update
}

build() {
    # see：https://wiki.archlinux.org/title/CMake_package_guidelines
    cmake -S ${pkgname} \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -B build \
        -G Ninja \
        -Wno-dev

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/build install
    install -dm0755 "${pkgdir}/usr/share/${pkgname%-git}/chips"
    cd ${srcdir}/qdap_chips
    rsync -av --exclude='.*' . ${pkgdir}/usr/share/${pkgname%-git}/chips/
    mv ${pkgdir}/usr/bin/QDAP "${pkgdir}/usr/share/${pkgname%-git}/"
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-git}" <<EOF
#!/usr/bin/env bash

cd /usr/share/qdap/

./QDAP
EOF
    sed -i 's|/usr/bin/QDAP|/usr/bin/qdap|g' ${pkgdir}/usr/share/applications/io.github.ma6254.qdap.desktop
}
