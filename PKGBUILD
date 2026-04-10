# Maintainer: Boulloche <boulloche at tutamail dot com>

pkgname=emdash-git
pkgver=0.4.47.r18.g44ff202
pkgrel=1
pkgdesc='Open-source agentic development environment'
arch=('x86_64')
url='https://github.com/generalaction/emdash'
license=('Apache-2.0')
depends=('alsa-lib' 'gtk3' 'libsecret' 'nss')
makedepends=('git' 'nodejs' 'pnpm')
options=('!strip' '!debug')
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    export HOME="$srcdir/.home"
    mkdir -p "$HOME"
    pnpm install --frozen-lockfile --ignore-scripts
    pnpm run rebuild
    pnpm run build
    pnpm exec electron-builder --linux --dir --publish never
}

package() {
    cd "$pkgname/release/linux-unpacked"

    install -d "$pkgdir/opt/emdash"
    cp -a . "$pkgdir/opt/emdash/"

    install -d "$pkgdir/usr/bin"
    ln -s /opt/emdash/emdash "$pkgdir/usr/bin/emdash"

    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/emdash.desktop" <<END
[Desktop Entry]
Name=Emdash
Comment=Open-source agentic development environment
Exec=emdash %U
Icon=emdash
Type=Application
Categories=Development;
Terminal=false
StartupWMClass=Emdash
END

    cd "$srcdir/$pkgname"
    install -Dm644 src/assets/images/emdash/emdash_logo.png "$pkgdir/usr/share/pixmaps/emdash.png"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
