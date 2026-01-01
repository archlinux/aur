# Maintainer: Denis Gordenin <support@yutovo.ru>
pkgname=yutovo
pkgver=1.4.2
pkgrel=1
pkgdesc="Arbitrary precision graphical WYSIWYG calculator inside a text editor"
arch=(x86_64)
url="https://yutovo.com"
license=(GPL-3.0-only)

depends=('hicolor-icon-theme' 'qt5-base' 'zlib' 'fontconfig' 'qt5-base' 'glibc' 'gcc-libs' 'libpng')

makedepends=('git' 'cmake' 'base-devel' 'qt5-base' 'qt5-tools')

source=(
    "spdlog::git+https://github.com/gabime/spdlog.git#commit=6fa36017cfd5731d617e1a934f0e5ea9c4445b13"
    "yutovo-logger::git+https://github.com/denprog/yutovo-logger.git#commit=e013fbe859f0bdb1ee895e39f8a27f74bbf4e46b"
    "boost_1_83_0::https://archives.boost.io/release/1.83.0/source/boost_1_83_0.zip"
    "libgmp::https://ftp.gnu.org/gnu/gmp/gmp-6.3.0.tar.xz"
    "libmpfr::https://www.mpfr.org/mpfr-4.2.1/mpfr-4.2.1.tar.gz"
    "yutovo-calculator::git+https://github.com/denprog/yutovo-calculator.git#commit=e8e6b2bfdda3b55c39418f3b97eb2f54c3119499"
    "rapidjson::git+https://github.com/Tencent/rapidjson.git#commit=f54b0e47a08782a6131cc3d60f94d038fa6e0a51"
    "yutovo-solver::git+https://github.com/denprog/yutovo-solver.git#commit=6a24ca8eb84cfa9bad122374ae26daea925ab2cd"
    "mathgl-8.0.3.tar.gz::https://downloads.sourceforge.net/mathgl/mathgl-8.0.3.tar.gz"
    "libharu::git+https://github.com/libharu/libharu.git#commit=0c598becaadaef8e3d12b883f9fc2864a118c12d"
    "stb_image.h::https://raw.githubusercontent.com/nothings/stb/master/stb_image.h"
    "stb_image_write.h::https://raw.githubusercontent.com/nothings/stb/master/stb_image_write.h"
    "yutovo-editor::git+https://github.com/denprog/yutovo-editor.git#commit=b4da8111b1cac201bde3d41297c154fbad984099"
    "yutovo-server::git+https://github.com/denprog/yutovo-server.git#commit=22f2fb096e04967dd13df70a79eea6d765a6a1a2"
    "yutovo-desktop::git+https://github.com/denprog/yutovo-desktop.git#commit=011f9a26c42daae4c37a0eb44bfc2b3f8e69dee3"
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
    ./b2 -sj install link=static variant=release cxxflags='-fPIE -fstack-protector-strong -D_FORTIFY_SOURCE=2' --layout=system --with-iostreams
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

    echo $YUTOVO_DEPLOY
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
    cp -r $srcdir/yutovo-server/library $pkgdir/usr/share/yutovo/
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
