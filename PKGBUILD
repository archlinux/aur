# Maintainer: Clément Malaingre malaingreclement@gmail.com
pkgname=girpe-v2
pkgver=2.2.3
pkgrel=1
pkgdesc='Application Electron/React de gestion des feuilles de rencontre FFTT'
arch=('x86_64')
url="https://www.fftt.com/deploiements/girpe-v2/#support"
licence=('MIT')
depends=()
makedepends=('npm' '7zip' 'asar' 'jq')
optdepends=()
provides=('girpe-v2')
options=(!strip)
source=("$pkgname-$pkgver.zip::https://www.fftt.com/deploiements/girpe-v2/downloads/Girpe%20V2-$pkgver.zip"
        "girpe-v2.desktop"
        "girpe-v2")
sha512sums=('d122d27b703253c84a9c95b0f9d190e7652454b7d6ccc58842b8d46fe49d025d8ef0ce7f9bc50c53ffca095bbb12aa0feab04df913f81d1b9dffcc2bb553c843'
            'bf16ea80bf5a593f25afcdc92aee4ed295ce377c911de75a96a39438f9fb8f0386fa1fc9445a48b0d2b0761acc3277cd4144d33cc3af3453875f326ffa37ee3c'
            'f4771027bc967ffedc29ad98bdb28539527bdc3414d9f6f3b15946cf47bbb57a58c189c87080694bfe2e56d3a9e601d613efb4d8ddc9ba956e893b790dca8827')

build() {
    7z x "Girpe V2 $pkgver.exe"
    7z x '$PLUGINSDIR/app-64.7z'
    asar extract resources/app.asar unpacked_app
    cd unpacked_app
    find . -name "*.node" -exec rm -vf {} \;
    jq '.["desktopName"]="girpe-v2"|.["linux"].["syncDesktopName"]=true' package.json > package-new.json \
        && mv package-new.json package.json
    npm install --no-save electron electron-rebuild
    npx --yes electron-builder --linux dir
}

package() {
    install -Dm644 -t "$pkgdir/usr/share/applications" girpe-v2.desktop
    install -Dm755 -t "$pkgdir/usr/bin" girpe-v2

    install -dm755 "$pkgdir/usr/lib/$pkgname"

    cd ${srcdir}/unpacked_app
    install -Dm644 -T src/out/assets/girpe-logo-Dojx6l73.png "$pkgdir/usr/share/pixmaps/girpe-v2-logo.png" 
    cp -rt "$pkgdir/usr/lib/$pkgname" dist/linux-unpacked/*
}
