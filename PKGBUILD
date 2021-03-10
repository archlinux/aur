pkgname=youtubemusic-git
_pkgname=YoutubeMusicMusic-git
pkgver=1.0.3
pkgrel=1
pkgdesc="YoutubeMusic Music is a unofficial client to play your music."
arch=('any')
url="https://gitlab.com/youtube-music/application"
license=('GPL')
depends=('nss' 'gtk3' 'libxss')
makedepends=('npm' 'git' 'unzip')
provides=("${pkgname%}")
conflicts=("youtube-bin")
source=('git+https://gitlab.com/youtube-music/application.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/application"
    node -pe "require('./package.json').version"
}

build() {
    cd "$srcdir/application"
    npm --cache "$srcdir/npm-cache" i electron@12.0.0 electron-context-menu@2.5.0 electron-packager
    ./node_modules/.bin/electron-packager .
    for dir in YoutubeMusic-linux-*/ ; do mv "${dir}" "YoutubeMusic" ;done
    rm -rf "$srcdir/application/YoutubeMusic/resources/app/node_modules"
}

package() {
    cd "$srcdir/application/YoutubeMusic"
    install -dm755 "$pkgdir/opt/YoutubeMusic"
    cp -r ./ "$pkgdir/opt/YoutubeMusic"

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/YoutubeMusic" "$pkgdir/usr/bin/YoutubeMusic"

    # Desktop Entry
    install -Dm644 "$srcdir/application/YoutubeMusic.desktop" \
        "$pkgdir/usr/share/applications/YoutubeMusic.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/YoutubeMusic.desktop"
}
