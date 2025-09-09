# Maintainer: Arjix <me@arjix.dev>

pkgname=winboat-arjix
_pkgname=winboat
pkgver=0.7.8
pkgrel=1
pkgdesc="Run Windows apps on 🐧 Linux with ✨ seamless integration"
arch=('x86_64')
url="https://github.com/TibixDev/winboat"
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib' 'libxtst' 'libxss' 'libsecret' 'docker' 'docker-compose' 'freerdp')
makedepends=('npm' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
  "git+${url}.git#tag=v${pkgver}"
  "${_pkgname}.desktop"
  "electron-builder.json.patch"
)
sha256sums=('ce08f785b68df3e77607ee3390abb1a0a585dc55ba4ac5501f236ceb710ad6ca'
            'e1d52f52541e628574c5cb675d43bfae964c73e0e0c634543683bcb2c147f930'
            'd0acbc28c937ba952011a8fc8662a3ad8ae9368fc59b939979be21d239db5a13')

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
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    cd "$_pkgname"

    install -d "$pkgdir/usr/lib"
    mv "dist/linux-unpacked" "$pkgdir/usr/lib/$_pkgname"

    install -d "$pkgdir/usr/bin"
    ln -s "/usr/lib/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 "icons/icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
