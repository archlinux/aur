# Maintainer: taotieren <admin@taotieren.com>

pkgname=autofilm
_name=AutoFilm
pkgver=1.3.2
pkgrel=1
pkgdesc="A small project to provide Strm direct-link playback for Emby and Jellyfin servers, recommended for use with MediaWarp."
arch=(any)
url="https://github.com/Akimio521/AutoFilm"
license=('AGPL-3.0-only')
provides=(${pkgname})
conflicts=(${pkgname})
#replaces=(${pkgname})
depends=(
    glibc
    sh
    zlib
)
# _makepydeps=(
#     pyyaml
#     click
#     feedparser
#     apscheduler
#     aiofile
#     httpx
#     pydantic
# )
makedepends=(
    python-build
    python-installer
    python-wheel
    python-setuptools
    python
    pyinstaller
    #     "${_makepydeps[@]/#/python-}"
)
optdepends=(
    'alist: File list program that supports multiple storage'
    'mediawarp: EmbyServer API Optimization: Optimize playback of Strm files, customize the front-end style, customize the allowed access to the client, embedded scripts, work with Alist to realize Emby playback of web resources, recommended to use with AutoFilm.'
    'emby-server: Bring together your videos, music, photos, and live television'
    'jellyfin-server: Jellyfin server backend')
backup=(etc/${pkgname}/config.yaml)
options=('!strip' '!debug')
# install=${pkgname}.install
source=(
    "${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.service"
)
sha256sums=('212163c0e0052968a87eaa52e9c35fa808df0b285144a1ad6fb35582c75cdb63'
            '244dab4d8afffd786c394570bddf8c1e1d8313dd64f8f05977e06c70da9b2c39')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    pyinstaller --onefil app/main.py
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    install -Dm755 dist/main ${pkgdir}/usr/share/${pkgname}/${pkgname}

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/bin/sh
cd /usr/share/${pkgname}/
exec ${pkgname} "\$@"
EOF
    install -Dm0644 "${srcdir}/${_name}-${pkgver}/config/config.yaml.example" "${pkgdir}/etc/${pkgname}/config.yaml"
    install -dm0644 "${pkgdir}/usr/share/${pkgname}/logs" \
        "${pkgdir}/usr/share/${pkgname}/config"

    install -Dvm644 "${srcdir}/${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system/"
}
