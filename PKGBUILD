# Maintainer: Hari Chalise <harilvfs@chalisehari.com.np>
pkgname=carch-git
_pkgname=carch
pkgver=v4.1.0.r0.ge81dd95
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
    # Remove existing files in the target directories to avoid conflicts
    local install_dir="/usr"
    local files_to_remove=(
        "${install_dir}/bin/carch"
        "${install_dir}/bin/carch-gtk.py"
        "${install_dir}/share/applications/carch.desktop"
        "${install_dir}/share/man/man1/carch.1"
    )
    local scripts_dir="${install_dir}/bin/scripts"

    for file in "${files_to_remove[@]}"; do
        if [ -f "$file" ]; then
            sudo rm -f "$file"
        fi
    done

    if [ -d "$scripts_dir" ]; then
        sudo rm -rf "$scripts_dir"
    fi
}

package() {
    # Install binaries
    install -Dm 755 ${srcdir}/${pkgname}/build/carch -t ${pkgdir}/usr/bin/
    install -Dm 755 ${srcdir}/${pkgname}/gtk/carch-gtk.py -t ${pkgdir}/usr/bin/
    install -d "$pkgdir/usr/bin/scripts"
    install -Dm 755 ${srcdir}/${pkgname}/scripts/*.sh -t ${pkgdir}/usr/bin/scripts/

    # Install desktop entry
    install -Dm 644 ${srcdir}/${pkgname}/carch.desktop -t ${pkgdir}/usr/share/applications/

    # Install license
    install -Dm 644 ${srcdir}/${pkgname}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

    # Install documentation
    install -Dm 644 ${srcdir}/${pkgname}/README.md -t ${pkgdir}/usr/share/doc/${pkgname}/README.md

    # Install man pages
    install -Dm 644 ${srcdir}/${pkgname}/man/carch.1 -t ${pkgdir}/usr/share/man/man1/
}


