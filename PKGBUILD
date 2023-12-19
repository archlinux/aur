# Maintainer: Julian Pollinger <julian@pollinger.dev>

pkgname=mattermost-desktop-git
_pkgname=mattermost-desktop
pkgver=5.7.0.2154b404
pkgrel=1
pkgdesc="Mattermost Desktop for Linux (git)"
arch=('x86_64')

url="https://github.com/mattermost/desktop"
license=('Apache')

makedepends=('jq' 'nodejs' 'npm' 'git' 'asar' 'rpm-tools')
depends=('alsa-lib' 'gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'libutil-linux' 'libappindicator-gtk3' 'libsecret')
optdepends=()

conflicts=('mattermost-desktop')
provides=("${_pkgname}")

source=('git+https://github.com/mattermost/desktop.git#branch=master' ${_pkgname}.desktop)
sha256sums=('SKIP' '9e60ac9cc5a9cbebccb4180e7de947968aa49858812b5623812a1ab651a91093')

_npmargs="--cache '$srcdir/npm-cache' --no-audit --no-fund"

prepare() {
    cd 'desktop'

    npm $_npmargs install
}

build() {
    cd 'desktop'

    export NODE_ENV=production

    npm $_npmargs --offline run build
    npm $_npmargs --offline run package:linux-all-x64
}

package() {
    cd 'desktop'

    cd release/linux-unpacked
    install -d -m 755 "${pkgdir}"/usr/lib/mattermost

    cp -r * "$pkgdir/usr/lib/mattermost"

    cd "$pkgdir/usr/lib/mattermost"

    install -d -m 755 "$pkgdir/usr/bin"
    ln -s /usr/lib/mattermost/${_pkgname} "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

    install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "$pkgdir/usr/lib/mattermost/app_icon.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}

pkgver() {
  cd 'desktop'
  echo -e "$(cat package.json | jq '.version' | sed 's/\"//' | sed 's/.develop.*//').$(git rev-parse --short HEAD)" | sed 's/v//' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
