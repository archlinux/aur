pkgname=vkcv-test
pkgver=0.2.0
pkgrel=3
pkgdesc='implementation of A Vulkan framework for computer visualistics (like FSR,SS,..) simplifying building applications, for Radeon/amdgpu hardware'
arch=('x86_64')
license=('MIT')
install="${pkgname}.install"
url='https://github.com/TheJackiMonster/vkcv-framework'
depends=('cmake' 'make' 'gcc' 'vulkan-icd-loader' 'vulkan-headers' 'vulkan-validation-layers' 'vulkan-tools' 'vulkan-driver' 'git-lfs')
optdepends=('vulkan-radeon: for AMD Radeon GPU'
            'vulkan-intel: for intel GPU'
            'nvidia-vulkan: for nvidia GPU'
            'nvidia-vulkan-dkms: for nvidia GPU dkms mod')
source=("git+https://github.com/TheJackiMonster/vkcv-framework/"
	"wrapper.sh"
	"vkcv-test.install"
)
sha256sums=('SKIP'
            'a571d0b5e6807c23921bb4c053f83ccdab46add11817effab717b263091a3753'
            '5c7f27abf39f705e2146b65c4a2a60f60070fd48b5b038601f928fc1e79db983'
)
prepare(){
 msg2 "init git submodules"
 cd ${srcdir}/vkcv-framework/
 git lfs
 git submodule init
 git submodule update
}

build() {
 cd ${srcdir}/vkcv-framework/
 mkdir ${srcdir}/vkcv-framework/build
 cd ${srcdir}/vkcv-framework/build
 cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF ..
 make
}

package() {
 projectlist=$(cd ${srcdir}/vkcv-framework/projects/;find -maxdepth 1 -type d|tr -d '\./'|grep -v ^$)
 while read project; do
  if [ "$project" == "" ]; then
   continue
  fi
  msg2 "installing ${project}"
  mkdir -p "${pkgdir}/opt/vkcv/${project}/shaders/" && chmod 777 "${pkgdir}/opt/vkcv/${project}/"
  cp -v "${srcdir}/vkcv-framework/projects/${project}/${project}" "${pkgdir}/opt/vkcv/${project}/" && chmod 755 "${pkgdir}/opt/vkcv/${project}/${project}"
  cp -v "${srcdir}/vkcv-framework/projects/${project}/shaders/"* "${pkgdir}/opt/vkcv/${project}/shaders/" && chmod 755 "${pkgdir}/opt/vkcv/${project}/shaders/" -R
 done <<< "$projectlist"
 #wrapper
 mkdir -p ${pkgdir}/usr/bin/
 cp ${srcdir}/wrapper.sh ${pkgdir}/usr/bin/vkcv.sh
}
