# Maintainer: Christopher Rice <maveric7911@gmail.com>
pkgname=hue-firelight-git
_pkgname=hue-firelight
pkgver=r3.f409454
pkgrel=1
pkgdesc='Realistic flame effect for Philips Hue bulbs over REST + DTLS Entertainment streaming'
arch=('any')
url='https://github.com/maveric7911/hue-firelight'
license=('MIT')
depends=('python' 'openssl')
makedepends=('git')
optdepends=('philips-hue-bridge: V2 or newer required for the streaming script')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}"

    # Python implementation under /usr/lib/hue-firelight (so import hue_config
    # resolves from the same dir as the scripts, via Python's sys.path[0]).
    install -Dm755 hue-flame.py        "${pkgdir}/usr/lib/${_pkgname}/hue-flame.py"
    install -Dm755 hue-flame-stream.py "${pkgdir}/usr/lib/${_pkgname}/hue-flame-stream.py"
    install -Dm644 hue_config.py       "${pkgdir}/usr/lib/${_pkgname}/hue_config.py"

    # CLI entry points
    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${_pkgname}/hue-flame.py"        "${pkgdir}/usr/bin/hue-flame"
    ln -s "/usr/lib/${_pkgname}/hue-flame-stream.py" "${pkgdir}/usr/bin/hue-flame-stream"

    # systemd user unit — ExecStart rewritten to the installed CLI path
    install -Dm644 systemd/hue-firelight.service \
        "${pkgdir}/usr/lib/systemd/user/hue-firelight.service"
    sed -i 's|^ExecStart=.*|ExecStart=/usr/bin/hue-flame-stream|' \
        "${pkgdir}/usr/lib/systemd/user/hue-firelight.service"

    # Docs + example config + license
    install -Dm644 README.md           "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    install -Dm644 config.example.json "${pkgdir}/usr/share/${_pkgname}/config.example.json"
    install -Dm644 LICENSE             "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
