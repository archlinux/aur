# -----------------------------------------------------------------------------
# Author: damachine (christkue79@gmail.com)
# Maintainer: damachine <christkue79@gmail.com>
# Website: https://github.com/damachine
# Copyright: (c) 2025 damachine
# License: MIT
# Version: 1.0
#   This software is provided "as is", without warranty of any kind, express or implied.
#   I do not guarantee that it will work as intended on your system.
#
# Info:
#   CoolerDash 'PKGBUILD' - For Arch/AUR building!
#   This 'PKGBUILD' is hosted on AUR and is intended for automatic updates via AUR.
#   This 'PKGBUILD' is designed for Arch Linux and derivatives.
#   Build system for CoolerDash (C99 compliant).
#   Project coding standards and packaging notes (see README for details)
#
# Details:
#   This PKGBUILD handles build, install, dependencies, and packaging for Arch/AUR.
#   Edit dependencies, paths, and user as needed for your system.
#   Do not run as root. Use dedicated user for security.
#   Ensure all required dependencies are installed.
#   It uses color output and Unicode icons for better readability. All paths and dependencies are configurable.
#   See 'README.md' for further details.
#
# Build:
#   'makepkg -si'
#
# Dependency:
#   'cairo' 'coolercontrol' 'jansson' 'libcurl-gnutls' 'libinih' are required for core functionality.
#   'ttf-roboto' is required for proper font rendering on the LCD.
#   All dependencies are documented in 'README.md'.
# -----------------------------------------------------------------------------
pkgname=coolerdash-git
pkgver=1.86.r0.g055ef98
pkgrel=1
provides=('coolerdash')
replaces=('coolerdash')
conflicts=('coolerdash')
pkgdesc="Displays real-time sensor on an AIO liquid cooler with integrated LCD displays."
arch=('x86_64')
url="https://github.com/damachine/coolerdash"
license=('MIT')
depends=('cairo' 'coolercontrol' 'jansson' 'libcurl-gnutls' 'libinih' 'ttf-roboto')
makedepends=('gcc' 'make' 'pkg-config' 'git')
backup=('etc/coolerdash/config.ini')
install=coolerdash.install
_commit=055ef987ccb34c897b8657b50236906e1f90b209
source=("git+https://github.com/damachine/coolerdash.git#commit=$_commit")
sha256sums=('SKIP')

# https://wiki.archlinux.org/title/Arch_package_guidelines#Package_sources
pkgver() {
    cd "$srcdir/coolerdash"
    git describe --tags --long --match "v*" | sed -E 's/^v//; s/-([0-9]+)-g/\.r\1.g/; s/-/./g'
}

build() {
    # Build inside the checked-out repository
    cd "$srcdir/coolerdash" || return 1

    # Remove all previous tarball builds
    rm -rf coolerdash-*.pkg.* || true
    rm -rf build bin || true
    mkdir -p build bin || true

    # Clean any previous builds if a Makefile exists
    if [[ -f Makefile || -f GNUmakefile ]]; then
        make clean || true
    fi

    # Build
    make || return 1

    # Copy binary to $srcdir/bin for packaging
    mkdir -p "$srcdir/bin"
    cp -a bin/coolerdash "$srcdir/bin/coolerdash"

    # Copy all required files for packaging to $srcdir
    cp -a README.md "$srcdir/README.md"
    cp -a CHANGELOG.md "$srcdir/CHANGELOG.md"
    cp -a VERSION "$srcdir/VERSION"
    cp -a LICENSE "$srcdir/LICENSE"
    cp -a etc/coolerdash/config.ini "$srcdir/config.ini"
    mkdir -p "$srcdir/images"
    cp -a images/shutdown.png "$srcdir/images/shutdown.png"
    mkdir -p "$srcdir/systemd"
    cp -a etc/systemd/coolerdash.service "$srcdir/systemd/coolerdash.service"
    mkdir -p "$srcdir/man"
    cp -a man/coolerdash.1 "$srcdir/man/coolerdash.1"
}

check() {
    # Check in the checked-out repository
    cd "$srcdir/coolerdash" || return 1

    if [[ -f bin/coolerdash ]]; then
        echo "Build successful - binary created"
    else
        echo "ERROR: Binary not found"
        return 1
    fi
}

package() {
    # Create necessary directories and install files
    install -dm755 "$pkgdir/opt/coolerdash"
    install -Dm644 "$srcdir/README.md" "$pkgdir/opt/coolerdash/README.md"
    install -Dm644 "$srcdir/VERSION" "$pkgdir/opt/coolerdash/VERSION"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/opt/coolerdash/LICENSE"
    install -Dm644 "$srcdir/CHANGELOG.md" "$pkgdir/opt/coolerdash/CHANGELOG.md"
    install -Dm644 "$srcdir/config.ini" "$pkgdir/etc/coolerdash/config.ini"
    install -dm755 "$pkgdir/opt/coolerdash/bin"
    install -Dm755 "$srcdir/bin/coolerdash" "$pkgdir/opt/coolerdash/bin/coolerdash"
    install -dm755 "$pkgdir/opt/coolerdash/images"
    install -Dm644 "$srcdir/images/shutdown.png" "$pkgdir/opt/coolerdash/images/shutdown.png"
    install -dm755 "$pkgdir/usr/bin"
    ln -sf /opt/coolerdash/bin/coolerdash "$pkgdir/usr/bin/coolerdash"
    install -Dm644 "$srcdir/systemd/coolerdash.service" "$pkgdir/etc/systemd/system/coolerdash.service"
    install -Dm644 "$srcdir/man/coolerdash.1" "$pkgdir/usr/share/man/man1/coolerdash.1"
}
