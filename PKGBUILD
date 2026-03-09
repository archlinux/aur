# Maintainer: Denis Gordenin <support@yutovo.ru>
pkgname=yutovo
pkgver=1.5.2
pkgrel=1
pkgdesc="Arbitrary precision graphical WYSIWYG calculator inside a text editor"
arch=(x86_64)
url="https://yutovo.com"
license=(GPL-3.0-only)

depends=('hicolor-icon-theme' 'qt5-base' 'zlib' 'fontconfig' 'qt5-base' 'glibc' 'gcc-libs' 'libpng')

makedepends=('git' 'cmake' 'base-devel' 'qt5-base' 'qt5-tools')

source=(
    "spdlog::git+https://github.com/gabime/spdlog.git#commit=6fa36017cfd5731d617e1a934f0e5ea9c4445b13"
    "yutovo-logger::git+https://github.com/denprog/yutovo-logger.git#commit=d81ca0d8cb1ef46b7d2586d5509691a35479c8d1"
    "boost_1_83_0::https://archives.boost.io/release/1.83.0/source/boost_1_83_0.zip"
    "libgmp::https://ftp.gnu.org/gnu/gmp/gmp-6.3.0.tar.xz"
    "libmpfr::https://www.mpfr.org/mpfr-4.2.1/mpfr-4.2.1.tar.gz"
    "yutovo-calculator::git+https://github.com/denprog/yutovo-calculator.git#commit=32076d02dc87ee7a030aca28cf2bff011384ed52"
    "rapidjson::git+https://github.com/Tencent/rapidjson.git#commit=f54b0e47a08782a6131cc3d60f94d038fa6e0a51"
    "yutovo-solver::git+https://github.com/denprog/yutovo-solver.git#commit=d8545b9d156970e3f651abea70e1a34bffd35e2d"
    "mathgl-8.0.3.tar.gz::https://downloads.sourceforge.net/mathgl/mathgl-8.0.3.tar.gz"
    "libharu::git+https://github.com/libharu/libharu.git#commit=0c598becaadaef8e3d12b883f9fc2864a118c12d"
    "stb_image.h::https://raw.githubusercontent.com/nothings/stb/master/stb_image.h"
    "stb_image_write.h::https://raw.githubusercontent.com/nothings/stb/master/stb_image_write.h"
    "yutovo-editor::git+https://github.com/denprog/yutovo-editor.git#commit=45677ad3be44f189b3aa2daa1f7bd5f56e0ae1d9"
    "yutovo-library::git+https://github.com/denprog/yutovo-library.git#commit=4eed75ca5a845f4c978931af7a62e58a36894070"
    "yutovo-desktop::git+https://github.com/denprog/yutovo-desktop.git#commit=f6139c122a1190e0b520cd838b2d273f1aa3ee5d"
)

sha256sums=(
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
    make -sj && make install
    cd ../..

    echo "Building yutovo-logger"
    cd yutovo-logger
    mkdir -p build && cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$YUTOVO_DEPLOY ..
    make -sj && make install
    cd ../..

    echo "Building boost"
    cd boost_1_83_0
    unset CFLAGS CXXFLAGS LDFLAGS
    ./bootstrap.sh --prefix=$YUTOVO_DEPLOY
    ./b2 headers
    cp -r boost $YUTOVO_DEPLOY/include/
    cd ..

    (
        echo "Building libgmp"
        cd gmp-6.3.0
        CFLAGS="-O2 -std=gnu17 -fno-delete-null-pointer-checks -fno-optimize-sibling-calls" \
            CXXFLAGS="-O2 -std=gnu++17" \
            ./configure --enable-static --disable-shared --enable-cxx --libdir=$YUTOVO_DEPLOY/lib --prefix=/$YUTOVO_DEPLOY
        make -sj && make install
        cd ..
    )

    echo "Building libmpfr"
    cd mpfr-4.2.1
    ./configure --enable-static --disable-shared --enable-cxx --libdir=/$YUTOVO_DEPLOY/lib/ --prefix=/$YUTOVO_DEPLOY
    make -sj && make install
    cd ..

    echo "Building yutovo-calculator"
    cd yutovo-calculator
    mkdir -p build && cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTS=OFF -DCMAKE_INSTALL_PREFIX=$YUTOVO_DEPLOY ..
    make -sj && make install
    cd ../..

    echo "Building rapidjson"
    cd rapidjson
    patch -Np1 -i "$srcdir/yutovo-desktop/setup/document.h.diff"
    cp -r include/rapidjson "$YUTOVO_DEPLOY/include/"
    cd ..

    echo "Building yutovo-solver"
    cd yutovo-solver
    mkdir -p build && cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$YUTOVO_DEPLOY ..
    make -sj && make install
    cd ../..

    echo "Building mathgl"
    cd mathgl-8.0.3
    mkdir -p build && cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_LIBDIR=$YUTOVO_DEPLOY -Denable-openmp=False -Denable-png=False -Denable-opengl=False -DCMAKE_INSTALL_PREFIX=$YUTOVO_DEPLOY ..
    make -sj && make install
    cd ../..

    echo "Building libharu"
    cd libharu
    mkdir -p build && cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX=$YUTOVO_DEPLOY ..
    make -sj && make install
    cd ../..

    mkdir -p $YUTOVO_DEPLOY/../third-party/stb_image
    cp stb_image.h $YUTOVO_DEPLOY/../third-party/stb_image/
    cp stb_image_write.h $YUTOVO_DEPLOY/../third-party/stb_image/

    echo "Building yutovo-editor"
    cd yutovo-editor
    mkdir -p build && cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTS=OFF -DCMAKE_INSTALL_PREFIX=$YUTOVO_DEPLOY ..
    make -sj8 && make install
    cd ../..

    echo "Building yutovo-library"
    cd yutovo-library
    ./pack.sh
    cd ..

    echo "Building yutovo-desktop"
    cd yutovo-desktop
    mkdir -p build && cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$YUTOVO_DEPLOY ..
    make -sj8 && make install
    cd ../..
}

package() {
    echo "package"
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/icons/hicolor/256x256/apps
    mkdir -p $pkgdir/usr/share/icons/hicolor/256x256/mimetypes
    mkdir -p $pkgdir/usr/share/applications/
    mkdir -p $pkgdir/usr/share/mime/packages/
    mkdir -p $pkgdir/usr/share/yutovo/translations/

    cp $YUTOVO_DEPLOY/bin/yutovo-desktop $pkgdir/usr/bin/
    cp -r $srcdir/yutovo-desktop/build/src/*.qm $pkgdir/usr/share/yutovo/translations/
    cp -r $srcdir/yutovo-library/library $pkgdir/usr/share/yutovo/
    cp $srcdir/yutovo-desktop/setup/Arch/run.sh $pkgdir/usr/bin/yutovo
    cp $srcdir/yutovo-desktop/src/images/mainicon.png $pkgdir/usr/share/icons/hicolor/256x256/apps/yutovo.png
    cp $srcdir/yutovo-desktop/src/images/mainicon.png $pkgdir/usr/share/icons/hicolor/256x256/mimetypes/application-x-yut.png

    chmod g-w $pkgdir/usr/bin/yutovo-desktop
    chmod o-w $pkgdir/usr/bin/yutovo-desktop
    chmod +x $pkgdir/usr/bin/yutovo
    chmod -R -w $pkgdir/usr/share/yutovo/library

    cp $srcdir/yutovo-desktop/setup/Arch/yutovo.desktop $pkgdir/usr/share/applications/
    cp $srcdir/yutovo-desktop/setup/yut.xml $pkgdir/usr/share/mime/packages/
}
