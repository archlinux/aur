# Maintainer: Stefanie Jane <hyperb1iss@gmail.com>
# https://github.com/hyperb1iss/blocksd

pkgname=blocksd
pkgver=0.5.0
pkgrel=2
pkgdesc="Linux daemon for ROLI Blocks devices: keepalive, LED control, topology management"
arch=('any')
url="https://github.com/hyperb1iss/blocksd"
license=('ISC')
depends=(
    'python>=3.13'
    'python-rtmidi>=1.5.8'
    'python-typer>=0.27.2'
    'python-rich>=15.0.0'
    'python-pydantic>=2.13.5'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling>=1.32.0'
    'nodejs>=24.13.0'
    'pnpm>=12.3.4'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hyperb1iss/blocksd/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('17f52d4ae291c738541a14a9046242acbfe25b3874f075896390d2f44081626d')

prepare() {
    cd "${pkgname}-${pkgver}/web"
    pnpm install --frozen-lockfile
}

build() {
    cd "${pkgname}-${pkgver}"
    pnpm --dir web build
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    # systemd user service
    install -Dm644 systemd/blocksd.service \
        "${pkgdir}/usr/lib/systemd/user/blocksd.service"

    # udev rules
    install -Dm644 systemd/99-roli-blocks.rules \
        "${pkgdir}/usr/lib/udev/rules.d/99-roli-blocks.rules"

    # license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # docs
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
