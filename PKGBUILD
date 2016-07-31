# Maintainer: Ashwin Balasubramaniyan <ashwin.vbs@gmail.com>

pkgname=vkcpp
pkgver=1.0
pkgrel=3
pkgdesc="Header that provides a C++ wrapper for vulkan library"
arch=('i686' 'x86_64')
url='https://github.com/nvpro-pipeline/vkcpp'
license=('custom')
depends=('vulkan-headers')
makedepends=('cmake' 'gcc')
source=('vkcpp.hook'
        'VkCppGenerator.patch')

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

    msg "generating make files"
    cd ${srcdir}/$_gitname
    patch < ${srcdir}/VkCppGenerator.patch

    msg "generating make files"
    cmake .

    msg "making vkcpp generator"
    make
}

package() {
    msg "copying the vk_cpp build hook"
    mkdir -p ${pkgdir}/etc/pacman.d/hooks/
    cp ${srcdir}/vkcpp.hook ${pkgdir}/etc/pacman.d/hooks/

    msg "copying VkCppGenerator"
    mkdir -p ${pkgdir}/usr/bin/
    cp ${srcdir}/$_gitname/VkCppGenerator ${pkgdir}/usr/bin/

    msg "generating vk_cpp header"
    mkdir -p ${pkgdir}/usr/include/vulkan/
    ${pkgdir}/usr/bin/VkCppGenerator /usr/share/vulkan/vk.xml ${pkgdir}/usr/include/vulkan/vk_cpp.hpp
}
md5sums=('100ac1d5a513c1ec220f973b7e7a91c6'
         '70bfdaf07cd0abfeac2992581c18e5ff')
