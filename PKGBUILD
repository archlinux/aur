# Maintainer: devome <evinedeng@hotmail.com>

pkgname=asgi-webdav
pkgver=1.4.1
pkgrel=1
pkgdesc="An asynchronous WebDAV server implementation, Support multi-provider, multi-account and permission control."
arch=("any")
url="https://github.com/rexzhang/${pkgname}"
license=('MIT')
backup=("etc/${pkgname}/config.json")
install="${pkgname}.install"
provides=("python-${pkgname}")
conflicts=("python-${pkgname}")
replaces=("python-${pkgname}")
depends=("python-aiofiles" "python-arrow" "python-asgi-middleware-static-file" "python-chardet" "python-click" "python-pydantic" "python-xmltodict")
optdepends=("python-bonsai: LDAP support"
            "python-brotli: response compress support")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.user.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles"
        config.json)
sha256sums=('735a3fd098c7bf8b923a27996868a8b8f19d450cf16598d189443a6c32512699'
            '7120afec227196f9f134e7ac87893581952c3592a91eb6daa08f5075db3a06de'
            '586b9318035cb76204ac4d536c845ce1ffc0c9eb60022c170ad6eeca0d0389f2'
            'd230496ce61436b709d34078273df5e4b6036eab316b5c9f54f5d261a5c61ea8'
            'a1bc83acb2b0429b4aef7b1bda3a5c0b19312ef4b6680040cc81b34e233e469c'
            'd10c0e9cafc0e1df19a842d78b0e6d537369752ee00e3d33c87ae8579b3d336c')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    install -Dm644 "${pkgname}.service"      "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.user.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
    install -Dm644 "${pkgname}.sysusers"     "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.tmpfiles"     "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -Dm644 config.json                "${pkgdir}/etc/${pkgname}/config.json"

    cd "${pkgname}-${pkgver}"
    install -Dm644 LICENSE                    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
