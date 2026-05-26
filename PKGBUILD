# Maintainer: Berk Kucuk <berkkucukk@proton.me>
pkgname=haze
pkgver=2.0.0
pkgrel=1
pkgdesc="Anonymous encrypted P2P chat over the Tor network"
arch=('any')
url="https://github.com/berk-kucuk/Haze"
license=('GPL-3.0-only')
depends=(
    'python>=3.11'
    'tor'
)
makedepends=(
    'python-setuptools'
    'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/berk-kucuk/Haze/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('54c09683a0abb8737c01aec06bb0b6ba1784ae49683cb7ff8fb45afb10bd3339')

package() {
    _src="${srcdir}/Haze-${pkgver}"
    _venv="${pkgdir}/opt/${pkgname}/venv"

    python -m venv "${_venv}"
    "${_venv}/bin/pip" install --upgrade pip --quiet
    "${_venv}/bin/pip" install "${_src}" --quiet

    # Strip pkgdir prefix from venv script shebangs so paths are correct after install
    grep -rl "${pkgdir}" "${_venv}/bin/" | xargs -r sed -i "s|${pkgdir}||g"

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<'LAUNCHER'
#!/usr/bin/env bash
exec /opt/haze/venv/bin/haze "$@"
LAUNCHER

    install -Dm644 "${_src}/installer/haze.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${_src}/src/haze/assets/logo.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${_src}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
