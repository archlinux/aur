# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=overseerr-git
pkgver=r301.92c9001
pkgrel=1
pkgdesc='Request management and media discovery tool for the Plex ecosystem'
arch=('x86_64')
url='https://github.com/sct/overseerr'
license=('MIT')
depends=('yarn')
makedepends=('git')
provides=('overseerr')
conflicts=('overseerr')
options=('!strip')
source=("overseerr::git+https://github.com/sct/overseerr"
        'overseerr.sysusers'
        'overseerr.tmpfiles'
        'overseerr.service'
        'overseerr.conf.d')
sha256sums=('SKIP'
            '682ff5633748bbd131bcae00791b18c08488ad1cb477ca675e5498c53eca1097'
            'a4734740422a3957f523cdab3c5d95b20999ff27e91e85358e4201988f5979f6'
            '019002344a348c45e969b22ffbe4531461164e8a196068f6de20bbfe0c7a266d'
            'bc022e615b73a9d9c7b98736922cd1266d2000dc9f69b0ebc1e400e1f30200ba')

pkgver()
{
    cd "${srcdir}/overseerr"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
    cd "${srcdir}/overseerr"
    yarn --frozen-lockfile
    yarn build
    yarn install --production --ignore-scripts --prefer-offline
    yarn cache clean
}

package()
{
    install -m0755 -d "${pkgdir}/usr/lib/overseerr"
    cp -dr --no-preserve='ownership' "${srcdir}/overseerr/." "${pkgdir}/usr/lib/overseerr"

    find "${pkgdir}/usr/lib/overseerr/.next" -type f -print0 | xargs -0 sed -i "s^${srcdir}/overseerr/^/usr/lib/overseerr/^g"

    rm -rf "${pkgdir}/usr/lib/overseerr/.git"
    rm -rf "${pkgdir}/usr/lib/overseerr/config"
    ln -s "/var/lib/overseerr" "${pkgdir}/usr/lib/overseerr/config"

    install -Dm0644 "${srcdir}/overseerr.conf.d"   "${pkgdir}/etc/conf.d/overseerr"
    install -Dm0644 "${srcdir}/overseerr.sysusers" "${pkgdir}/usr/lib/sysusers.d/overseerr.conf"
    install -Dm0644 "${srcdir}/overseerr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/overseerr.conf"
    install -Dm0644 "${srcdir}/overseerr.service"  "${pkgdir}/usr/lib/systemd/system/overseerr.service"
}
