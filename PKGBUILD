# Maintainer: devome <evinedeng@hotmail.com>

pkgname=amane
pkgver=0.10.0
pkgrel=1
pkgdesc="Private movie library in the AI era"
arch=("any")
url="https://github.com/sqzw-x/${pkgname}"
license=('GPL-3.0-or-later')
backup=("etc/conf.d/${pkgname}")
makedepends=("pnpm")
optdepends=("postgresql")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.conf"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
sha256sums=('0c1446af2fe4394866ac40eb96914b8822aba066f61170c5caeee731930599fd'
            '28d7520995c01cb46bbb95288dc56e7aa82eb0be5e3dc59a942c2bd78ae922e6'
            '4358f021ce89f5e529066064c30f2d68216a85d2811cbeb6473f1e2c95599b05'
            'adb7d8daeb017f193bf010dfa77e0ff2c8b875eeab3221bf44c44e5cb0e14e18'
            '72941beb02e990ba940e8c13bb26b0de32e8a10af666ffa7e8d144df992ce197')

build() {
    cd "${pkgname}-${pkgver}"
    pnpm --dir=web install --frozen-lockfile
    pnpm --dir=web build
}

package() {
    depends=("python" "uv")

    install -Dm644 "${pkgname}.conf"     "${pkgdir}/etc/conf.d/${pkgname}"
    install -Dm644 "${pkgname}.service"  "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

    cd "${pkgname}-${pkgver}"
    find {src,web/dist,alembic.ini,pyproject.toml,uv.lock,README.md} -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${pkgname}/{}" \;

    cd docs
    find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
}
