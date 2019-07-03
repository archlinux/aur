pkgname=vulkan-radeon-aoc-git
pkgver=19.2.0_devel.113494.d12360227fa
pkgrel=1
pkgdesc='Open-source Vulkan driver for AMD Radeon™ graphics adapters'
arch=('x86_64')
url='https://github.com/daniel-schuermann/mesa'
license=('custom')
depends=('vulkan-icd-loader')
provides=('vulkan-radeon' 'vulkan-driver')
conflicts=('vulkan-radeon')
makedepends=('python-mako' 'libxml2' 'libx11' 'glproto' 'libdrm' 'dri2proto' 'dri3proto' 'presentproto' 
             'libxshmfence' 'libxxf86vm' 'libxdamage' 'libvdpau' 'libva' 'wayland' 'wayland-protocols'
             'elfutils' 'llvm' 'libomxil-bellagio' 'libclc' 'clang' 'libglvnd' 'libunwind' 'lm_sensors'
             'libxrandr' 'valgrind' 'glslang' 'meson')

source=("${pkgname%}::git+https://github.com/daniel-schuermann/mesa.git"
        LICENSE)
sha512sums=('SKIP'
            'f9f0d0ccf166fe6cb684478b6f1e1ab1f2850431c06aa041738563eb1808a004e52cdec823c103c9e180f03ffc083e95974d291353f0220fe52ae6d4897fecc7')

pkgver() {
    cd ${srcdir}/${pkgname%}
    read -r _ver <VERSION
    echo ${_ver/-/_}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build () {
    mkdir -p ${srcdir}/${pkgname%}/mesa
    cd ${srcdir}/${pkgname%}/mesa
    meson ..
    ninja
}

package() {
    install -m755 -d ${pkgdir}/usr/lib
    install -m755 -d ${pkgdir}/usr/share/vulkan/icd.d
    install -m755 -d ${pkgdir}/usr/share/licenses/${pkgname}
    
    install vulkan-radeon-aoc-git/mesa/src/amd/vulkan/libvulkan_radeon.so ${pkgdir}/usr/lib/
    install vulkan-radeon-aoc-git/mesa/src/amd/vulkan/radeon_icd.x86_64.json ${pkgdir}/usr/share/vulkan/icd.d/
    install LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
    
    sed -i "s/\/local\/lib/\/lib/g" ${pkgdir}/usr/share/vulkan/icd.d/radeon_icd.x86_64.json
}
