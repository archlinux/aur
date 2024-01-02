# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=vkcv-test
pkgver=0.2.0
pkgrel=1
pkgdesc='implementation of A Vulkan framework for computer visualistics (like FSR,SS,..) simplifying building applications, for Radeon/amdgpu hardware'
arch=('x86_64')
license=('MIT')
install="${pkgname}.install"
url='https://github.com/TheJackiMonster/vkcv-framework'
depends=('cmake' 'make' 'gcc' 'vulkan-icd-loader' 'vulkan-headers' 'vulkan-validation-layers' 'vulkan-tools' 'vulkan-radeon')
source=("git+https://github.com/TheJackiMonster/vkcv-framework/"
	"wrapper.sh"
	"vkcv-test.install"
)
sha256sums=('SKIP'
            'a571d0b5e6807c23921bb4c053f83ccdab46add11817effab717b263091a3753'
            '5c7f27abf39f705e2146b65c4a2a60f60070fd48b5b038601f928fc1e79db983'
)
projectlist="bindless_textures
fire_works
first_mesh
first_scene
first_triangle
head_demo
indirect_dispatch
indirect_draw mesh_shader
mpm
particle_simulation
path_tracer
ray_tracer
rt_ambient_occlusion
sph
voxelization"

prepare(){
 msg2 "Getting thread count"
 threads=$(lscpu | grep ^'CPU(s):' | awk '{print $NF}')
 msg2 "init git submodules"
 cd ${srcdir}/vkcv-framework/
 git submodule init
 git submodule update
}

build() {
 cd ${srcdir}/vkcv-framework/
 mkdir ${srcdir}/vkcv-framework/build
 cd ${srcdir}/vkcv-framework/build
 cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF ..
 make -j${threads}
}

package() {
 mkdir -p ${pkgdir}/opt/vkcv/
 cp -r ${srcdir}/vkcv-framework/projects/* ${pkgdir}/opt/vkcv/
 #clean it up
 rm -f ${srcdir}/vkcv-framework/projects/CMakeLists.txt
 rm -f ${srcdir}/vkcv-framework/projects/*/CMakeLists.txt
 rm -f ${srcdir}/vkcv-framework/projects/*/README.md
 rm -f ${srcdir}/vkcv-framework/projects/*/.gitignore
 #fix perms
 chmod 777 ${pkgdir}/opt/vkcv/ -R
 #wrapper
 mkdir -p ${pkgdir}/usr/bin/
 cp ${srcdir}/wrapper.sh ${pkgdir}/usr/bin/vkcv.sh
 msg "How to use?"
 echo "use 'vkcv.sh' to bring up all the demos (which are installed in '/opt/vkcv/')"
}
