# Maintainer: taotieren <admin@taotieren.com>

pkgname=autofilm-git
pkgver=1.5.1.r38.g2917380
pkgrel=1
pkgdesc="A small project to provide Strm direct-link playback for Emby and Jellyfin servers, recommended for use with MediaWarp."
arch=($CARCH)
url="https://github.com/Akimio521/AutoFilm"
license=('AGPL-3.0-only')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
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
    git
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
backup=(usr/share/${pkgname%-git}/config/config.yaml)
options=('!strip' '!debug')
# install=${pkgname}.install
source=(
    "${pkgname}::git+${url}.git"
    "alist-client-rs::git+https://github.com/AkimioJR/alist-client-rs.git"
    "${pkgname%-git}.service"
)
sha256sums=('SKIP'
            'SKIP'
            '244dab4d8afffd786c394570bddf8c1e1d8313dd64f8f05977e06c70da9b2c39')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}"
    git submodule init
    git config submodule.alist-client-rs.url "$srcdir/alist-client-rs"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "${srcdir}/${pkgname}"
    pyinstaller --onefil app/main.py
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 dist/main ${pkgdir}/usr/share/${pkgname%-git}/${pkgname%-git}

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-git}" <<EOF
#!/bin/sh
cd /usr/share/${pkgname%-git}/
exec ${pkgname%-git} "\$@"
EOF
    install -Dm0644 "${srcdir}/${pkgname}"/config/config.example.yaml "${pkgdir}/etc/${pkgname%-git}/config.yaml"
    install -Dm0644 "${srcdir}/${pkgname}"/config/config.example.old.yaml "${pkgdir}/etc/${pkgname%-git}/config..old.yaml"
    install -dm0644 "${pkgdir}/usr/share/${pkgname%-git}/logs"
    install -Dvm644 "${srcdir}/${pkgname%-git}.service" -t "${pkgdir}/usr/lib/systemd/system/"
}
