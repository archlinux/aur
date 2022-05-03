pkgname='netease-music-sync'
pkgver=1.0.1.r0.0000000
pkgrel=1
pkgdesc='自动将网易云的歌单同步到本地'
license=('MIT')
depends=('nodejs>=17.5')
makedepends=('yarn' 'git')
arch=('any')
url="https://github.com/Clansty/${pkgname}"
source=("${pkgname}::git+${url}"
        netease-login
        ${pkgname}.{conf,service})
sha256sums=('SKIP'
            'bc5412b89178fd04d9120fc06d3c86fa979c03edcc4d1708fb6d545690ef0b0d'
            '176314b0e966499f9535f3f6cd752ef6d3e0c2c91cc43d4729753a3618511f32'
            'bc6803ca7126c5bf50dfc471f73feb907d4033a0ce6ea04a6cd3e42953eca53d')
backup=("etc/${pkgname}.conf")

pkgver(){
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

prepare(){
    cd "${srcdir}/${pkgname}"
    yarn install
}

build(){
    cd "${srcdir}/${pkgname}"
    yarn run build
}

package(){
    install -d "${pkgdir}/usr/share/${pkgname}"
    install -Dm755 netease-login "${pkgdir}/usr/bin/netease-login"
    install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.conf" "${pkgdir}/etc/${pkgname}.conf"
    cd "${srcdir}/${pkgname}"
    cp -a build .yarn .yarnrc.yml yarn.lock package.json "${pkgdir}/usr/share/${pkgname}"
    rm -rf "${pkgdir}/usr/share/${pkgname}/.yarn/cache"
    cd "${pkgdir}/usr/share/${pkgname}"
    yarn workspaces focus --production
}
