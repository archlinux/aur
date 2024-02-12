# Maintainer: bziemons <ben@rs485.network>
pkgname=ulwgl-git
pkgver=0.1.RC3.15.g3cb0083
pkgrel=2
pkgdesc="Unified launcher for Windows games on Linux in progress using Steam Runtime Tools, independent of Steam."
license=('custom')
arch=('any')
url="https://github.com/Open-Wine-Components/ULWGL-launcher"
depends=(python)
makedepends=(git)
provides=(ulwgl)
conflicts=(ulwgl)
options=(!strip)
source=("git+https://github.com/Open-Wine-Components/ULWGL-launcher.git")
sha512sums=('SKIP')

pkgver() {
    cd "ULWGL-launcher"
    printf "%s" $(git describe HEAD | sed 's/-/./g')
}

check() {
    cd "ULWGL-launcher"
    export PYTHONDONTWRITEBYTECODE=1
    python gamelauncher_test.py
}

build() {
    cd "ULWGL-launcher"
    echo "Packing ULWGL-launcher.tar.gz"
    tar --sort=name \
        --mtime="@${SOURCE_DATE_EPOCH:-$(date +%s)}" \
        --owner=0 --group=0 --numeric-owner \
        --pax-option=exthdr.name=%d/PaxHeaders/%f,delete=atime,delete=ctime \
        -czf ULWGL-launcher.tar.gz *
}

package() {
    install -Dm 644 "ULWGL-launcher/ULWGL-launcher.tar.gz" "${pkgdir}/usr/share/ULWGL/ULWGL-launcher.tar.gz"
    install -Dm 755 "ULWGL-launcher/ulwgl-run-cli" "${pkgdir}/usr/bin/ulwgl-run-cli"
}
