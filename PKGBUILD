# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=iyuuplus
pkgname="${_pkgname}-git"
pkgver=8.2.63.r604.2f92ec7
pkgrel=1
epoch=1
pkgdesc="IYUU Auto Reseed Plus"
arch=("any")
url="https://github.com/ledccn/iyuuplus-dev"
license=("MIT")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=(
    "mariadb"
    "php83-cli"
    "php83-curl"
    "php83-exif"
    "php83-fileinfo"
    "php83-gd"
    "php83-mbstring"
    "php83-mysqli"
    "php83-openssl"
    "php83-pdo"
    "php83-sockets"
    "php83-sodium"
    "php83-sqlite"
    "php83-zip"
)
makedepends=("git")
source=("${_pkgname}::git+${url}.git"
        "${_pkgname}.service"
        "${_pkgname}.sysusers"
        "${_pkgname}.tmpfiles")
sha256sums=('SKIP'
            '2599c5f243b573a4db2ff925e2ad75337338dc61a293b1a1c17acf3681b3d3ff'
            'e64af1d0d088fa30e864897a43597026ee95f5e2590e79ac4055786795c60622'
            '4c0928194248ce56deab7a1eeec78d4a3827d7e8fbceba142b46d4f9c8eed387')
options=(!strip !debug)

prepare() {
    cd "${_pkgname}"
    sed -i 's|^#!/usr/bin/env php$|#!/usr/bin/php83|g' start.php
    sed -i 's|<button .\+git_pull.\+通过git拉取最新代码.\+</button>||' plugin/admin/app/view/index/dashboard.html
    sed -i "s|current_git_commit()|\"$(git rev-parse --short HEAD)\"|" plugin/admin/app/controller/IndexController.php
    local tag_latest="$(git tag --sort=committerdate | tail -1 | sed 's|v||')"
    if [[ $(vercmp "$tag_latest" "$(cat .version)") -eq 1 ]]; then
        echo "$tag_latest" > .version
    fi
}

pkgver() {
    cd "${_pkgname}"
    printf "%s.r%s.%s" "$(cat .version)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm644 "${_pkgname}.service"  "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm644 "${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
    install -Dm644 "${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"

    cd "${_pkgname}"
    install -Dm644 LICENSE                "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 README.md              "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

    rm -rf .dockerignore docker runtime windows.* gg.sh LICENSE README.md
    find . \( -iname ".git*" -o -iname "README.md" \) | sort | while read line; do rm -rf "$line"; done
    find . -type f -exec install -Dm644 {} "${pkgdir}/srv/${_pkgname}/"{} \;
    chmod 755 "${pkgdir}/srv/${_pkgname}/start.php"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/srv/${pkgname}/start.php"    "${pkgdir}/usr/bin/${pkgname}"
}
