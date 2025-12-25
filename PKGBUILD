# Maintainer: 2thgun <2thgunistaken@gmail.com>
pkgname=finalmouse-cli
pkgver=1.0.0
pkgrel=2
pkgdesc="CLI tool to set Finalmouse polling rate on Arch Linux"
arch=('x86_64')
url="https://github.com/2thgun/finalmouse-cli"
license=('MIT')
depends=('hidapi' 'cmake')
makedepends=('base-devel' 'git')

# Download from master branch (including finalmouse-cli.install and 99-finalmouse.rules)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/2thgun/finalmouse-cli/archive/refs/heads/master.tar.gz"
    "https://raw.githubusercontent.com/2thgun/finalmouse-cli/master/99-finalmouse.rules"  # Udev rule from GitHub repo
    "https://raw.githubusercontent.com/2thgun/finalmouse-cli/master/finalmouse-cli.install"  # Install file from GitHub repo
)

sha256sums=('SKIP' 'SKIP' 'SKIP') # Skip checksum for development version

# Build section
build() {
    cd "$srcdir/finalmouse-cli-master"
    
    # Create build directory
    mkdir -p build
    cd build
    
    # Run cmake and build the project
    cmake ..
    make
}

# Packaging section
package() {
    cd "$srcdir/finalmouse-cli-master/build"
    
    # Install the finalmouse binary to the appropriate directory
    install -Dm755 finalmouse "$pkgdir/usr/bin/finalmouse"

    # Copy the udev rule to the appropriate directory
    install -Dm644 "$srcdir/99-finalmouse.rules" "$pkgdir/usr/lib/udev/rules.d/99-finalmouse.rules"

    # Install the finalmouse-cli.install file
    install -Dm644 "$srcdir/finalmouse-cli.install" "$pkgdir/usr/share/licenses/$pkgname/finalmouse-cli.install"
}

