# Maintainer: Grzegorz Ryn <grzegorz.ryn@gmail.com>

pkgname=email-client
pkgver=1.0.0
pkgrel=1
pkgdesc="A CLI email client for Arch Linux"
arch=('x86_64')
url="https://github.com/Samboor/TestPP1"
license=('GPL3')

# Runtime Dependencies
depends=(
    'openssl'
    'icu'
    'gnutls'
    'gsasl'
    'doxygen'
    'graphviz'
    'sqlite'
    'libxml2'
    'nlohmann-json'
    'msmtp-mta'  # For sendmail compatibility
)

# Build Dependencies
makedepends=(
    'cmake'
    'make'
    'gcc'
    'git'
    'pkgconf'
)

# Source and Checksum
source=("email-client-${pkgver}.tar.gz::https://github.com/Samboor/TestPP1/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2528afdd1c13256bd48d56dc5666f2ed72814a91215a199b76ab82a84a975cad')

prepare() {
    cd "$srcdir"
    
    # Cloning and building VMime
    msg "Cloning and building VMime..."
    git clone https://github.com/kisli/vmime.git
    cd vmime
    mkdir build
    cd build
    
    # Specify installation prefix within the src directory
    cmake -G "Unix Makefiles" ../ \
        -DCMAKE_INSTALL_PREFIX="$srcdir/vmime/install" \
        -DVMIME_SENDMAIL_PATH="/usr/bin/sendmail"
    make
    make install
}

build() {
    # Point to the locally built VMime
    export CXXFLAGS="-I$srcdir/vmime/install/include"
    export LDFLAGS="-L$srcdir/vmime/install/lib"

    # Add vmime pkgconfig path
    export PKG_CONFIG_PATH="$srcdir/vmime/install/lib/pkgconfig:$PKG_CONFIG_PATH"

    # Build Email Client
    cd "$srcdir/TestPP1-${pkgver}"
    mkdir -p build
    cd build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DVMIME_SENDMAIL_PATH="/usr/bin/sendmail" \
        -DVMIME_INCLUDE_DIR="$srcdir/vmime/install/include" \
        -DVMIME_LIBRARY_DIR="$srcdir/vmime/install/lib"
    make
}

package() {
    cd "$srcdir/TestPP1-${pkgver}/build"
    
    # Install the email client binary
    install -Dm755 "email_client" "$pkgdir/usr/bin/email_client"
    
    # Install the VMime shared library
    install -Dm755 "$srcdir/vmime/install/lib/libvmime.so.1" "$pkgdir/usr/lib/libvmime.so.1"
    
    # Install symlink for the shared library
    ln -sf /usr/lib/libvmime.so.1 "$pkgdir/usr/lib/libvmime.so"
    
    # Install example documentation
    install -Dm644 "$srcdir/TestPP1-${pkgver}/README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}

