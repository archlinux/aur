# Maintainer: Denis Gordenin <support@yutovo.ru>
pkgname=yutovo
pkgver=1.6.1
pkgrel=1
pkgdesc="Arbitrary precision graphical WYSIWYG calculator inside a text editor"
arch=(x86_64)
url="https://yutovo.com"
license=(GPL-3.0-only)

depends=('hicolor-icon-theme' 'qt5-base' 'zlib' 'fontconfig' 'qt5-base' 'glibc' 'gcc-libs' 'libpng')

makedepends=('git' 'cmake' 'base-devel' 'qt5-base' 'qt5-tools')

source=(
    "spdlog::git+https://github.com/gabime/spdlog.git#commit=6fa36017cfd5731d617e1a934f0e5ea9c4445b13"
    "yutovo-logger::git+https://github.com/denprog/yutovo-logger.git#commit=879105f09f816b38971049fc7ae0178b0d9788c4"
    "boost_1_83_0::https://archives.boost.io/release/1.83.0/source/boost_1_83_0.zip"
    "libgmp::https://ftp.gnu.org/gnu/gmp/gmp-6.3.0.tar.xz"
    "libmpfr::https://www.mpfr.org/mpfr-4.2.1/mpfr-4.2.1.tar.gz"
    "mpc::https://ftp.gnu.org/gnu/mpc/mpc-1.3.1.tar.gz"
    "symengine::https://github.com/symengine/symengine/archive/refs/tags/v0.14.0.tar.gz"
    "yutovo-calculator::git+https://github.com/denprog/yutovo-calculator.git#commit=809bb96b79c709b60a020e3f44a6fd84b889ea73"
    "rapidjson::git+https://github.com/Tencent/rapidjson.git#tag=v1.1.0"
    "yutovo-solver::git+https://github.com/denprog/yutovo-solver.git#commit=60416df6dc8ab644fea7d43b77b646dfee0a236f"
    "mathgl-8.0.3.tar.gz::https://downloads.sourceforge.net/mathgl/mathgl-8.0.3.tar.gz"
    "libharu::git+https://github.com/libharu/libharu.git#commit=0c598becaadaef8e3d12b883f9fc2864a118c12d"
    "stb_image.h::https://raw.githubusercontent.com/nothings/stb/master/stb_image.h"
    "stb_image_write.h::https://raw.githubusercontent.com/nothings/stb/master/stb_image_write.h"
    "yutovo-editor::git+https://github.com/denprog/yutovo-editor.git#commit=d12c9ad07044a5daa96a89e411f0a365223d340f"
    "yutovo-library::git+https://github.com/denprog/yutovo-library.git#commit=2cba3d4249e5fadc3948905fc213a46e84e12b5a"
    "yutovo-desktop::git+https://github.com/denprog/yutovo-desktop.git#commit=0aeb529cbc6ba30007c7f47cd457c5ca2e603b0d"
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

    echo "Building mpc"
    cd mpc-1.3.1
    ./configure --enable-static --disable-shared --prefix=$YUTOVO_DEPLOY --libdir=$YUTOVO_DEPLOY/lib --with-gmp=$YUTOVO_DEPLOY --with-mpfr=$YUTOVO_DEPLOY
    make -sj && make install
    cd ..

    echo "Building symengine"
    cd symengine-0.14.0
    mkdir -p build && cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=OFF -DBUILD_BENCHMARKS=OFF -DWITH_MPFR=True -DWITH_MPC=True -DBUILD_SHARED_LIBS=False -DCMAKE_INSTALL_PREFIX=$YUTOVO_DEPLOY ..
    make -sj && make install
    cd ../..

    echo "Building yutovo-calculator"
    cd yutovo-calculator
    mkdir -p build && cd build
    cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTS=OFF -DCMAKE_INSTALL_PREFIX=$YUTOVO_DEPLOY ..
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
    cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$YUTOVO_DEPLOY ..
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
    cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTS=OFF -DCMAKE_INSTALL_PREFIX=$YUTOVO_DEPLOY ..
    make -sj8 && make install
    cd ../..

    echo "Building yutovo-library"
    cd yutovo-library
    ./pack.sh
    cd ..

    echo "Building yutovo-desktop"
    cd yutovo-desktop
    mkdir -p build && cd build
    cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$YUTOVO_DEPLOY ..
    make -sj8 && make install
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
    cp -r $srcdir/yutovo-desktop/build/src/*.qm $pkgdir/usr/share/yutovo/translations/
    cp -r $srcdir/yutovo-library/library $pkgdir/usr/share/yutovo/
    cp $srcdir/yutovo-desktop/setup/Arch/run.sh $pkgdir/usr/bin/yutovo
    cp $srcdir/yutovo-desktop/setup/yutovo-16.png $pkgdir/usr/share/icons/hicolor/16x16/apps/yutovo.png
    cp $srcdir/yutovo-desktop/setup/yutovo-32.png $pkgdir/usr/share/icons/hicolor/32x32/apps/yutovo.png
    cp $srcdir/yutovo-desktop/setup/yutovo-64.png $pkgdir/usr/share/icons/hicolor/64x64/apps/yutovo.png
    cp $srcdir/yutovo-desktop/src/images/mainicon.png $pkgdir/usr/share/icons/hicolor/256x256/apps/yutovo.png
    cp $srcdir/yutovo-desktop/src/images/mainicon.png $pkgdir/usr/share/icons/hicolor/256x256/mimetypes/application-x-yut.png

    chmod g-w $pkgdir/usr/bin/yutovo-desktop
    chmod o-w $pkgdir/usr/bin/yutovo-desktop
    chmod +x $pkgdir/usr/bin/yutovo
    chmod -R -w $pkgdir/usr/share/yutovo/library

    cp $srcdir/yutovo-desktop/setup/Arch/yutovo.desktop $pkgdir/usr/share/applications/
    cp $srcdir/yutovo-desktop/setup/yutovo.xml $pkgdir/usr/share/mime/packages/
    cp $srcdir/yutovo-desktop/setup/com.yutovo.yutovo.metainfo.xml $pkgdir/usr/share/metainfo/
}
