# Maintainer: Simone Pezzuto <simone@pezzu.it>
#
pkgname=blender249
pkgver=2.49b
pkgrel=3
pkgdesc='A fully integrated 3D graphics creation suite (version 2.49b)'
arch=('x86_64')
url='http://blender.org'
depends=('python2' 'openexr' 'openal' 'libjpeg'
         'sdl' 'harfbuzz' 'libxi' 'glu')
makedepends=('cmake' 'dos2unix')
license=('GPL')

source=('https://download.blender.org/source/blender-2.49b.tar.gz'
        'blender249py27_gcc9_all.patch'
        'blender249-namespace-std.patch')
sha256sums=('23554db4aa10b00e0e760a8bf9c4a9f749670d815c8bc874a04746adc4752488'
            '6282cb81967862eca928babbe1446126070591c71111d3178d0e3ff31fb455cd'
            '3e8b432606fbe0bace5e3fe6c3938ba3690fe37fd512f4287d3b51e454a83867')

prepare() {
    cd ${srcdir}/blender-${pkgver}

    # one file we need to patch has CLCR line endings, with is not good
    # for a patch to work unfortunately. We convert it before applying
    # the patch
    dos2unix extern/bullet2/src/BulletSoftBody/btSoftBodyInternals.h
    dos2unix source/gameengine/Ketsji/KX_PolygonMaterial.cpp

    # applying various patches
    patch -Np1 -i ${srcdir}/blender249py27_gcc9_all.patch

    # 2022-04: problem with using namespace::std; now fixed
    patch -Np1 -i ${srcdir}/blender249-namespace-std.patch

    mkdir -p build
}

build() {
    cd ${srcdir}/blender-${pkgver}/build

    # 06-2020: added -fcommon to override default gcc10 behaviour
    # 05-2021: remove OpenEXR, broken after release of OpenEXR 3.x
    #
    cmake \
        -GNinja \
        -DCMAKE_EXE_LINKER_FLAGS:STRING="-lX11 -ldl -lpthread -lGL" \
        -DCMAKE_CXX_FLAGS:STRING="-fcommon -fpermissive -Wno-register" \
        -DCMAKE_C_FLAGS:STRING="-fcommon" \
        -DPYTHON_EXECUTABLE:PATH=/usr/bin/python2 \
        -DPYTHON_LIBRARY:PATH=/usr/lib/libpython2.7.so \
        -DPYTHON_INCLUDE_DIR:PATH=/usr/include/python2.7 \
        -DOpenGL_GL_PREFERENCE:STRING="GLVND" \
        -DWITH_OPENMP:BOOL=ON \
        -DWITH_OPENJPEG:BOOL=ON \
        -DWITH_OPENEXR:BOOL=OFF \
        -DWITH_PLAYER:BOOL=ON \
        ../

    ninja

    # build plugins
    #
    ln -sf ../../source/blender/blenpluginapi ../release/plugins/include
    chmod +x ../release/plugins/bmake
    make -C ../release/plugins
}

package() {
    cd ${srcdir}/blender-${pkgver}/build

    # add versioning to avoid conflicts with upstream version
    #
    install -D -m755 bin/blender ${pkgdir}/usr/bin/blender-249
    install -m755 bin/blenderplayer ${pkgdir}/usr/bin/blenderplayer-249

    # plugins: placing in /usr/share/blender/<version>
    #
    install -d ${pkgdir}/usr/share/blender/${pkgver}/plugins/sequence
    install -d ${pkgdir}/usr/share/blender/${pkgver}/plugins/texture
    cp ../release/plugins/sequence/*.so ${pkgdir}/usr/share/blender/${pkgver}/plugins/sequence
    cp ../release/plugins/texture/*.so ${pkgdir}/usr/share/blender/${pkgver}/plugins/texture

    # we also copy the header files, some third-party plugin may require them
    #
    install -d ${pkgdir}/usr/share/blender/${pkgver}/plugins/include
    for ff in documentation.h externdef.h floatpatch.h iff.h plugin.h util.h plugin.DEF; do
        cp ../source/blender/blenpluginapi/$ff ${pkgdir}/usr/share/blender/${pkgver}/plugins/include
    done

    # scripts and others
    #
    cp -r ../release/scripts ${pkgdir}/usr/share/blender/${pkgver}/scripts
    cp ../release/VERSION ${pkgdir}/usr/share/blender/${pkgver}

    cp -r ../bin/.blender/locale ${pkgdir}/usr/share/blender/${pkgver}
    cp ../bin/.blender/.Blanguages ${pkgdir}/usr/share/blender/${pkgver}
    cp ../bin/.blender/.bfont.ttf ${pkgdir}/usr/share/blender/${pkgver}
}
