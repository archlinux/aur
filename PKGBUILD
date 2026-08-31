# Maintainer: Denis Gordenin <support@yutovo.ru>
pkgname=yutovo
pkgver=1.7.1
pkgrel=3
pkgdesc="Arbitrary precision graphical WYSIWYG calculator inside a text editor"
arch=(x86_64)
url="https://yutovo.com"
license=(GPL-3.0-only)

depends=('hicolor-icon-theme' 'qt5-base' 'zlib' 'fontconfig' 'glibc' 'gcc-libs' 'libpng' 'gmp' 'mpfr' 'ttf-dejavu' 'gnu-free-fonts')

makedepends=('git' 'cmake' 'base-devel' 'qt5-base' 'qt5-tools')

source=(
    "spdlog::git+https://github.com/gabime/spdlog.git#tag=v1.15.3"
    "yutovo-logger::git+https://github.com/denprog/yutovo-logger.git#tag=v1.0.6"
    "boost_1_83_0::https://archives.boost.io/release/1.83.0/source/boost_1_83_0.zip"
    "giac_stable.tgz::https://www-fourier.univ-grenoble-alpes.fr/~parisse/giac/giac_stable.tgz"
    "yutovo-calculator::git+https://github.com/denprog/yutovo-calculator.git#tag=v1.6.1"
    "rapidjson::git+https://github.com/Tencent/rapidjson.git#tag=v1.1.0"
    "yutovo-solver::git+https://github.com/denprog/yutovo-solver.git#tag=v1.3.1"
    "mathgl-8.0.3.tar.gz::https://downloads.sourceforge.net/mathgl/mathgl-8.0.3.tar.gz"
    "libharu::git+https://github.com/libharu/libharu.git#tag=v2.4.4"
    "stb_image.h::https://raw.githubusercontent.com/nothings/stb/master/stb_image.h"
    "stb_image_write.h::https://raw.githubusercontent.com/nothings/stb/master/stb_image_write.h"
    "yutovo-editor::git+https://github.com/denprog/yutovo-editor.git#tag=v1.7.1"
    "yutovo-library::git+https://github.com/denprog/yutovo-library.git#tag=v1.1.1"
    "yutovo-desktop::git+https://github.com/denprog/yutovo-desktop.git#tag=v1.7.1"
)

sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    '3e7fa1c281a21ab74ed66ef247faffe5a105bc11be1f7715f31b4368ce8dcbc8'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

prepare() {
    mkdir -p deploy/lib
    export YUTOVO_DEPLOY=$PWD/deploy
}

build() {
    echo "Building spdlog"
    cd spdlog
    mkdir -p build && cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DSPDLOG_BUILD_TESTS=OFF -DCMAKE_INSTALL_PREFIX=$YUTOVO_DEPLOY ..
    make -sj4 && make install
    cd ../..

    echo "Building yutovo-logger"
    cd yutovo-logger
    mkdir -p build && cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$YUTOVO_DEPLOY ..
    make -sj4 && make install
    cd ../..

    echo "Building boost"
    cd boost_1_83_0
    unset CFLAGS CXXFLAGS LDFLAGS
    ./bootstrap.sh --prefix=$YUTOVO_DEPLOY
    ./b2 headers
    cp -r boost $YUTOVO_DEPLOY/include/
    cd ..

    echo "Building giac"
    cd giac-2.0.0
    patch -Np1 --forward -i "$srcdir/yutovo-desktop/setup/Snap/snap/giac_config_h.diff"
    GIAC_BUILD_JOBS=4 bash "$srcdir/yutovo-desktop/setup/Snap/snap/build_giac.sh" "$srcdir/giac-2.0.0" "$YUTOVO_DEPLOY"
    cd ..
    export LIBRARY_PATH=$YUTOVO_DEPLOY/lib

    echo "Building yutovo-calculator"
    cd yutovo-calculator
    mkdir -p build && cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTS=OFF -DCMAKE_INSTALL_PREFIX=$YUTOVO_DEPLOY ..
    make -sj4 && make install
    cd ../..

    echo "Building rapidjson"
    cd rapidjson
    patch -Np1 -i "$srcdir/yutovo-desktop/setup/document.h.diff"
    cp -r include/rapidjson "$YUTOVO_DEPLOY/include/"
    cd ..

    echo "Building yutovo-solver"
    cd yutovo-solver
    mkdir -p build && cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTS=OFF -DCMAKE_PREFIX_PATH=$YUTOVO_DEPLOY/lib/cmake -DCMAKE_INSTALL_PREFIX=$YUTOVO_DEPLOY ..
    make -sj4 && make install
    cd ../..

    echo "Building mathgl"
    cd mathgl-8.0.3
    mkdir -p build && cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_LIBDIR=$YUTOVO_DEPLOY -Denable-openmp=False -Denable-png=False -Denable-opengl=False -DCMAKE_INSTALL_PREFIX=$YUTOVO_DEPLOY ..
    make -sj4 && make install
    cd ../..

    echo "Building libharu"
    cd libharu
    mkdir -p build && cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX=$YUTOVO_DEPLOY ..
    make -sj4 && make install
    cd ../..

    mkdir -p $YUTOVO_DEPLOY/../third-party/stb_image
    cp stb_image.h $YUTOVO_DEPLOY/../third-party/stb_image/
    cp stb_image_write.h $YUTOVO_DEPLOY/../third-party/stb_image/

    echo "Building yutovo-editor"
    cd yutovo-editor
    mkdir -p build && cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTS=OFF -DCMAKE_INSTALL_PREFIX=$YUTOVO_DEPLOY ..
    make -sj4 && make install
    cd ../..

    echo "Building yutovo-library"
    cd yutovo-library
    mkdir -p $YUTOVO_DEPLOY/bin
    ./make_library.sh $YUTOVO_DEPLOY/bin ZIP
    cd ..

    echo "Building yutovo-desktop"
    cd yutovo-desktop
    mkdir -p build && cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTS=OFF -DCMAKE_INSTALL_PREFIX=$YUTOVO_DEPLOY ..
    make -sj4 && make install
    cd ../..
}

package() {
    echo "package"
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/icons/hicolor/16x16/apps
    mkdir -p $pkgdir/usr/share/icons/hicolor/32x32/apps
    mkdir -p $pkgdir/usr/share/icons/hicolor/64x64/apps
    mkdir -p $pkgdir/usr/share/icons/hicolor/256x256/apps
    mkdir -p $pkgdir/usr/share/icons/hicolor/256x256/mimetypes
    mkdir -p $pkgdir/usr/share/applications/
    mkdir -p $pkgdir/usr/share/mime/packages/
    mkdir -p $pkgdir/usr/share/metainfo/
    mkdir -p $pkgdir/usr/share/yutovo/translations/

    cp $YUTOVO_DEPLOY/bin/yutovo-desktop $pkgdir/usr/bin/
    cp $YUTOVO_DEPLOY/bin/yutovo-solver-calculator-worker $pkgdir/usr/bin/
    cp -r $srcdir/yutovo-desktop/build/src/*.qm $pkgdir/usr/share/yutovo/translations/
    cp -r $YUTOVO_DEPLOY/bin/library $pkgdir/usr/share/yutovo/
    cp $srcdir/yutovo-desktop/setup/Arch/run.sh $pkgdir/usr/bin/yutovo
    cp $srcdir/yutovo-desktop/setup/yutovo-16.png $pkgdir/usr/share/icons/hicolor/16x16/apps/yutovo.png
    cp $srcdir/yutovo-desktop/setup/yutovo-32.png $pkgdir/usr/share/icons/hicolor/32x32/apps/yutovo.png
    cp $srcdir/yutovo-desktop/setup/yutovo-64.png $pkgdir/usr/share/icons/hicolor/64x64/apps/yutovo.png
    cp $srcdir/yutovo-desktop/src/images/mainicon.png $pkgdir/usr/share/icons/hicolor/256x256/apps/yutovo.png
    cp $srcdir/yutovo-desktop/src/images/mainicon.png $pkgdir/usr/share/icons/hicolor/256x256/mimetypes/application-x-yut.png

    chmod g-w $pkgdir/usr/bin/yutovo-desktop
    chmod o-w $pkgdir/usr/bin/yutovo-desktop
    chmod g-w $pkgdir/usr/bin/yutovo-solver-calculator-worker
    chmod o-w $pkgdir/usr/bin/yutovo-solver-calculator-worker
    chmod +x $pkgdir/usr/bin/yutovo
    chmod -R -w $pkgdir/usr/share/yutovo/library

    cp $srcdir/yutovo-desktop/setup/Arch/yutovo.desktop $pkgdir/usr/share/applications/
    cp $srcdir/yutovo-desktop/setup/yutovo.xml $pkgdir/usr/share/mime/packages/
    cp $srcdir/yutovo-desktop/setup/com.yutovo.yutovo.metainfo.xml $pkgdir/usr/share/metainfo/
}
