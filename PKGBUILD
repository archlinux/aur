# Maintainer: Radu Potop <radu@wooptoo.com>

pkgname=rampup
pkgver=r21.e2ba
pkgrel=1
pkgdesc='systemd service for ec_su_axb35 fan ramp curves'
arch=('any')
url='https://codeberg.org/radupotop/rampup'
license=('MIT')
makedepends=('git')
depends=('bash' 'kmod' 'systemd' 'ec-su_axb35-dkms-git')
backup=('etc/ec-su-axb35-fan.d/fan3.conf')
source=("${pkgname}::git+https://codeberg.org/radupotop/rampup.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf 'r%d.%s\n' \
        "$(git rev-list --count HEAD)" \
        "$(git describe --abbrev=4 --always --tags | sed 's/-/./g')"
}

package() {
    local srcroot

    srcroot="${srcdir}/${pkgname}"
    [[ -n "${srcroot}" && -d "${srcroot}" ]] || return 1

    install -Dm755 "${srcroot}/usr/local/bin/ec-su-axb35-fan-apply" \
        "${pkgdir}/usr/local/bin/ec-su-axb35-fan-apply"
    install -Dm644 "${srcroot}/etc/systemd/system/ec-su-axb35-fan.service" \
        "${pkgdir}/usr/lib/systemd/system/ec-su-axb35-fan.service"
    install -Dm644 "${srcroot}/etc/ec-su-axb35-fan.d/fan3.conf" \
        "${pkgdir}/etc/ec-su-axb35-fan.d/fan3.conf"
    install -Dm644 "${srcroot}/README.md" \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${srcroot}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
