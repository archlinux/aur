# Maintainer: devome <evinedeng@hotmail.com>

pkgname=iyuuplus
pkgver=8.2.69
pkgrel=1
pkgdesc="IYUU Auto Reseed Plus"
arch=("any")
url="https://github.com/ledccn/iyuuplus-dev"
license=("MIT")
provides=("${pkgname}")
conflicts=("${pkgname}")
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
source=("${pkgname}::git+${url}.git#tag=v${pkgver}"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
sha256sums=('d82c3426b7de0abb6f19c2da84d7727b061e67a8a3772e8bf5f502e8f5a93c9d'
            '2599c5f243b573a4db2ff925e2ad75337338dc61a293b1a1c17acf3681b3d3ff'
            'e64af1d0d088fa30e864897a43597026ee95f5e2590e79ac4055786795c60622'
            '4c0928194248ce56deab7a1eeec78d4a3827d7e8fbceba142b46d4f9c8eed387')
options=(!strip !debug)

prepare() {
    cd "${pkgname}"
    sed -i 's|^#!/usr/bin/env php$|#!/usr/bin/php83|g' start.php
    sed -i 's|<button .\+git_pull.\+通过git拉取最新代码.\+</button>||' plugin/admin/app/view/index/dashboard.html
    sed -i "s|current_git_commit()|\"$(git rev-parse --short HEAD)\"|" plugin/admin/app/controller/IndexController.php
    echo "${pkgver}" > .version
}

package() {
    install -Dm644 "${pkgname}.service"  "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

    cd "${pkgname}"
    install -Dm644 LICENSE               "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md             "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    rm -rf .dockerignore docker runtime windows.* gg.sh LICENSE README.md
    find . \( -iname ".git*" -o -iname "README.md" \) | sort | while read line; do rm -rf "$line"; done
    find . -type f -exec install -Dm644 {} "${pkgdir}/srv/${pkgname}/"{} \;
    chmod 755 "${pkgdir}/srv/${pkgname}/start.php"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/srv/${pkgname}/start.php"    "${pkgdir}/usr/bin/${pkgname}"
}
