# Maintainer: Lone_Wolf <lone-wolf@klaas-de-kat.nl>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgbase=bullet-multithreaded
pkgname=('bullet-multithreaded' 'bullet-multithreaded-docs' 'python-pybullet-multithreaded')
pkgver=3.07
pkgrel=2
pkgdesc="A 3D Collision Detection and Rigid Body Dynamics Library with multithreading support"
arch=('x86_64')
url="http://www.bulletphysics.com/Bullet/"
license=('custom:zlib')
makedepends=('cmake' 'doxygen' 'graphviz' 'ttf-dejavu' 'mesa' 'glu' 'python' 'python-numpy' 'python-setuptools' 'ninja')
source=("bullet-${pkgver}.tar.gz::https://github.com/bulletphysics/bullet3/archive/${pkgver}.tar.gz"
                "local://bullet3_examplebrowser.sh"
                "local://0001-bump-up-version-to-3.07.patch")
sha512sums=('31fc7cb4ed8b939abc9eeb0a8f6fff3a454ea4ebcffd797fd35a2320fe3ab222fcd315569809ea148d0efff47267f5eec9f4bf7aaf07730a06aa9babd2abc9a6'
            '8741ad94b6c46c226d89aebc8ab06d8a11bac3c04d3f0a2bf7a7524792a3375aa7bf7d295410b16fbeb4c348a31057b4570acdebe9bbaea251f44daca8d9fe81'
            '3874145969414aed2cacfd9968d634cedff1abe67009103addb22e7db70f9b19b1cf6427703876529317c4f2eeb323d388eaadb6f58e2041ce56da83ec03a63f')

prepare() {
    cd bullet3-${pkgver}
    # fix version
    patch --forward --strip=1 --input="${srcdir}/0001-bump-up-version-to-3.07.patch"
}

build() {

    cmake \
        -B _build \
        -S bullet3-${pkgver} \
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
        -D CMAKE_BUILD_TYPE=Release

    ninja -C _build

    cd bullet3-${pkgver}
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
    
    install -Dm755 _build/examples/pybullet/pybullet.so.${pkgver} "${pkgdir}"/usr/lib/libpybullet.so.${pkgver}
    install -Dm755 _build/examples/ExampleBrowser/libBulletExampleBrowserLib.so.${pkgver} "${pkgdir}"/usr/lib/libBulletExampleBrowserLib.so.${pkgver}
    install -Dm755 _build/examples/OpenGLWindow/libOpenGLWindow.so "${pkgdir}"/usr/lib/libOpenGLWindow.so
    install -Dm755 _build/examples/ThirdPartyLibs/Gwen/libgwen.so "${pkgdir}"/usr/lib/libgwen.so
    install -Dm755 _build/examples/ThirdPartyLibs/BussIK/libBussIK.so "${pkgdir}"/usr/lib/libBussIK.so
    install -Dm755 "${srcdir}"/bullet3_examplebrowser.sh "${pkgdir}"/usr/bin/bullet3_examplebrowser
    install -Dm755 _build/examples/ExampleBrowser/App_ExampleBrowser "${pkgdir}"/opt/bullet/App_ExampleBrowser
    cp -r _build/data "${pkgdir}"/opt/bullet/

    install -Dm644 "${srcdir}"/bullet3-${pkgver}/LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

package_python-pybullet-multithreaded() {
    pkgdesc="Bullet Python bindings"
    depends+=('bullet-multithreaded' 'gcc-libs')
    provides=('python-pybullet')
    conflicts=('python-pybullet')

    cd bullet3-${pkgver}
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build

    install -Dm644 "${srcdir}"/bullet3-${pkgver}/LICENSE.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}

package_bullet-multithreaded-docs() {
    pkgdesc="Documentation for bullet"
    arch=('any')
    provides=('bullet-docs')
    conflicts=('bullet-docs')
    
    cd bullet3-${pkgver}
    # install docs
    install -Dm644 docs/GPU_rigidbody_using_OpenCL.pdf "${pkgdir}"/usr/share/doc/bullet/GPU_rigidbody_using_OpenCL.pdf
    install -Dm644 docs/Bullet_User_Manual.pdf "${pkgdir}"/usr/share/doc/bullet/Bullet_User_Manual.pdf
    install -Dm644 docs/BulletQuickstart.pdf "${pkgdir}"/usr/share/doc/bullet/BulletQuickstart.pdf
    cp -r html "${pkgdir}"/usr/share/doc/bullet/html
    install -Dm644 "${srcdir}"/bullet3-${pkgver}/LICENSE.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
# vim: sw=2 ts=2 et:
