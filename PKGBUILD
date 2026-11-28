# Maintainer: ray-powered <xinyuwei1024@gmail.com>

pkgname=ur22c-control
pkgver=0.1.0
pkgrel=1
pkgdesc="Terminal mixer, DSP effect editor, and PipeWire multi-bus setup for the Steinberg UR22C"
arch=('any')
url="https://github.com/ray-powered/ur22c-control"
license=('GPL-3.0-or-later AND MIT')
depends=('python' 'python-rtmidi')
optdepends=(
    'pipewire: PipeWire multi-bus audio routing'
    'wireplumber: WirePlumber virtual loopback endpoint management'
    'sudo: switch USB Configuration 1/2 from urmixer settings'
    'ur22c-dkms: patched snd-usb-audio kernel module for USB Configuration 2'
)
install="${pkgname}.install"
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.install"
    "urmixer.desktop"
    "urfx.desktop"
)
sha256sums=('3375424db3ccd195922951637cc9c93d0fac960d4b1e83ab85b7e57543ad5af0'
            '47f20928aa00a94e69cd5249f5ef75b104676522b879585950c9cfad604c6671'
            '8b094fc370198083a51d26df777ed43f94fec348f636d9e93925ea3ab4c909dd'
            '1297a17967839ce6a4c5b070032ef40be58a5a5fa57a4bc6e60c354da7e766e8')

package() {
    cd "${pkgname}-${pkgver}"

    local appdir="${pkgdir}/usr/share/${pkgname}"
    install -d "$appdir" "${pkgdir}/usr/bin"

    install -Dm755 urmixer.py urfx.py urproto.py -t "$appdir"
    install -Dm644 urbulk.py urengine.py urpanel.py -t "$appdir"
    install -Dm644 data/ur22c_params.json data/ur22c_manifest.json -t "${appdir}/data"

    install -Dm644 \
        pipewire/51-ur22c-loopbacks.lua \
        pipewire/51-ur22c-raw.conf \
        pipewire/51-ur22c-split.conf \
        pipewire/52-ur22c-inputs-mono.conf \
        pipewire/52-ur22c-inputs-stereo.conf \
        pipewire/README.md \
        -t "${appdir}/pipewire"
    install -Dm755 pipewire/input-mode.sh pipewire/install.sh -t "${appdir}/pipewire"

    install -Dm755 udev/vendor-config.sh -t "${appdir}/udev"
    install -Dm644 udev/README.md -t "${appdir}/udev"
    install -Dm644 udev/99-ur22c.rules "${pkgdir}/usr/lib/udev/rules.d/99-ur22c.rules"

    python -m compileall -q -f -d "/usr/share/${pkgname}" "$appdir"

    local cmd target
    for cmd in urmixer urfx urproto; do
        printf '#!/bin/sh\nexec python3 /usr/share/%s/%s.py "$@"\n' "$pkgname" "$cmd" \
            > "${pkgdir}/usr/bin/${cmd}"
        chmod 755 "${pkgdir}/usr/bin/${cmd}"
    done
    printf '#!/bin/sh\nexec sh /usr/share/%s/pipewire/install.sh "$@"\n' "$pkgname" \
        > "${pkgdir}/usr/bin/ur22c-pipewire-install"
    chmod 755 "${pkgdir}/usr/bin/ur22c-pipewire-install"

    install -Dm644 "${srcdir}/urmixer.desktop" "${pkgdir}/usr/share/applications/urmixer.desktop"
    install -Dm644 "${srcdir}/urfx.desktop" "${pkgdir}/usr/share/applications/urfx.desktop"

    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 pipewire/README.md "${pkgdir}/usr/share/doc/${pkgname}/pipewire-README.md"
    install -Dm644 udev/README.md "${pkgdir}/usr/share/doc/${pkgname}/udev-README.md"

    install -Dm644 LICENSE.urcontrol "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.urcontrol"
}
