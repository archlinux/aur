# Maintainer: Ayatsuki Renge <i@nanon.net>
pkgname=sshesame
pkgver=0.0.39
pkgrel=2
pkgdesc="An easy to set up and use SSH honeypot, a fake SSH server that lets anyone in and logs their activity"
arch=('any')
url="https://github.com/jaksi/sshesame"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
provides=('sshesame')
conflicts=('sshesame-git')
backup=('etc/sshesame/config.yaml')
source=("$url/archive/refs/tags/v$pkgver.tar.gz"
        "${pkgname}.service"
        "${pkgname}@.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles"
        "config.yaml")
sha256sums=('cc73af142debe549d3bd31c8e7cc7e8fc0faf1c87acfdc5e65624a0f6702d595'
        '6140f33a8b10d3f15225af67ad9d012043a41fb0a59880b3746228f548ce763f'
        'e8faef0430372bc8f94d07a31e3143c4d7bec1dfcfe31fc41628bd48884a0f8f'
        'bb374db1938ba3d3193146d1245a33309002810b20eed32c5df78bde31617926'
        '2fdd9638cbd70d0653f399d21326cf3c330b72cebe64b96da64002272d58c2f5'
        '2de5eaa320aa4df18efc660eac50e7bd61fc0271e6b925930256af3082147e72')

build() {
    cd "${srcdir}"/sshesame-${pkgver}
    GOOS=linux go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" " \
    -o ${pkgname}-${pkgver}
}
package() {
    cd "${srcdir}"/sshesame-${pkgver}
    install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
    
    cd $srcdir
    install -Dm644 ${pkgname}.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 ${pkgname}.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -Dm644 "config.yaml" -t "${pkgdir}/etc/${pkgname}"
    install -Dm644 "${pkgname}.service"  -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "${pkgname}@.service" -t "${pkgdir}/usr/lib/systemd/system"
}
