# Maintainer: bziemons <ben@rs485.network>
pkgname=ulwgl-git
pkgver=0.1.RC3.89.g33bd828
pkgrel=1
pkgdesc="Unified launcher for Windows games on Linux in progress using Steam Runtime Tools, independent of Steam."
license=('custom')
arch=('any')
url="https://github.com/Open-Wine-Components/ULWGL-launcher"
depends=(python wget)
makedepends=(git)
provides=(ulwgl)
conflicts=(ulwgl)
options=(!strip)
install=ulwgl-git.install
source=('git+https://github.com/Open-Wine-Components/ULWGL-launcher.git'
        'ulwgl-run-cli')
sha512sums=('SKIP'
            '3834036478af8df8aba581b12ba479aae646d9cb9193f801be966c208ed17975c252b712e8cb06ca8d3f5dbb07d14f24d2621e5711c6fce39b6f1cbde48881f9')

pkgver() {
    cd "ULWGL-launcher"
    printf "%s" $(git describe HEAD | sed 's/-/./g')
}

prepare() {
    fullver="${pkgver}-${pkgrel}"
    echo "Replacing ULWGL_LAUNCHER_VER content with ${fullver}"
    echo -n "${fullver}" > ULWGL-launcher/ULWGL-VERSION
    sed -i 's/^ULWGL_LAUNCHER_VER=.*$/ULWGL_LAUNCHER_VER='"${fullver}"/ ulwgl-run-cli

    if [[ -r "ULWGL-launcher/ulwgl-run-cli" ]]; then
        protonver="$(grep -E --color=no '^ULWGL_PROTON_VER=' ULWGL-launcher/ulwgl-run-cli)"
        if [[ -z "${protonver}" ]]; then
            echo "Could not determine ULWGL_PROTON_VER!"
        else
            echo "Replacing ${protonver}"
            sed -i 's/^ULWGL_PROTON_VER=.*$/'"${protonver}"/ ulwgl-run-cli
        fi
    else
        echo "Could not read ULWGL-launcher/ulwgl-run-cli. PKGBUILD probably outdated!"
    fi
}

build() {
    cd "ULWGL-launcher"
    echo "Packing ULWGL-launcher.tar.gz"
    tar --sort=name \
        --mtime="@${SOURCE_DATE_EPOCH:-$(date +%s)}" \
        --owner=0 --group=0 --numeric-owner \
        --pax-option=exthdr.name=%d/PaxHeaders/%f,delete=atime,delete=ctime \
        -czf ../ULWGL-launcher.tar.gz *
}

check() {
    cd "ULWGL-launcher"
    export PYTHONDONTWRITEBYTECODE=1
    python ulwgl_test.py
}

package() {
    install -Dm 644 "ULWGL-launcher.tar.gz" "${pkgdir}/usr/share/ULWGL/ULWGL-launcher.tar.gz"
    install -Dm 755 "ulwgl-run-cli" "${pkgdir}/usr/bin/ulwgl-run-cli"
}
