# Maintainer: Ashwin Balasubramaniyan <ashwin.vbs@gmail.com>

pkgname=vkcpp
pkgver=1.0
pkgrel=1
pkgdesc="Header that provides a C++ wrapper for vulkan library"
arch=('i686' 'x86_64')
url='https://github.com/nvpro-pipeline/vkcpp'
license=('custom')
depends=('vulkan-headers')
makedepends=('cmake' 'gcc')

_gitname='vkcpp'
_gitroot='https://github.com/nvpro-pipeline/vkcpp.git'

build() {
    cd ${srcdir}
    if [ -d ${srcdir}/$_gitname ]; then
        cd $_gitname && git pull origin
        cd ${srcdir}
    else
        git clone --recursive $_gitroot $_gitname
    fi
    msg "git checkout done or server timeout"

    headerBuildDate="$(pacman -Qi vulkan-headers | awk -F ": " '/^Build/ {print $2}')"
    msg "vulkan-headers was built on ${headerBuildDate}"

    msg "checking out the appropriate version of Vulkan-Docs"
    cd ${srcdir}/$_gitname/Vulkan-Docs && git checkout $(git rev-list -n 1 --before="${headerBuildDate}" 1.0)
    cd ${srcdir}/$_gitname

    msg "generating make files"
    cmake .

    msg "making vkcpp generator"
    make

    msg "removing existing vkcpp header"
    rm ${srcdir}/$_gitname/vulkan/vk_cpp.hpp

    msg "calling the vkcpp generator"
    ./VkCppGenerator

}

package() {
    msg "copying the header to pkgdir"
    mkdir -p ${pkgdir}/usr/include/vulkan/
    cp ${srcdir}/$_gitname/vulkan/vk_cpp.hpp ${pkgdir}/usr/include/vulkan/
}
