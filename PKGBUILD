# Maintainer: jab416171 <jab416171@gmail.com>
# Contributor: Donald Webster <fryfrog@gmail.com>
# Contributor: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=jellyseerr
pkgver=1.5.0
pkgrel=1
pkgdesc='Request management and media discovery tool for the Plex ecosystem'
arch=('x86_64')
url='https://github.com/Fallenbagel/jellyseerr'
license=('MIT')
depends=('nodejs')
optdepends=(
  'emby: Bring together your videos, music, photos, and live television'
  'jellyfin: The Free Software Media System'
)
makedepends=('yarn')
options=('!strip')
backup=('etc/conf.d/jellyseerr')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Fallenbagel/jellyseerr/archive/v${pkgver}.tar.gz"
        'jellyseerr.sysusers'
        'jellyseerr.tmpfiles'
        'jellyseerr.service'
        'jellyseerr.conf.d')
sha256sums=('0bcfb5a73fff85a1ca4b521e33bc36263ba40be71144efcac140079a3fe14f80'
            '372ee94f76040ea76af49fd2f9db851375559458ba1b55ea41f1b2768fe10cb8'
            'cb0b856fc93969c901e69eb31dc201f4e37c8a2d30041beabf1a82077cca4c24'
            '84159db69b33ef3c4e6a424b32331f78e92efe316355c05e3f86920e1ad24c05'
            '5a446cc8fa0a47a49dbbd6920d49eb4569f988e808cbb0bdbb609ab179a94426')

build()
{
    cd "${srcdir}/${pkgname}-${pkgver}"

    export COMMIT_TAG=${pkgver}
    echo "{\"commitTag\": \"${COMMIT_TAG}\"}" > committag.json

    mkdir -p .next "${srcdir}/.jellyseer_cache"
    rm -rf .next/cache # in case previous builds have it as real folder
    ln -s "${srcdir}/.jellyseer_cache" .next/cache

    patch -p0 < "../../no-prepare-husky.patch"

    yarn --frozen-lockfile
    yarn build
    yarn install --production --ignore-scripts --prefer-offline
    yarn cache clean
}

package()
{
    install -m0755 -d "${pkgdir}/usr/lib/jellyseerr"
    cp -dr --no-preserve='ownership' "${srcdir}/${pkgname}-${pkgver}/." "${pkgdir}/usr/lib/jellyseerr"

    find "${pkgdir}/usr/lib/jellyseerr/.next" -type f -print0 | xargs -0 sed -i "s^${srcdir}/${pkgname}-${pkgver}^/usr/lib/jellyseerr^g"

    rm -rf "${pkgdir}/usr/lib/jellyseerr/config"
    rm -rf "${pkgdir}/usr/lib/jellyseerr/.next/cache"
    ln -s "/var/lib/jellyseerr" "${pkgdir}/usr/lib/jellyseerr/config"

    install -Dm0644 "${srcdir}/jellyseerr.conf.d"   "${pkgdir}/etc/conf.d/jellyseerr"
    install -Dm0644 "${srcdir}/jellyseerr.sysusers" "${pkgdir}/usr/lib/sysusers.d/jellyseerr.conf"
    install -Dm0644 "${srcdir}/jellyseerr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/jellyseerr.conf"
    install -Dm0644 "${srcdir}/jellyseerr.service"  "${pkgdir}/usr/lib/systemd/system/jellyseerr.service"
}
