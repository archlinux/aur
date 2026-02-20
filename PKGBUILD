# Maintainer: devome <evinedeng@hotmail.com>

pkgname=asgi-webdav
pkgver=2.0.1
pkgrel=1
pkgdesc="An asynchronous WebDAV server implementation, Support multi-provider, multi-account and permission control."
arch=("any")
url="https://github.com/rexzhang/${pkgname}"
license=('MIT')
backup=("etc/${pkgname}/"{${pkgname}.env,config.json})
install="${pkgname}.install"
provides=("python-${pkgname}")
conflicts=("python-${pkgname}")
replaces=("python-${pkgname}")
depends=("python-aiofiles" "python-asgiref" "python-asgi-middleware-static-file" "python-chardet" "python-click"
         "python-dataclass-wizard" "python-dotenv" "python-httptools" "python-uvloop" "python-xmltodict" "uvicorn")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=("python-httpx" "python-httpx-kerberos" "python-icecream" "python-pytest" "python-pytest-asyncio" "python-pytest-cov" "python-pytest-mock" "python-requests")
optdepends=("python-bonsai: LDAP support"
            "python-httpx: WEBHDFS support"
            "python-httpx-kerberos: WEBHDFS support")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.env"
        "${pkgname}.service"
        "${pkgname}.user.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles"
        "config.json")
sha256sums=('15365115d6727bf113cd83ef60e81b0b16bdeea48601df08651a8aa6b5ce1839'
            '323b0abc7b6e632f63ccf0fe65e36b6d3c16e1d12e778a3d77d6e26df35e6660'
            '86299b5dfcbb28da4f9703213e3754d44a67fafb93e0da034d6457267a702dfe'
            '59e04c680dfce93154a618c25bc868a8c44e0c5482cbf2c18319b82b86b50e1a'
            'd230496ce61436b709d34078273df5e4b6036eab316b5c9f54f5d261a5c61ea8'
            'a1bc83acb2b0429b4aef7b1bda3a5c0b19312ef4b6680040cc81b34e233e469c'
            'd10c0e9cafc0e1df19a842d78b0e6d537369752ee00e3d33c87ae8579b3d336c')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${pkgname}-${pkgver}"
    pytest -v
}

package() {
    install -Dm644 "${pkgname}.service"      "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.user.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
    install -Dm644 "${pkgname}.sysusers"     "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.tmpfiles"     "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.env"          "${pkgdir}/etc/${pkgname}/${pkgname}.env"
    install -Dm644 "config.json"             "${pkgdir}/etc/${pkgname}/config.json"

    cd "${pkgname}-${pkgver}"
    install -Dm644 LICENSE                   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python -m installer --destdir=${pkgdir}  dist/*.whl

    cd docs
    find . -type f -exec install -Dm644 {}   "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
}
