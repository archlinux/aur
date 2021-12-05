# Maintainer: Lone_Wolf <lone-wolf@klaas-de-kat.nl>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgbase=bullet-multithreaded
pkgname=('bullet-multithreaded' 'bullet-multithreaded-docs' 'python-pybullet-multithreaded')
_name=bullet3
pkgver=3.21.r2.6a59241074720e9df119f2f86bc01765917feb1e
pkgrel=1
_ver=3.21
pkgdesc="A 3D collision detection and rigid body dynamics library, built with Multi-Threading and Double Precision support"
arch=('x86_64' 'aarch64')
url="http://www.bulletphysics.com/Bullet/"
license=('custom:zlib')
makedepends=('cmake' 'doxygen' 'graphviz' 'ttf-dejavu' 'mesa' 'glu' 'python' 'python-numpy' 'python-setuptools' 'ninja' 'git')
source=("git+https://github.com/bulletphysics/bullet3.git#commit=6a59241074720e9df119f2f86bc01765917feb1e"
                "local://bullet3_examplebrowser.sh")
sha512sums=('SKIP'
            '8741ad94b6c46c226d89aebc8ab06d8a11bac3c04d3f0a2bf7a7524792a3375aa7bf7d295410b16fbeb4c348a31057b4570acdebe9bbaea251f44daca8d9fe81')
# pybullet version was incorrect in release tarball, switched to master using fixed commithash .

prepare() {
    cd ${_name}
    # fix soname of pybullet
    sed -i '/SET_TARGET_PROPERTIES(pybullet PROPERTIES PREFIX/d' examples/pybullet/CMakeLists.txt
}

build() {

    cmake \
        -B _build \
        -S ${_name} \
        -G Ninja \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D CMAKE_SKIP_RPATH=YES \
        -D BUILD_SHARED_LIBS=1 \
        -D INSTALL_LIBS=1 \
        -D INSTALL_EXTRA_LIBS=1 \
        -D BUILD_PYBULLET=ON \
        -D BUILD_PYBULLET_NUMPY=ON \
        -D BUILD_OPENGL3_DEMOS=ON \
        -D BULLET2_MULTITHREADING=ON \
        -D USE_DOUBLE_PRECISION=ON \
        -D CMAKE_BUILD_TYPE=Release \
        -Wno-dev

    ninja -C _build

    cd ${_name}
    python setup.py build
    doxygen
}

package_bullet-multithreaded() {
    optdepends=('glu: for the example browser'
                            'python: python bindings'
                            'python-numpy: python bindings'
                            'bullet-multithreaded-docs: documentation')
    provides=('bullet')
    conflicts=('bullet')

    DESTDIR="${pkgdir}" ninja -C _build install
    
    install -Dm755 _build/examples/ExampleBrowser/libBulletExampleBrowserLib.so.${_ver} "${pkgdir}"/usr/lib/libBulletExampleBrowserLib.so.${_ver}
    install -Dm755 _build/examples/OpenGLWindow/libOpenGLWindow.so "${pkgdir}"/usr/lib/libOpenGLWindow.so
    install -Dm755 _build/examples/ThirdPartyLibs/Gwen/libgwen.so "${pkgdir}"/usr/lib/libgwen.so
    install -Dm755 _build/examples/ThirdPartyLibs/BussIK/libBussIK.so "${pkgdir}"/usr/lib/libBussIK.so
    install -Dm755 "${srcdir}"/bullet3_examplebrowser.sh "${pkgdir}"/usr/bin/bullet3_examplebrowser
    install -Dm755 _build/examples/ExampleBrowser/App_ExampleBrowser "${pkgdir}"/opt/bullet/App_ExampleBrowser
    cp -r _build/data "${pkgdir}"/opt/bullet/

    install -Dm644 "${srcdir}"/${_name}/LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

package_python-pybullet-multithreaded() {
    pkgdesc="Bullet Python bindings"
    depends+=('bullet-multithreaded' 'gcc-libs')
    provides=('python-pybullet')
    conflicts=('python-pybullet')

    install -Dm755 _build/examples/pybullet/libpybullet.so.${_ver} "${pkgdir}"/usr/lib/libpybullet.so.${_ver}
    cd ${_name}
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 "${srcdir}"/${_name}/LICENSE.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}

package_bullet-multithreaded-docs() {
    pkgdesc="Documentation for bullet"
    arch=('any')
    provides=('bullet-docs')
    conflicts=('bullet-docs')
    
    cd ${_name}
    # install docs
    install -Dm644 docs/GPU_rigidbody_using_OpenCL.pdf "${pkgdir}"/usr/share/doc/bullet/GPU_rigidbody_using_OpenCL.pdf
    install -Dm644 docs/Bullet_User_Manual.pdf "${pkgdir}"/usr/share/doc/bullet/Bullet_User_Manual.pdf
    install -Dm644 docs/BulletQuickstart.pdf "${pkgdir}"/usr/share/doc/bullet/BulletQuickstart.pdf
    cp -r html "${pkgdir}"/usr/share/doc/bullet/html
    install -Dm644 "${srcdir}"/${_name}/LICENSE.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
# vim: sw=2 ts=2 et:
