# Maintainer: AoyuJiao <aoyujiao050824@gmail.com>
# Contributor: BALL Project

pkgname=ballview
pkgver=1.7.4
pkgrel=1
pkgdesc="A free molecular modeling and molecular graphics tool with OpenGL visualization, molecular mechanics, and electrostatic calculations"
arch=('x86_64')
url="https://www.ballview.org/"
license=('LGPL')
depends=(
    'qt6-base'
    'qt6-webengine'
    'boost-libs'
    'eigen'
    'glew'
    'tbb'
    'openbabel'
    'curl'
    'mpg123'
    'mesa'
    'glu'
)
makedepends=(
    'cmake'
    'ninja'
    'git'
    'boost'
    'qt6-base'
    'flex'
    'bison'
    'ccache'
    'python'
    'patchelf'
)
optdepends=(
    'python: for Python bindings (if manually enabled)'
)
source=("git+https://github.com/BALL-Project/ball.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/ball"

    if [ -d test ] && [ ! -f test/CMakeLists.txt.bak ]; then
        mv test test.bak
    fi
    mkdir -p test
    echo "# empty CMakeLists.txt to satisfy add_subdirectory" > test/CMakeLists.txt
}

build() {
    cd "$srcdir/ball"

    # 清除 MGLTools 的旧 libz.so.1 污染（会导致 as/ld 链接失败）
    # MGLTools 位于 /opt/mgltools/lib/，其 libz.so.1 版本过老
    if [[ -n "$LD_LIBRARY_PATH" ]]; then
        _rmpath="/opt/mgltools/lib"
        LD_LIBRARY_PATH="${LD_LIBRARY_PATH//$_rmpath/}"
        LD_LIBRARY_PATH="${LD_LIBRARY_PATH#:}"
        LD_LIBRARY_PATH="${LD_LIBRARY_PATH%:}"
        LD_LIBRARY_PATH="${LD_LIBRARY_PATH//::/:}"
        export LD_LIBRARY_PATH
    fi

    mkdir -p build
    cd build

    cmake .. \
        -GNinja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CXX_STANDARD=17 \
        -DBALL_PYTHON_SUPPORT=OFF \
        -DBALL_HAS_FFTW=OFF \
        -DWITH_LPSOLVE=OFF \
        -DWITH_SVM=OFF \
        -DBUILD_TESTING=OFF \
        -DBALL_ENABLE_PACKAGING=OFF \
        -DBALL_BUILD_TOOLS=OFF \
        -DBALL_BUILD_BALLAXY=OFF \
        -DBALL_BUILD_CWL=OFF \
        -DBALL_BUILD_MMFF94=OFF \
        -DBALL_HAS_VIEW=ON \
        -DCMAKE_EXE_LINKER_FLAGS="-lcurl -lmpg123" \
        -DCMAKE_INSTALL_RPATH=/usr/lib \
        -DCMAKE_BUILD_RPATH_USE_LINK_PATH=OFF

    ninja BALLView
}

package() {
    cd "$srcdir/ball/build"

    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/lib"
    install -d "$pkgdir/usr/share/BALLView"
    install -d "$pkgdir/usr/share/applications"
    install -d "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    install -d "$pkgdir/usr/share/doc/${pkgname}"

    if [ -f "bin/BALLView" ]; then
        install -Dm755 bin/BALLView "$pkgdir/usr/bin/BALLView"
    else
        echo "ERROR: bin/BALLView not found!"
        ls -la bin/ 2>/dev/null || echo "bin/ directory is empty"
        exit 1
    fi

    for lib in $(find . -name "lib*.so*" -type f 2>/dev/null); do
        libname=$(basename "$lib")
        install -Dm755 "$lib" "$pkgdir/usr/lib/$libname"
    done

    # Clean RUNPATH: remove build-directory and PyMOL library paths
    # to prevent runtime conflicts with old system libraries
    patchelf --remove-rpath "$pkgdir/usr/bin/BALLView" 2>/dev/null || true
    for lib in "$pkgdir/usr/lib/"lib*.so*; do
        [ -f "$lib" ] && patchelf --remove-rpath "$lib" 2>/dev/null || true
    done

    if [ -d "$srcdir/ball/data" ]; then
        cp -r "$srcdir/ball/data"/* "$pkgdir/usr/share/BALLView/"
    fi

    if [ -f "$srcdir/ball/README.md" ]; then
        install -Dm644 "$srcdir/ball/README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
    fi

    cat > "$pkgdir/usr/bin/ballview" << 'EOF'
#!/bin/bash
# Strip MGLTools paths from LD_LIBRARY_PATH — their old libz.so.1
# breaks Qt6 WebEngine (requires ZLIB >= 1.2.9)
if [[ -n "$LD_LIBRARY_PATH" ]]; then
    _rmpath="/opt/mgltools/lib"
    LD_LIBRARY_PATH="${LD_LIBRARY_PATH//$_rmpath/}"
    LD_LIBRARY_PATH="${LD_LIBRARY_PATH#:}"
    LD_LIBRARY_PATH="${LD_LIBRARY_PATH%:}"
    LD_LIBRARY_PATH="${LD_LIBRARY_PATH//::/:}"
    export LD_LIBRARY_PATH
fi
export QT_QPA_PLATFORM=xcb
export BALL_DATA_PATH=/usr/share/BALLView
exec /usr/bin/BALLView "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/ballview"

    cat > "$pkgdir/usr/share/applications/BALLView.desktop" << 'EOF'
[Desktop Entry]
Name=BALLView
Comment=Molecular Modeling and Visualization
Exec=ballview
Icon=ballview
Terminal=false
Type=Application
Categories=Science;Chemistry;Education;
StartupNotify=true
MimeType=chemical/x-pdb;chemical/x-xyz;chemical/x-mol2;
EOF

    cat > "$pkgdir/usr/share/icons/hicolor/scalable/apps/ballview.svg" << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" viewBox="0 0 64 64">
  <circle cx="32" cy="32" r="30" fill="#2c5aa0"/>
  <circle cx="32" cy="32" r="24" fill="#3a7bc8"/>
  <text x="32" y="44" text-anchor="middle" fill="white" font-size="28" font-family="sans-serif" font-weight="bold">B</text>
  <circle cx="32" cy="32" r="26" fill="none" stroke="white" stroke-width="1.5"/>
</svg>
EOF
}

post_install() {
    echo ":: BALLView ${pkgver} installed"
    echo ":: Run with: ballview or BALLView"
}

post_remove() {
    echo ":: BALLView removed"
}
