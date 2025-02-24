# Maintainer: almezali <mzmcsmzm@gmail.com>

pkgname=package-installer-xe
pkgver=1.0
pkgrel=1
pkgdesc="Package installation GUI tool"
arch=('x86_64')
url="https://gitlab.com/package-installer-gui/PKG-installer"
license=('GPL')

source=("https://gitlab.com/package-installer-gui/PKG-installer/-/raw/main/package-installer.tar.gz")
sha256sums=('SKIP')

prepare() {
    # The tarball is already extracted by makepkg, so no need to run tar manually
    # Check for an internal PKGBUILD and copy it
    if [[ -f "$srcdir/PKGBUILD" ]]; then
        cp "$srcdir/PKGBUILD" "$srcdir/PKGBUILD.internal"
        echo "Found PKGBUILD inside the archive!"
    else
        echo "No PKGBUILD found inside the archive!"
        exit 1
    fi
}

build() {
    # Call the build() function from the internal PKGBUILD if it exists
    if grep -q "^build()" "$srcdir/PKGBUILD.internal"; then
        source "$srcdir/PKGBUILD.internal"
        build
    else
        echo "No build() function found in the internal PKGBUILD, skipping."
    fi
}

package() {
    # Call the package() function from the internal PKGBUILD if it exists
    if grep -q "^package()" "$srcdir/PKGBUILD.internal"; then
        source "$srcdir/PKGBUILD.internal"
        package
    else
        # Fallback logic if no package() function is found in the internal PKGBUILD
        install -Dm755 "$srcdir/package_installer" "$pkgdir/usr/bin/package_installer"
        install -Dm644 "$srcdir/package_installer.desktop" "$pkgdir/usr/share/applications/package_installer.desktop"
        install -Dm644 "$srcdir/arch_pkg.png" "$pkgdir/usr/share/pixmaps/arch_pkg.png"
    fi
}
