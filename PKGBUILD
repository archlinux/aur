# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-wsgidav
pkgver=4.0.1
_commit_hash=d22ada5db70812ac9201c6861c53ce5cf2157342
pkgrel=3
pkgdesc="Generic WebDAV server based on WSGI"
arch=("any")
license=("MIT")
url="https://github.com/mar10/wsgidav"
depends=("python" "python-setuptools" "python-defusedxml" "python-yaml" "python-json5" "python-jinja")
makedepends=("python-setuptools")
optdepends=(
    "python-lxml: for faster XML processing"
    "python-cheroot: to use the built-in webserver"
    "python-pam: to use PAM for authentication"
)
source=(
    "https://github.com/mar10/wsgidav/archive/${_commit_hash}.tar.gz"
    "uwsgi.py"
    "uwsgi.ini"
    "config.example.json"
    "config.example.json5"
)
sha256sums=(
    "24f576ecbe7b4d0e33dceb5da167b1676a52a19541f7eb25582e02e7006aab07"
    "774ee839b5248d2614294daf2c8a28fda69f1524d8b5b61d9e75de7b9c986b4d"
    "25826e3ceec2e9e01c54e6367966537017b0c758c7eda131566a95f97b474250"
    "9e4d7e9ae9e56a5d0f14c91b296825114e57456888280e59dcf158dad36b9474"
    "28ee019fad42e9c7a2611147defec5e3bb6d2fbb3f5f69390a066f1c1033ef16"
)

build() {
    cd "wsgidav-${_commit_hash}"
    python setup.py build
}

package() {
    cd "wsgidav-${_commit_hash}"

    local _site_packages=$(python -c "import site; print(site.getsitepackages()[0], end='')")
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
    rm "${pkgdir}/usr/CHANGELOG.md"
    cp -r "wsgidav/dir_browser/htdocs" "${pkgdir}${_site_packages}/wsgidav/dir_browser/"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-wsgidav/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/python-wsgidav/README.md"
    install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/python-wsgidav/CHANGELOG.md"

    install -Dm644 "${srcdir}/uwsgi.py" "${pkgdir}/usr/share/python-wsgidav/uwsgi.py"
    install -Dm644 "${srcdir}/uwsgi.ini" "${pkgdir}/usr/share/python-wsgidav/uwsgi.ini"
    install -Dm644 "${srcdir}/config.example.json" "${pkgdir}/usr/share/python-wsgidav/config.example.json"
    install -Dm644 "${srcdir}/config.example.json5" "${pkgdir}/usr/share/python-wsgidav/config.example.json5"
    install -Dm644 "sample_wsgidav.yaml" "${pkgdir}/usr/share/python-wsgidav/config.example.yaml"
}
