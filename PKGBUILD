# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=overseerr-git
pkgver=r1013.190cbd65
pkgrel=1
pkgdesc='Request management and media discovery tool for the Plex ecosystem'
arch=('x86_64')
url='https://github.com/sct/overseerr'
license=('MIT')
depends=('nodejs')
makedepends=('git' 'yarn')
provides=('overseerr')
conflicts=('overseerr')
options=('!strip')
backup=('etc/conf.d/overseerr')
source=("overseerr::git+https://github.com/sct/overseerr"
        'overseerr.sysusers'
        'overseerr.tmpfiles'
        'overseerr.service'
        'overseerr.conf.d')
sha256sums=('SKIP'
            '682ff5633748bbd131bcae00791b18c08488ad1cb477ca675e5498c53eca1097'
            'a4734740422a3957f523cdab3c5d95b20999ff27e91e85358e4201988f5979f6'
            'd0e530142edc5bd48474b38072f206a25af23803028fe264324ec2c4b3d7f19a'
            'f9e1500b89df94b11a4b4576501fe6f19e7cb15afd90d6e670f4b9cf40e3c00b')

pkgver()
{
    cd "${srcdir}/overseerr"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
    cd "${srcdir}/overseerr"

    export COMMIT_TAG=${pkgver}
    echo "{\"commitTag\": \"${COMMIT_TAG}\"}" > committag.json

    mkdir -p .next "${srcdir}/.overseer_git_cache"
    rm -rf .next/cache # in case previous builds have it as real folder
    ln -s "${srcdir}/.overseer_git_cache" .next/cache

    yarn --frozen-lockfile
    yarn build
    yarn install --production --ignore-scripts --prefer-offline
    yarn cache clean
}

package()
{
    install -m0755 -d "${pkgdir}/usr/lib/overseerr"
    cp -dr --no-preserve='ownership' "${srcdir}/overseerr/." "${pkgdir}/usr/lib/overseerr"

    find "${pkgdir}/usr/lib/overseerr/.next" -type f -print0 | xargs -0 sed -i "s^${srcdir}/overseerr/^/usr/lib/overseerr^g"

    rm -rf "${pkgdir}/usr/lib/overseerr/.git"
    rm -rf "${pkgdir}/usr/lib/overseerr/config"
    rm -rf "${pkgdir}/usr/lib/overseerr/.next/cache"
    ln -s "/var/lib/overseerr" "${pkgdir}/usr/lib/overseerr/config"

    install -Dm0644 "${srcdir}/overseerr.conf.d"   "${pkgdir}/etc/conf.d/overseerr"
    install -Dm0644 "${srcdir}/overseerr.sysusers" "${pkgdir}/usr/lib/sysusers.d/overseerr.conf"
    install -Dm0644 "${srcdir}/overseerr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/overseerr.conf"
    install -Dm0644 "${srcdir}/overseerr.service"  "${pkgdir}/usr/lib/systemd/system/overseerr.service"
}
