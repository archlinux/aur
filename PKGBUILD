# Maintainer: bziemons <ben@rs485.network>
pkgname=ulwgl-git
pkgver=0.1.RC3.197.ge5a7090
pkgrel=3
pkgdesc="Unified launcher for Windows games on Linux in progress using Steam Runtime Tools, independent of Steam."
license=('GPL-3.0-only')
arch=('any')
url="https://github.com/Open-Wine-Components/ULWGL-launcher"
depends=(python wget)
makedepends=(git jq meson ninja gcc)
provides=(ulwgl)
conflicts=(ulwgl)
install=ulwgl-git.install
source=('git+https://github.com/Open-Wine-Components/ULWGL-launcher.git' 'copyfile.patch')
sha512sums=('SKIP'
            '82fddc51d9b600dcdb739072b1f2f6ada07fbf8f0b2743f06519408dd5c5cd6964955ecc57be05635588f06fc0cd587e6803638d25c557a993629d6c99096243')

prepare() {
    cd "ULWGL-launcher"
    git submodule update --init
    git apply --verbose ../copyfile.patch
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

    cd "ULWGL-launcher"
    arch-meson reaper reaper_build
    meson compile -C reaper_build
}

check() {
    cd "ULWGL-launcher/ULWGL"
    export PYTHONDONTWRITEBYTECODE=1
    python ulwgl_test.py
    python ulwgl_test_plugins.py

    ../reaper_build/reaper -- sh -c "echo Reaper runs fine"
}

package() {
    install -Dm 755 -d "${pkgdir}/usr/share/ULWGL"
    cp -rdp ULWGL-launcher/ULWGL/* "${pkgdir}/usr/share/ULWGL/"
    install -m 644 ULWGL_VERSION.json "${pkgdir}/usr/share/ULWGL/ULWGL_VERSION.json"
    install -Dm 755 ULWGL-launcher/reaper_build/reaper "${pkgdir}/usr/share/ULWGL/reaper"
    install -Dd "${pkgdir}/usr/bin"
    ln -s /usr/share/ULWGL/ulwgl_run.py "${pkgdir}/usr/bin/ulwgl-run"
}
