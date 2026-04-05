# Maintainer: Stefanie Jane <hyperb1iss@gmail.com>
# https://github.com/hyperb1iss/blocksd

pkgname=blocksd
pkgver=0.4.0
pkgrel=1
pkgdesc="Linux daemon for ROLI Blocks devices — keepalive, LED control, topology management"
arch=('any')
url="https://github.com/hyperb1iss/blocksd"
license=('ISC')
depends=(
    'python>=3.13'
    'python-rtmidi'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
)
optdepends=(
    'python-typer: CLI interface'
    'python-rich: rich terminal output'
    'python-pydantic: configuration validation'
)
backup=('etc/blocksd/config.toml')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hyperb1iss/blocksd/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a2203b166e1eefe0073bea6064883e4f31cb398e860cd505ee1b4a9fc3d9df52')

build() {
    cd "${pkgname}-${pkgver}"
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

post_install() {
    echo ":: Enable the user service with: systemctl --user enable --now blocksd"
    echo ":: Reload udev rules with: sudo udevadm control --reload-rules"
}
