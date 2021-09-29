# Maintainer: Metal A-wing <1 at 233 dot email>
# Contributor: Rocka <i at Rocka dot me>

pkgname=electron-netease-cloud-music-git
pkgver=0.9.29.10.g64e1f15
pkgrel=1
pkgdesc="UNOFFICIAL client for music.163.com . Powered by Electron, Vue, and Muse-UI."
arch=('any')
url="https://github.com/Rocket1184/electron-netease-cloud-music"
license=('GPL3')
depends=('electron')
optdepends=('dbus: MPRIS support')
makedepends=('yarn')
provides=(electron-netease-cloud-music)
source=("git+${url}"
        'electron-netease-cloud-music.desktop'
        'electron-netease-cloud-music.sh'
)

sha256sums=('SKIP'
            'f2fe49203340612cf6e9205b56cb1851133c11abaa9d1caa1ddf8676ed56c9e7'
            '809320b5879e8b5b903a4e8d49610467d92c5ebff7f1b71ae4012185626193e1')

build() {
    cd "$srcdir/${pkgname%-git}"
    YARN_CACHE_FOLDER="$srcdir/yarn_cache" yarn install --ignore-scripts
    yarn dist
}

package() {
    mkdir -p "$pkgdir/usr/lib"
    cp -r "$srcdir/${pkgname%-git}/dist" "$pkgdir/usr/lib/${pkgname%-git}"

    install -Dm755 "$srcdir/electron-netease-cloud-music.sh" "$pkgdir/usr/bin/electron-netease-cloud-music"
    install -Dm644 "$srcdir/electron-netease-cloud-music.desktop" -t "$pkgdir/usr/share/applications/"

    ICON="$srcdir/${pkgname%-git}/assets/icons/icon.svg"
    install -Dm644 "$ICON" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname%-git}.svg"

    install -Dm644 "$srcdir/${pkgname%-git}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
pkgver(){
    cd ${srcdir}/${pkgname%-git}
    git describe --tags | sed "s/v//;s/-/./g"
}
