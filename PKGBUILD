# Maintainer: Julian Pollinger <julian@pollinger.dev>
# Contributor: Almir Dzinovic <almir@dzinovic.net>
# Contributor: Alexander Pavel <alexpavel123@gmail.com>

pkgname=mattermost-desktop-bin
_pkgname=mattermost-desktop
pkgver=5.5.0
pkgrel=1
pkgdesc="Mattermost Desktop for Linux (binary)"
arch=('x86_64' 'aarch64')

url="https://github.com/mattermost/desktop"
license=('Apache')

makedepends=()
depends=('alsa-lib' 'gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'libutil-linux' 'libappindicator-gtk3' 'libsecret')
optdepends=()

conflicts=('mattermost-desktop' 'mattermost-desktop-git')
provides=("${_pkgname}")

source=(${_pkgname}.desktop icon.svg)
source_x86_64=("https://releases.mattermost.com/desktop/${pkgver}/${_pkgname}-${pkgver}-linux-x64.tar.gz")
source_aarch64=("https://releases.mattermost.com/desktop/${pkgver}/${_pkgname}-${pkgver}-linux-arm64.tar.gz")
sha256sums=('8659351ccebf1fa46bf0ecae0f12261f003edd7cbab21a0a53628efbec02e141'
            'cc5507133b6ef1ccaf130263f4e2527b55eecf6427eb36a899bab695bcb3803c')
sha256sums_x86_64=('86d8ca18ed7a42cd51544e14e3b0dd37c6cda541f8243fcb90c39ea084662cf2')
sha256sums_aarch64=('2d084c488ad60d94d706725f2caa61e5eeadc471af412a84bbe3f58f5cce8938')

package() {
    _pkg=${srcdir}/${_pkgname}-${pkgver}-linux-x64
    if [ "${CARCH}" = "aarch64" ]; then
        _pkg=${srcdir}/${_pkgname}-${pkgver}-linux-arm64
    fi
    cd "${_pkg}"

    install -d -m 755 "${pkgdir}"/usr/lib/mattermost

    cp -r * "$pkgdir/usr/lib/mattermost"

    cd "$pkgdir/usr/lib/mattermost"
    install -Dm644 "${srcdir}/icon.svg" "$pkgdir/usr/lib/mattermost/icon.svg"

    install -d -m 755 "$pkgdir/usr/bin"
    ln -s /usr/lib/mattermost/${_pkgname} "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

    install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "$pkgdir/usr/lib/mattermost/icon.svg" "$pkgdir/usr/share/pixmaps/$_pkgname.svg"
}
