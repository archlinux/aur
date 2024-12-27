# Maintainer: Hari Chalise <harilvfs@chalisehari.com.np>
pkgname=carch-git
_pkgname=carch
pkgver=v4.1.0.r19.g6810455
pkgrel=1
pkgdesc="An automated script for quick & easy Arch Linux system setup"
arch=(any)
url="https://github.com/harilvfs/$_pkgname"
license=('GPL')
options=(!strip)
depends=(
    "bash"
    "man-pages"
    "man-db"
    "zip"
    "gum"
    "git"
    "sed"
    "xdg-user-dirs"
    "wget"
    "figlet"
    "pacman" 
    "unzip"
    "python"
    "gtk3"
    "noto-fonts-emoji"
    "ttf-joypixels"
    "curl"
)

source=("${pkgname}::git+https://github.com/harilvfs/$_pkgname.git")
md5sums=('SKIP')

conflicts=($_pkgname)
makedepends=(git)

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$pkgname"
    git clean -fdx
}

package() {
    # Install binaries
    install -Dm 755 ${srcdir}/${pkgname}/build/${_pkgname} -t ${pkgdir}/usr/bin/
    install -Dm 755 ${srcdir}/${pkgname}/gtk/${_pkgname}-gtk.py -t ${pkgdir}/usr/bin/
    install -d "$pkgdir/usr/bin/scripts"
    install -Dm 755 ${srcdir}/${pkgname}/scripts/*.sh -t ${pkgdir}/usr/bin/scripts/

    # Install desktop entry
    install -Dm 644 ${srcdir}/${pkgname}/${_pkgname}.desktop -t ${pkgdir}/usr/share/applications/

    # Install license
    install -Dm 644 ${srcdir}/${pkgname}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

    # Install documentation
    install -Dm 644 ${srcdir}/${pkgname}/README.md -t ${pkgdir}/usr/share/doc/${pkgname}/README.md

    # Install man pages
    install -Dm 644 ${srcdir}/${pkgname}/man/${_pkgname}.1 -t ${pkgdir}/usr/share/man/man1/

    	pushd "$pkgdir/usr/"
	for size in 16x16 24x24 32x32 48x48 64x64 128x128 256x256; do
		install -Dm 644 "$srcdir/$pkgname/source/logo/product_logo_${size/x*/}.png" \
			"share/icons/hicolor/$size/apps/carch.png"
	done
}
