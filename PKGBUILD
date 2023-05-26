# Set this to where to serve this program, relative to your webserver's root
# We use /icqq/ by default, that means you need to configure your server to serve it at /icqq
#   and access it at https://example.com/icqq
PUBLIC_PATH=${PUBLIC_PATH:-"/icqq/"}

pkgname=stapxs-qq-lite-webpage-git
pkgver=2.5.7.r6.g94d8162
pkgrel=1
pkgdesc="一个兼容 oicq-http 的非官方网页版 QQ 客户端，使用 Vue 重制的全新版本。"
arch=("any")
url="https://github.com/Stapxs/Stapxs-QQ-Lite-2.0"
license=("Apache-2.0")
provides=("staptxs-qq-lite-webpage")
conflicts=("staptxs-qq-lite-webpage")
makedepends=("git" "yarn" "nodejs-lts-gallium")
optdepends=(
    "oicq-http2: For running locally"
    "go-cqhhttp: For running locally"
    "nginx: For webserver serves this"
    "caddy: For webserver serves this"
)
source=(
    "StapxsQQLite::git+${url}.git"
    "stapxs-qq-lite-webpage.hook"
)
sha256sums=('SKIP'
            '8ded610cc0a466e42249c9b9f5827d188ffea051602a22d2a8679b436a90d0b1')

pkgver(){
    cd "${srcdir}/StapxsQQLite"
    git describe --tags --long | sed 's/v//;s/-/.r/;s/-/./g'
}
build(){
    cd "${srcdir}/StapxsQQLite"
    sed -i "s|undefined|\"${PUBLIC_PATH}\"|" vue.config.js
    yarn install
    yarn build
}
package(){
    cd "${srcdir}/StapxsQQLite"
    mkdir -p "${pkgdir}/usr/share/stapxs-qq-lite/webpage"
    cp -av dist/* "${pkgdir}/usr/share/stapxs-qq-lite/webpage"
    install -Dm644 "${srcdir}/stapxs-qq-lite-webpage.hook" \
        "${pkgdir}/usr/share/libalpm/hooks/stapxs-qq-lite-webpage.hook"
}
