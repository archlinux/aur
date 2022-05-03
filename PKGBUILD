pkgname='netease-music-sync'
pkgver=1.0.0.r1.gd401b7f
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
            '9012f326199922bbbd8bb2e95a75ec940580d5887afbd080ac2360cec9a95e36'
            'f1150b9ce85eeba175f3c3f3aab65fc9fcc6a604e7d17e44cd2f935efba5ecb1')

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
