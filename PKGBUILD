# Maintainer: Roman Hackhofer <r.hackhofer@otter.farm>
pkgname="idrt-git"
_pkgname="idrt"
pkgver=20210111_d6da738
pkgrel=1
pkgdesc="An application intended to hold your web-based messaging-applications (or any other single page application)"
arch=('x86_64')
url="https://github.com/hpotter02/idrt"
license=('GPL3')
makedepends=('git' 'npm')
depends=('electron')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "${pkgname%-git}-bin")
source=("${pkgname%-git}::git+https://github.com/hpotter02/idrt.git"
	"${pkgname%-git}.desktop"
	"${pkgname%-git}.sh")

md5sums=('SKIP'
	 'f0c07f2cfc3c87ed1d3c8562d23f698d'
	 'a682caeacffc6f6e68000de986fa545e')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    echo $(date +%Y%m%d)_$(git rev-parse --short HEAD)
}

build() {
    cd "$srcdir/${pkgname%-git}"
    
    # use system electron version
    # see: https://wiki.archlinux.org/index.php/Electron_package_guidelines
    electronDist=$(dirname $(realpath $(which electron)))
    electronVer=$(electron --version | tail -c +2)
    sed -i '/		"electron": /d' ./package.json
    HOME="$srcdir/.electron-gyp" npm install --cache "${srcdir}/npm-cache"
    ./node_modules/.bin/electron-builder --linux --x64 -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package() {
    cd "$srcdir/${pkgname%-git}"
    
    install -dm755 "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -dr --no-preserve=ownership dist/linux-unpacked/resources/* "${pkgdir}/usr/lib/${pkgname%-git}/"
    
    
    install -dm755 "${pkgdir}/usr/bin"
    install -Dm755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
    install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
}
