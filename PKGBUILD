# Maintainer: Arjix <me@arjix.dev>

pkgname=winboat-arjix
_pkgname=winboat
pkgver=0.6.10
pkgrel=3
pkgdesc="Run Windows apps on 🐧 Linux with ✨ seamless integration"
arch=('x86_64')
url="https://github.com/TibixDev/winboat"
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib' 'libxtst' 'libxss' 'libsecret' 'docker' 'docker-compose' 'freerdp')
makedepends=('npm' 'git')
provides=(winboat)
conflicts=(winboat)
source=(
  "git+https://github.com/TibixDev/winboat.git#tag=v${pkgver}"
  "winboat.desktop"
  "electron-builder.json.patch"
)
sha256sums=('cb5fbdc1148e3662089577d5a7b1dec0f716f9b3e9332e9cdd2db945ab7d6998'
            'e1d52f52541e628574c5cb675d43bfae964c73e0e0c634543683bcb2c147f930'
            '22250af9f24d9bec706d52d8a3254ecbf3701ee150aa8d0b3031326dbb693e31')

prepare() {
    cd "$_pkgname"

    patch -p1 < ../electron-builder.json.patch
    npm install
}

build() {
    cd "$_pkgname"
    npm run build:linux-gs
}

package() {
    install -Dm644 winboat.desktop "${pkgdir}/usr/share/applications/winboat.desktop"

    cd "$_pkgname"

    install -d "$pkgdir/usr/lib"
    mv "dist/linux-unpacked" "$pkgdir/usr/lib/$_pkgname"

    install -d "$pkgdir/usr/bin"
    ln -s "/usr/lib/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 "icons/icon.png" "${pkgdir}/usr/share/pixmaps/winboat.png"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/winboat/LICENSE"
}
