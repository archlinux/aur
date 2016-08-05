# Maintainer: Ashwin Balasubramaniyan <ashwin.vbs@gmail.com>

pkgname=vkcpp
pkgver=1.0
pkgrel=5
pkgdesc="Header that provides a C++ wrapper for vulkan library"
arch=('i686' 'x86_64')
url='https://github.com/KhronosGroup/Vulkan-Hpp'
license=('custom')
depends=('vulkan-headers')
makedepends=('cmake' 'gcc')
source=('vkcpp.hook'
        'VkCppGenerator.patch')

_gitname='vkcpp'
_gitroot='https://github.com/KhronosGroup/Vulkan-Hpp.git'

build() {
    cd ${srcdir}
    if [ -d ${srcdir}/$_gitname ]; then
        cd $_gitname && git pull --recursive origin
        cd ${srcdir}
    else
        git clone --recursive $_gitroot $_gitname
    fi
    msg "git checkout done or server timeout"

    msg "generating make files"
    cd ${srcdir}/$_gitname
    patch < ${srcdir}/VkCppGenerator.patch

    msg "generating make files"
    cmake .

    msg "making vkcpp generator"
    make
}

package() {
    msg "copying the vulkan build hook"
    mkdir -p ${pkgdir}/etc/pacman.d/hooks/
    cp ${srcdir}/vkcpp.hook ${pkgdir}/etc/pacman.d/hooks/

    msg "copying VulkanHppGenerator"
    mkdir -p ${pkgdir}/usr/bin/
    cp ${srcdir}/$_gitname/VulkanHppGenerator ${pkgdir}/usr/bin/

    msg "generating vulkan header"
    mkdir -p ${pkgdir}/usr/include/vulkan/
    ${pkgdir}/usr/bin/VulkanHppGenerator /usr/share/vulkan/vk.xml ${pkgdir}/usr/include/vulkan/vulkan.hpp
}
md5sums=('30ddd45911e0e526cfa72c312b373113'
         '4d7818eaedc6a980fdf32f35c8b58dc0')
