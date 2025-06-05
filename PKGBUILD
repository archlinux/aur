# Maintainer:       baiyuanneko <i at nekomoe.xyz>
# Co-Maintainer:    Misaka13514 <Misaka13514 at gmail dot com>
pkgname=bangumium-git
_pkgname=${pkgname%-git}
pkgver=0.9.5.r0.b3006b0
pkgrel=1
pkgdesc="Universal third-party desktop client for bgm.tv"
arch=('any')
url="https://github.com/Bangumium/Bangumium"
license=('MIT')
depends=('python-gobject' 'webkit2gtk-4.1' 'python-beautifulsoup4' 'python-httpx' 'python-json5' 'python-notify-py' 'python-pystray' 'python-pywebview')
makedepends=('git' 'npm' 'python' 'python-pip' 'nodejs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
    "${_pkgname}::git+${url}.git"
)
sha256sums=(
    'SKIP'
)

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "$srcdir/${_pkgname}/frontend"
    npm install
    npm run build-only
    cp -r dist ../frontend_dist/
}

package() {
    mkdir -p "${pkgdir}/opt/bangumium"
    cp -r "$srcdir/${_pkgname}/." "${pkgdir}/opt/bangumium/"
    cd "$srcdir/${_pkgname}/"
    install -Dm644 "icon.png" "${pkgdir}/usr/share/icons/bangumium.png"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${_pkgname}.desktop" << "EOF"
[Desktop Entry]
Name=Bangumium
Comment=Universal third-party desktop client for bgm.tv
Exec=/usr/bin/bangumium
Terminal=false
Icon=/usr/share/icons/bangumium.png
Type=Application
StartupNotify=false
Categories=Network
EOF
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/bangumium" << "EOF"
#!/bin/bash
python /opt/bangumium/main.py
EOF
}
