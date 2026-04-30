# Maintainer: Harry LoveApple14434 <harry.zy.su@qq.com>
pkgname=kbd-drive-remap-git
pkgver=r0.g0000000
pkgrel=1
pkgdesc='Keyboard key remap via evsieve and systemd'
arch=('any')
url='https://github.com/LoveApple14434/gs-3104t-pro-remap'
license=('custom:unlicensed')
depends=('bash' 'evsieve' 'libinput-tools')
makedepends=('git')
optdepends=('systemd: enable gs3104tpro-remap.service for auto-start')
provides=('kbd-drive-remap')
conflicts=('kbd-drive-remap')
backup=('etc/kbd-drive/remap-gs3104tpro.yaml')
install="${pkgname}.install"
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/gs-3104t-pro-remap"
    printf '%s.r%s.g%s' \
        "$(git show -s --format=%cd --date=format:%Y%m%d)" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/gs-3104t-pro-remap"

    install -Dm755 remap-gs3104tpro.sh "${pkgdir}/usr/lib/kbd-drive/remap-gs3104tpro.sh"
    install -Dm644 remap-gs3104tpro.yaml "${pkgdir}/etc/kbd-drive/remap-gs3104tpro.yaml"

    sed \
        -e 's|^WorkingDirectory=.*|WorkingDirectory=/usr/lib/kbd-drive|' \
        -e 's|^ExecStart=.*|ExecStart=/usr/lib/kbd-drive/remap-gs3104tpro.sh /etc/kbd-drive/remap-gs3104tpro.yaml|' \
        gs3104tpro-remap.service \
        > "${srcdir}/gs3104tpro-remap.service"

    install -Dm644 "${srcdir}/gs3104tpro-remap.service" \
        "${pkgdir}/usr/lib/systemd/system/gs3104tpro-remap.service"

    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
