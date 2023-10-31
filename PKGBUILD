# Maintainer: Denis Kobozev <d.v.kobozev at gmail dot com>
pkgname=tatlin
pkgver=0.3.1
pkgrel=1
pkgdesc="3D STL and G-code viewer"
arch=("any")
url="https://github.com/dkobozev/tatlin"
license=("GPL2")
depends=("python-wxpython" "python-numpy" "python-pillow" "python-opengl" "python-six")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://github.com/dkobozev/tatlin/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("b907ecd9b7c06b9754f1e9237ca78c180a4e4c36ab73955de0ad205978c054ee")

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"

    install -d -m755 "${pkgdir}/usr/share/applications"
    install -d -m755 "${pkgdir}/usr/share/icons/hicolor/64x64/apps/"
    install -d -m755 "${pkgdir}/etc/"

    cp tatlin.desktop "${pkgdir}/usr/share/applications/tatlin.desktop"
    cp ./tatlin/tatlin.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/"

    # TODO: update platform to EGL and stop ignoring the context once
    #       python-opengl package is updated to 3.1.7
    echo -e "PYOPENGL_PLATFORM=x11\nIGNORE_PLATFORM_CONTEXT=1" > "${pkgdir}/etc/tatlin.conf"

    python setup.py install --root="$pkgdir" --optimize=1
}
