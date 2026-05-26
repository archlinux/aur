# Maintainer: Berk Kucuk <berkkucukk@proton.me>
pkgname=haze
pkgver=2.0.0
pkgrel=1
pkgdesc="Anonymous encrypted P2P chat over the Tor network"
arch=('x86_64')
url="https://github.com/berk-kucuk/Haze"
license=('GPL-3.0-only')
makedepends=(
    'python-setuptools'
    'python-wheel'
)
depends=(
    'python>=3.11'
    'tor'
    'portaudio'
)
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/berk-kucuk/Haze/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('54c09683a0abb8737c01aec06bb0b6ba1784ae49683cb7ff8fb45afb10bd3339')

_install_dir="/opt/${pkgname}"

build() {
    cd "Haze-${pkgver}"

    # Create self-contained venv and install all Python dependencies via pip
    python -m venv "${srcdir}/venv"
    "${srcdir}/venv/bin/pip" install --upgrade pip --quiet
    "${srcdir}/venv/bin/pip" install . --quiet

    # Rewrite build-time paths to final install location in venv entry-point scripts
    grep -rlI "${srcdir}/venv" "${srcdir}/venv/bin/" \
        | xargs -r sed -i "s|${srcdir}/venv|${_install_dir}/venv|g"
    sed -i "s|${srcdir}/venv|${_install_dir}/venv|g" \
        "${srcdir}/venv/pyvenv.cfg"

    # Remove Python's Unicode easter-egg symlink (𝜋thon); bsdtar cannot
    # encode its name and emits a warning during packaging.
    find "${srcdir}/venv/bin/" -name '*𝜋*' -delete
}

package() {
    local _src="${srcdir}/Haze-${pkgver}"

    # Bundle the self-contained venv
    install -dm755 "${pkgdir}${_install_dir}"
    cp -a "${srcdir}/venv" "${pkgdir}${_install_dir}/venv"

    # /usr/bin launcher
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<'EOF'
#!/usr/bin/env bash
exec /opt/haze/venv/bin/haze "$@"
EOF

    # Desktop entry
    install -Dm644 "${_src}/installer/haze.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Icons — pixmaps and hicolor at all standard sizes
    install -Dm644 "${_src}/src/haze/assets/logo.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    for _size in 16 22 32 48 64 128 256; do
        install -Dm644 "${_src}/src/haze/assets/logo.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname}.png"
    done

    # License
    if [[ -f "${_src}/LICENSE" ]]; then
        install -Dm644 "${_src}/LICENSE" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
