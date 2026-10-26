# Maintainer: NotReallyRx
pkgname=polylauncher-git
_name=PolyLauncher
pkgver=0.2.1
pkgrel=1
pkgdesc="PolyTrack Launcher, a game launcher (latest AppImage release)"
arch=('x86_64')
url="https://git.polymodloader.com/PolyLauncher/PolyLauncher"
license=('custom')   # check the repo and set the real license
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
    # The AppImage itself
    install -Dm755 "${srcdir}/${_name}.AppImage" \
        "${pkgdir}/usr/share/polylauncher/PolyLauncher.AppImage"

    # Launch command: just type `polylauncher`
    install -d "${pkgdir}/usr/bin"
    ln -s /usr/share/polylauncher/PolyLauncher.AppImage "${pkgdir}/usr/bin/polylauncher"

    # Icon (from the repo checkout)
    install -Dm644 "${srcdir}/${_name}/public/images/PolyLauncher.png" \
        "${pkgdir}/usr/share/pixmaps/polylauncher.png"

    # .desktop file
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
