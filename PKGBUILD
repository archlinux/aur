# Maintainer: Zack Didcott

pkgname=vbox-api-git
pkgver=1.4.0
pkgrel=1
pkgdesc="Python bindings to the VirtualBox SOAP API."
arch=("any")
url="https://github.com/Zedeldi/vbox-api"
license=("MIT")
depends=("python" "python-zeep" "python-pillow" "python-psutil" "python-flask" "gunicorn")
optdepends=(
    "novnc: remote control support"
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
    python -m installer --destdir="${pkgdir}" dist/*.whl
}