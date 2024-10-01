# Maintainer: Matt Parnell <mparnell at gmail dot com>
pkgname=neumodvb-git
pkgver=1.7.bf0f307
pkgrel=1
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
source=("git+https://github.com/deeptho/neumodvb.git")
md5sums=('SKIP')

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
    cmake ..
    make -j$(nproc)
}

package() {
    cd "$srcdir/neumodvb/build"
    make DESTDIR="$pkgdir" install
}

# Optional: Handle ccache setup for faster rebuilds, if user has ccache enabled
ccache_setup() {
    export CC="ccache clang"
    export CXX="ccache clang++"
}

