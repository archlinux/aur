# Maintainer: NotReallyRx
pkgname=polylauncher-git
_name=PolyLauncher
pkgver=0.2.1
pkgrel=2
pkgdesc="PolyTrack Launcher"
arch=('x86_64')
url="https://git.polymodloader.com/PolyLauncher/PolyLauncher"
license=('custom')
depends=('fuse2' 'zlib' 'glibc')
makedepends=('git' 'curl')
provides=('polylauncher')
conflicts=('polylauncher' 'polylauncher-bin')
options=('!strip')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_name}"
    git tag --sort=-v:refname | head -n1 | sed 's/^v//'
}

build() {
    cd "${srcdir}"
    curl -fL -o "${_name}.AppImage" \
        "${url}/releases/download/${pkgver}/${_name}_${pkgver}_amd64.AppImage"
}

package() {
    install -Dm755 "${srcdir}/${_name}.AppImage" \
        "${pkgdir}/usr/share/polylauncher/PolyLauncher.AppImage"

    install -d "${pkgdir}/usr/bin"
    ln -s /usr/share/polylauncher/PolyLauncher.AppImage "${pkgdir}/usr/bin/polylauncher"

    install -Dm644 "${srcdir}/${_name}/public/images/PolyLauncher.png" \
        "${pkgdir}/usr/share/pixmaps/polylauncher.png"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/polylauncher.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=PolyLauncher
Comment=PolyTrack Launcher
Exec=polylauncher %U
Icon=polylauncher
Terminal=false
Categories=Game;
EOF
}
