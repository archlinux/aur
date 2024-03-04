# Maintainer: bziemons <ben@rs485.network>
pkgname=ulwgl-git
pkgver=0.1.RC3.208.g17a1bb1
pkgrel=2
pkgdesc="Unified launcher for Windows games on Linux in progress using Steam Runtime Tools, independent of Steam."
license=('GPL-3.0-only')
arch=('any')
url="https://github.com/Open-Wine-Components/ULWGL-launcher"
depends=(python curl zenity)
makedepends=(git jq meson ninja gcc)
provides=(ulwgl)
conflicts=(ulwgl)
install=ulwgl-git.install
source=('git+https://github.com/Open-Wine-Components/ULWGL-launcher.git')
sha512sums=('SKIP')

prepare() {
    cd "ULWGL-launcher"
    git submodule update --init
}

pkgver() {
    cd "ULWGL-launcher"
    printf "%s" $(git describe HEAD | sed 's/-/./g')
}

build() {
    cp "ULWGL-launcher/ULWGL/ULWGL_VERSION.json" ULWGL_VERSION.json
    fullver="${pkgver}-${pkgrel}"
    echo "Replacing launcher and runner version with ${fullver}"
    jq '(.ulwgl.versions.launcher,.ulwgl.versions.runner)='\""${fullver}"\" > ULWGL_VERSION.json < "ULWGL-launcher/ULWGL/ULWGL_VERSION.json"

    cd "ULWGL-launcher/subprojects"
    arch-meson reaper reaper_build
    meson compile -C reaper_build
}

check() {
    cd "ULWGL-launcher/ULWGL"
    export PYTHONDONTWRITEBYTECODE=1
    python ulwgl_test.py
    python ulwgl_test_plugins.py

    ../subprojects/reaper_build/reaper -- sh -c "echo Reaper runs fine"
}

package() {
    install -Dm 755 -d "${pkgdir}/usr/share/ULWGL"
    cp -rdp ULWGL-launcher/ULWGL/* "${pkgdir}/usr/share/ULWGL/"
    install -m 644 ULWGL_VERSION.json "${pkgdir}/usr/share/ULWGL/ULWGL_VERSION.json"
    install -Dm 755 ULWGL-launcher/subprojects/reaper_build/reaper "${pkgdir}/usr/share/ULWGL/reaper"
    install -Dd "${pkgdir}/usr/bin"
    ln -s /usr/share/ULWGL/ulwgl_run.py "${pkgdir}/usr/bin/ulwgl-run"
}
