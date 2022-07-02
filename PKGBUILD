# Maintainer: Gianluca Mascolo <gianluca@gurutech.it>

makedepends=(python-build python-installer python-poetry python-pytest)
depends=(python-yaml python-gobject python-pyotp gtk3 hicolor-icon-theme)
optdepends=('sops: Enable otp encryption')
source=('otpgui-0.2.3.tar.gz::https://github.com/gianluca-mascolo/otpgui/archive/refs/tags/0.2.3.tar.gz')
sha256sums=('ee106c4009768e0005c51ff84cb0bd3e0c3f3c68568fe12e867942621965d9a0')
pkgname=otpgui
pkgver=0.2.3
pkgdesc="An OTP generator compatible with totp. Written in python and gtk."
url="https://github.com/gianluca-mascolo/otpgui"
arch=('any')
license=('GPL')
pkgrel=1
build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

check(){
    cd "$srcdir/$pkgname-$pkgver"
    pytest
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    for Icon in $(find icons/ -name otpgui.png); do {
        IconDir=$(dirname "$Icon")
        IconSize=$(basename "$IconDir")
        install -D -m 0644 $Icon ${pkgdir}/usr/share/icons/hicolor/${IconSize}/apps/otpgui.png
    }
    done
    install -D -m 0644 otpgui.desktop ${pkgdir}/usr/share/applications/otpgui.desktop
}
