# Maintainer: Ian Lansdowne <idlansdowneatgmaildotcom>
pkgname=nrel-sam
pkgrel=1
pkgver=2025.4.16.r1.ssc.303
_wxver=3.2.6
_gtestver=1.16.0
pkgdesc='A free desktop application for techno-economic analysis of energy technologies'
arch=(x86_64)
url='https://sam.nrel.gov/'
license=('BSD-3-Clause')
depends=()
makedepends=(gendesk git gcc libcurl-gnutls gtk2 mesa freeglut icoutils)
conflicts=(nrel-sam-bin)
source=("git+https://github.com/NREL/SAM.git#tag=$pkgver"
        "git+https://github.com/NREL/lk.git#tag=$pkgver"
        "git+https://github.com/NREL/wex.git#tag=$pkgver"
        "git+https://github.com/NREL/ssc.git#tag=$pkgver"
        "git+https://github.com/google/googletest.git#tag=v$_gtestver"
        "https://github.com/wxWidgets/wxWidgets/releases/download/v$_wxver/wxWidgets-$_wxver.tar.bz2"
)
sha256sums=('0996a71cb64573225265443d4ae54826528b9baf5ac5ad42d2f486da297dffa6'
            '11e86eea6bd3cdff34bca6fcfbbe8576d83ea406aeec233eab054898491d0470'
            'b8b26b0c133b7558915d92acc8ac478ca7a5863ae98dc489df9c61fa39635207'
            '1e6846bd11f18b5a379ca3cb12a35038f756381426bb23d43122d4a9860bc94c'
            'f67edbfc438441f368fc69a83dc142b100228aac2726d9ed8f955c98216e1e81'
            '939e5b77ddc5b6092d1d7d29491fe67010a2433cf9b9c0d841ee4d04acb9dce7')

# API keys required to run SAM

# https://developer.nrel.gov
_sam_api_key=""
_sam_email=""

# Requires Google Cloud account and subscription https://cloud.google.com
_google_api_key=""

build() {
    echo "  -> Building wxWidgets"
    mkdir -p $srcdir/wxWidgets-$_wxver/release-build
    cd $srcdir/wxWidgets-$_wxver/release-build
    ../configure --prefix=$srcdir/wx-$_wxver --enable-shared=no --enable-debug=no --with-gtk=2 --with-libjpeg=builtin --with-libpng=builtin --with-regex=builtin --with-libtiff=builtin --with-zlib=builtin --with-expat=builtin --without-libjbig --without-liblzma --without-gtkprint --with-libnotify=no --with-libmspack=no --with-gnomevfs=no --with-opengl=yes --with-sdl=no --with-cxx=11
    make
    make install
    export WXMSW3=$srcdir/wx-$_wxver

    echo "  -> Building Google Test"
    mkdir -p $srcdir/googletest/build
    cd $srcdir/googletest/build
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS=-std=c++11
    make

    echo "  -> Applying API keys"
    sed -ie "s/sam_api_key = \"\"/sam_api_key = \"$_sam_api_key\"/g" $srcdir/SAM/src/private.h
    sed -ie "s/user_email = \"\"/user_email = \"$_sam_email\"/g" $srcdir/SAM/src/private.h
    sed -ie "s/google_api_key = \"\"/google_api_key = \"$_google_api_key\"/g" $srcdir/SAM/src/private.h

    echo "  -> Building SAM, lk, wex, ssc"
    export GTEST=$srcdir/googletest/
    export LKDIR=$srcdir/lk/
    export WEXDIR=$srcdir/wex
    export SSCDIR=$srcdir/ssc
    export SAMNTDIR=$srcdir/SAM
    export RAPIDJSONDIR=$srcdir/ssc

    cat > $srcdir/CMakeLists.txt <<EOF
cmake_minimum_required(VERSION 3.24)

if (UNIX AND NOT CMAKE_C_COMPILER)
    set(CMAKE_C_COMPILER gcc)
    set(CMAKE_CXX_COMPILER g++)
endif()

Project(system_advisor_model)

option(SAM_SKIP_TOOLS "Skips the SDKtool and TCSconsole builds" ON)
option(SAM_SKIP_TESTS "Skips building tests" ON)
option(SAMAPI_EXPORT "Exports of ssc binaries to the SAM_api directory; for Unix, also compiles ssc libraries for SAM_api. Required to build PySAM." OFF)
option(SAM_SKIP_AUTOGEN "Skips the generating SAMAPI files from export_config required for PySAM builds." ON)

add_subdirectory(lk)
add_subdirectory(wex)
add_subdirectory(ssc)
add_subdirectory(SAM)
if (SAMPRIVATE)
    add_subdirectory(SAM-private)
    add_subdirectory(SAM-private/webupd)
endif()
EOF

    rm -rf $srcdir/build
    mkdir $srcdir/build
    cd $srcdir/build
    cmake .. -DCMAKE_BUILD_TYPE=Release
    make

    cd $srcdir
    echo "  -> Generating desktop files..."
    gendesk -f -n \
        --pkgname 'sam' \
        --pkgdesc "$pkgdesc" \
        --name "System Advisor Model (SAM)" \
        --genericname 'SAM' \
        --comment 'techno-economic analysis of energy technologies' \
        --categories 'Development;Science' \
        --mimetypes '' \
        --icon 'SAM' \
        --exec '/usr/bin/SAM'
    icotool -x -i 1 -o - $srcdir/SAM/build_resources/app.ico > $srcdir/SAM.png
}

package() {
    echo "  -> Installing Build..."
    mkdir -p $pkgdir/opt/SAM $pkgdir/usr/bin
    cp -r $srcdir/build/SAM/deploy/* $pkgdir/opt/SAM

    cat > $pkgdir/usr/bin/SAM <<EOF
#!/bin/sh
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/SAM/linux_64
export GTK2_RC_FILES=/opt/SAM/linux_64/GtkTheme/gtk-2.0/gtkrc
exec /opt/SAM/linux_64/SAMOS.bin
EOF
    chmod 755 $pkgdir/usr/bin/SAM

    echo "  -> Installing desktop files..."
    install -Dm644 "$srcdir/sam.desktop" \
        "$pkgdir/usr/share/applications/sam.desktop"
    install -Dm644 "$srcdir/SAM.png" \
        "$pkgdir/usr/share/pixmaps/SAM.png"
}
