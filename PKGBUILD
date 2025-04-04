# Maintainer: Zack Didcott

pkgname=vbox-api-git
pkgver=2.1.2
pkgrel=1
pkgdesc="Python bindings to the VirtualBox SOAP API."
arch=("any")
url="https://github.com/Zedeldi/vbox-api"
license=("MIT")
depends=("python" "python-zeep" "python-pillow" "python-psutil" "python-flask" "gunicorn")
optdepends=(
    "novnc: remote control support"
    "python-flaskwebgui: GUI application"
    "virtualbox: local VirtualBox instance"
)
makedepends=("git" "python-build" "python-installer" "python-setuptools" "python-wheel")
provides=("vbox-api")
conflicts=("vbox-api")
backup=("etc/vbox-api-http.conf")
source=("${pkgname}::git+https://github.com/Zedeldi/vbox-api.git")
b2sums=("SKIP")

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}"
    install -Dm644 "deployment/systemd/vbox-api-http.service" "${pkgdir}/usr/lib/systemd/system/vbox-api-http.service"
    install -Dm644 "deployment/config/vbox-api-http.conf" "${pkgdir}/etc/vbox-api-http.conf"
    install -Dm644 "deployment/desktop/vbox-api-gui.desktop" "${pkgdir}/usr/share/applications/vbox-api-gui.desktop"
    install -Dm644 "deployment/desktop/vbox-api-gui.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/vbox-api-gui.png"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}