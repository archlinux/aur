# Maintainer: devome <evinedeng@hotmail.com>

pkgname=amane
pkgver=0.4.1
pkgrel=1
pkgdesc="Private movie library in the AI era"
arch=("any")
url="https://github.com/sqzw-x/${pkgname}"
license=('GPL-3.0-or-later')
backup=("etc/conf.d/${pkgname}")
depends=("python" "uv")
makedepends=("pnpm" "python" "uv")
optdepends=("postgresql")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.conf"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
sha256sums=('ccb5b872b1660811533797b37067b2c8954ce8b5fbeb05f1d2f2af0c22754962'
            '008e473533ff236a6a2dd1daab10a644344486d7b5d4b2f09bea9bb17eaec5fc'
            '4358f021ce89f5e529066064c30f2d68216a85d2811cbeb6473f1e2c95599b05'
            'adb7d8daeb017f193bf010dfa77e0ff2c8b875eeab3221bf44c44e5cb0e14e18'
            '72941beb02e990ba940e8c13bb26b0de32e8a10af666ffa7e8d144df992ce197')

build() {
    cd "${pkgname}-${pkgver}"
    pnpm --dir=web install --frozen-lockfile
    pnpm --dir=web build
}

package() {
    install -Dm644 "${pkgname}.conf"     "${pkgdir}/etc/conf.d/${pkgname}"
    install -Dm644 "${pkgname}.service"  "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

    cd "${pkgname}-${pkgver}"
    find {src,web/dist,alembic.ini,pyproject.toml,uv.lock,README.md} -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${pkgname}/{}" \;

    cd docs
    find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
}
