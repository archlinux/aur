pkgname=openbangla-keyboard-fcitx-git
pkgver=2.0.0.develop
pkgrel=1
pkgdesc="OpenBangla Keyboard with Fcitx5 support (Develop Branch)"
arch=('x86_64')
url="https://github.com/OpenBangla/OpenBangla-keyboard"
license=('GPL3')
depends=('fcitx5' 'qt5-base' 'qt5-svg')
makedepends=('cmake' 'rust' 'git' 'cargo' 'qt5-svg')
provides=('openbangla-keyboard')
conflicts=('openbangla-keyboard')

# Force clone into 'openbangla' folder
source=('openbangla::git+https://github.com/OpenBangla/OpenBangla-keyboard.git#branch=develop')
sha256sums=('SKIP')

prepare() {
    cd openbangla
    git submodule update --init --recursive
    
    #comment out line 16 (enable_language(Rust))
    sed -i '16s/enable_language(Rust)/# enable_language(Rust)/' CMakeLists.txt
}

build() {
    # 1. Build Riti manually in the source tree
    cd "$srcdir/openbangla/src/engine/riti"
    export RUST_TARGET="x86_64-unknown-linux-gnu"
    cargo build --release --target $RUST_TARGET
    
    #remove release and copy from target
    if [[ -d release ]]; then rm -rf release; fi
    cp -r "target/$RUST_TARGET/release" ./

    # 2. Setup the build directory
    cd "$srcdir/openbangla"
    if [[ -d build ]]; then rm -rf build; fi
    mkdir build
    cd build

    # 3. Configure CMake with Fcitx
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_FCITX=ON \
        -DENABLE_IBUS=OFF

    # 4. Remove the 'riti' CMake folder and 
    # replace it with the one containing our manual Cargo build
    rm -rf src/engine/riti
    mkdir -p src/engine
    cp -r "$srcdir/openbangla/src/engine/riti" ./src/engine/

    # 5. Final Make
    make
}

package() {
    cd "$srcdir/openbangla/build"
    make DESTDIR="$pkgdir" install
}
