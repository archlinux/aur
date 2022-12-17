# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=overseerr
pkgver=1.31.0
pkgrel=1
pkgdesc='Request management and media discovery tool for the Plex ecosystem'
arch=('x86_64')
url='https://github.com/sct/overseerr'
license=('MIT')
depends=('nodejs')
makedepends=('yarn')
options=('!strip')
backup=('etc/conf.d/overseerr')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sct/overseerr/archive/v${pkgver}.tar.gz"
        'overseerr.sysusers'
        'overseerr.tmpfiles'
        'overseerr.service'
        'overseerr.conf.d')
sha256sums=('f5296d48a636b22312ba3249f33ec0e58a6b63e96716d67d73fff50167179d36'
            '682ff5633748bbd131bcae00791b18c08488ad1cb477ca675e5498c53eca1097'
            'a4734740422a3957f523cdab3c5d95b20999ff27e91e85358e4201988f5979f6'
            'd0e530142edc5bd48474b38072f206a25af23803028fe264324ec2c4b3d7f19a'
            'f9e1500b89df94b11a4b4576501fe6f19e7cb15afd90d6e670f4b9cf40e3c00b')

build()
{
    cd "${srcdir}/${pkgname}-${pkgver}"

    export COMMIT_TAG=${pkgver}
    echo "{\"commitTag\": \"${COMMIT_TAG}\"}" > committag.json

    mkdir -p .next "${srcdir}/.overseer_cache"
    rm -rf .next/cache # in case previous builds have it as real folder
    ln -s "${srcdir}/.overseer_cache" .next/cache

    HUSKY=0 yarn --frozen-lockfile
    yarn build
    yarn install --production --ignore-scripts --prefer-offline
    yarn cache clean
}

package()
{
    install -m0755 -d "${pkgdir}/usr/lib/overseerr"
    cp -dr --no-preserve='ownership' "${srcdir}/${pkgname}-${pkgver}/." "${pkgdir}/usr/lib/overseerr"

    find "${pkgdir}/usr/lib/overseerr/.next" -type f -print0 | xargs -0 sed -i "s^${srcdir}/${pkgname}-${pkgver}^/usr/lib/overseerr^g"

    rm -rf "${pkgdir}/usr/lib/overseerr/config"
    rm -rf "${pkgdir}/usr/lib/overseerr/.next/cache"
    ln -s "/var/lib/overseerr" "${pkgdir}/usr/lib/overseerr/config"

    install -Dm0644 "${srcdir}/overseerr.conf.d"   "${pkgdir}/etc/conf.d/overseerr"
    install -Dm0644 "${srcdir}/overseerr.sysusers" "${pkgdir}/usr/lib/sysusers.d/overseerr.conf"
    install -Dm0644 "${srcdir}/overseerr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/overseerr.conf"
    install -Dm0644 "${srcdir}/overseerr.service"  "${pkgdir}/usr/lib/systemd/system/overseerr.service"
}
