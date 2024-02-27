# Maintainer: bziemons <ben@rs485.network>
pkgname=ulwgl-git
pkgver=0.1.RC3.149.g551556a
pkgrel=2
pkgdesc="Unified launcher for Windows games on Linux in progress using Steam Runtime Tools, independent of Steam."
license=('custom')
arch=('any')
url="https://github.com/Open-Wine-Components/ULWGL-launcher"
depends=(python wget)
makedepends=(git jq)
provides=(ulwgl)
conflicts=(ulwgl)
options=(!strip)
install=ulwgl-git.install
source=('git+https://github.com/Open-Wine-Components/ULWGL-launcher.git')
sha512sums=('SKIP')

pkgver() {
    cd "ULWGL-launcher"
    printf "%s" $(git describe HEAD | sed 's/-/./g')
}

build() {
    cp "ULWGL-launcher/ULWGL/ULWGL_VERSION.json" ULWGL_VERSION.json
    fullver="${pkgver}-${pkgrel}"
    echo "Replacing launcher and runner version with ${fullver}"
    jq '(.ulwgl.versions.launcher,.ulwgl.versions.runner)='\""${fullver}"\" > ULWGL_VERSION.json < "ULWGL-launcher/ULWGL/ULWGL_VERSION.json"
}

check() {
    cd "ULWGL-launcher/ULWGL"
    export PYTHONDONTWRITEBYTECODE=1
    python ulwgl_test.py
    python ulwgl_test_plugins.py
}

package() {
    install -Dm 755 -d "${pkgdir}/usr/share/ULWGL"
    cp -rdp ULWGL-launcher/ULWGL/* "${pkgdir}/usr/share/ULWGL/"
    install -m 644 ULWGL_VERSION.json "${pkgdir}/usr/share/ULWGL/ULWGL_VERSION.json"
    install -Dd "${pkgdir}/usr/bin"
    ln -s /usr/share/ULWGL/ulwgl_run.py "${pkgdir}/usr/bin/ulwgl-run"
}
