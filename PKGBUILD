# Maintainer: CountMurphy <spartan.1086@gmail.com>

pkgname='invidious-companion-git'
_github_path="github.com/iv-org/invidious-companion"
_go_pkg_path="src/${_github_path}"
pkgver=release.master.127.gfcb0456
pkgrel=1
options=(!strip !debug)
arch=('x86_64')
pkgdesc='Companion app for invidious'
backup=('etc/invidious-companion.conf')
url='https://github.com/iv-org/invidious-companion'
license=('GPL')
depends=('deno')
makedepends=('git')

source=(
    "git+https://github.com/iv-org/invidious-companion"
    "invidious-companion.config"
)

sha512sums=(
    'SKIP'
    '9c2ff2046f3563933e8b6fb54d14e17c046454ca7a21f2134924352e4191e93a81e597ebab18964d8a8a748ba7bf5714a9c37cbf46eeb433cfb95b6a27e9099d'
)

pkgver() {
    cd invidious-companion
    git describe --tags | sed 's/^v//;s/-/./g'
}


build() {
    cd invidious-companion
    sed -i 's|/home/invidious/invidious-companion|/usr/lib/invidious/|g' invidious-companion.service
    sed -i 's|BindPaths=/home/invidious/tmp|#BindPaths=/home/invidious/tmp|g' invidious-companion.service
    sed -i 's|Environment=SERVER_SECRET_KEY=CHANGE_ME|EnvironmentFile=/etc/invidious-companion.conf|g' invidious-companion.service
    deno task compile
}

package() {
    cd $srcdir/invidious-companion
    install -Dm644 "invidious-companion.service" "${pkgdir}/usr/lib/systemd/system/invidious-companion.service"

    mkdir -p "${pkgdir}/usr/lib/invidious"
    cp "invidious_companion" "${pkgdir}/usr/lib/invidious/"
    install -Dm 644 "$srcdir/invidious-companion.config" "$pkgdir/etc/invidious-companion.conf"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
