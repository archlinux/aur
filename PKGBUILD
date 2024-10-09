# Maintainer: Matt Parnell <mparnell at gmail dot com>
pkgname=neumodvb-git
pkgver=1.7.bf0f307
pkgrel=2
pkgdesc="NeumoDVB is software to interact with DVB devices"
arch=('x86_64')
url="https://github.com/deeptho/neumodvb"
license=('GPL')
depends=('cmake' 'uuid' 'clang' 'libtool' 'boost-libs' 'curl' 'log4cxx' 'libconfig' 'wxgtk3' 
         'gtk3' 'freeglut' 'librsvg' 'libexif' 'gobject-introspection' 'expat' 'python-wxpython' 
         'python-jinja' 'python-matplotlib' 'python-scipy' 'sip4' 'python-cachetools' 
         'python-gobject' 'python-configobj' 'libx11' 'libglvnd' 'espeak' 'mesa' 'mpv' 'libdvbcsa' 
         'ffmpeg' 'fmt' 'python-mpl-scatter-density' 'python-regex')
makedepends=('git' 'boost' 'tsduck')
optdepends=('ccache')
source=("git+https://github.com/deeptho/neumodvb.git"
"static-build-fmt.patch")
sha256sums=('SKIP'
            '5c2b5d92ae0efb6142e22b648a7da8ffcc15e5bb52b1e5e951875ae70a92c989')
options=('!lto')
prepare() {
    cd "$srcdir/neumodvb"
    
    # Remove build directory if it exists, weird issues if we don't
    git clean -xdf

    patch -Np1 -i "$srcdir/static-build-fmt.patch"
}

pkgver() {
    cd "$srcdir/neumodvb"
    
    # Extract the version from changes.md
    version=$(grep -m1 -Po 'neumodvb-\K[0-9.]+' docs/changes.md)
    
    # Get the latest commit hash
    commit_hash=$(git rev-parse --short HEAD)
    
    # Combine version and commit hash
    echo "${version}.${commit_hash}"
}

build() {
    cd "$srcdir/neumodvb"
    mkdir -p build
    cd build

    # be double sure we use clang...
    export CC=clang
    export CXX=clang++

    cmake ..
    make -j$(nproc)
}

package() {
    cd "$srcdir/neumodvb/build"
    make DESTDIR="$pkgdir" install

    # lib64 is a symlink
    install -m 755 "$pkgdir/usr/lib64/libneumolmdb.a" "$pkgdir/usr/lib"
    rm -rf "$pkgdir/usr/lib64"    

    # install the .desktop file
    install -Dm644 "$srcdir/neumodvb/neumodvb.desktop" "$pkgdir/usr/share/applications/neumodvb.desktop"
}   

# Optional: Handle ccache setup for faster rebuilds, if user has ccache enabled
ccache_setup() {
    export CC="ccache clang"
    export CXX="ccache clang++"
}

