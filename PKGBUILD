# Maintainer: Ashwin Balasubramaniyan <ashwin.vbs@gmail.com>

pkgname=vkcpp
pkgver=1.0
pkgrel=2
pkgdesc="Header that provides a C++ wrapper for vulkan library"
arch=('i686' 'x86_64')
url='https://github.com/nvpro-pipeline/vkcpp'
license=('custom')
depends=('vulkan-headers')
makedepends=('cmake' 'gcc')
source=('vkcpp.hook')

_gitname='vkcpp'
_gitroot='https://github.com/nvpro-pipeline/vkcpp.git'

build() {
    cd ${srcdir}
    if [ -d ${srcdir}/$_gitname ]; then
        cd $_gitname && git pull --recursive origin
        cd ${srcdir}
    else
        git clone --recursive $_gitroot $_gitname
    fi
    msg "git checkout done or server timeout"

    cd ${srcdir}/$_gitname

    msg "generating make files"
    cmake .

    msg "making vkcpp generator"
    make

    msg "removing existing vkcpp header"
    rm ${srcdir}/$_gitname/vulkan/vk_cpp.hpp

    msg "calling the vkcpp generator"
    ./VkCppGenerator /usr/share/vulkan/vk.xml
}

package() {
    msg "copying the header to pkgdir"
    mkdir -p ${pkgdir}/usr/include/vulkan/
    cp ${srcdir}/$_gitname/vulkan/vk_cpp.hpp ${pkgdir}/usr/include/vulkan/
    mkdir -p ${pkgdir}/etc/pacman.d/hooks/
    cp ${srcdir}/vkcpp.hook ${pkgdir}/etc/pacman.d/hooks/
    mkdir -p ${pkgdir}/usr/bin/
    cp ${srcdir}/$_gitname/VkCppGenerator ${pkgdir}/usr/bin/
}

md5sums=('a1dda15a0770c44b9fceba65e90f82e6')
