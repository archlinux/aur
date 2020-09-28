# Maintainer: jerry73204 <jerry73204@gmail.com>

pkgname=cudnn7-cuda10.2
pkgver=7.6.5.32
_cudaver=10.2
pkgrel=1
pkgdesc="NVIDIA CUDA Deep Neural Network library"
arch=('x86_64')
url="https://developer.nvidia.com/cuDNN"
license=('custom')
depends=('cuda-10.2')
# To figure out these URLs, check out the Dockerfiles at
# https://gitlab.com/nvidia/cuda/tree/centos7 for the appropriate cuda version.
source=("https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/libcudnn7-dev_${pkgver}-1+cuda${_cudaver}_amd64.deb"
        "https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/libcudnn7_${pkgver}-1+cuda${_cudaver}_amd64.deb"
        "NVIDIA_SLA+cuDNN_Supp_Feb2017_release.pdf")
sha512sums=('948b1bd93df47e7309450cee91673a7abc48aa009e6a75029880fd2601f9b9a089e8122e87654a1fd6d3dfe93997636089fe3295fa9a6f5b10bb78897e9de822'
            '9463cf2618c2ba017796e7292bd30afd7c6352b0e1b3d9f4f8c44c4f9102895c7a0a592007c3640fd26896ecac595accbb0bfbc9b2b97f876cadc1ede6a86e6b'
            '38bbb7eb287914e4d7ba79da20a47222382687832d4ba0290715199a129c08715a23681800cf8d381f40e24202470a7b20505a31c8cea51a78762a740860251b')
noextract=("libcudnn7-dev_${pkgver}-1+cuda${_cudaver}_amd64.deb"
           "libcudnn7_${pkgver}-1+cuda${_cudaver}_amd64.deb")

package() {
  install_prefix="${pkgdir}/opt/cudnn7-cuda10.2"
  
  mkdir -p "${install_prefix}"/{lib,include}

  mkdir libcudnn7-dev
  cd libcudnn7-dev
  ar xv "${srcdir}"/libcudnn7-dev_${pkgver}-1+cuda${_cudaver}_amd64.deb
  tar xf data.tar.xz
  cp -a usr/include/x86_64-linux-gnu/* "${install_prefix}"/include/
  cp -a usr/lib/x86_64-linux-gnu/* "${install_prefix}"/lib/

  mkdir libcudnn7
  cd libcudnn7
  ar xv "${srcdir}"/libcudnn7_${pkgver}-1+cuda${_cudaver}_amd64.deb
  tar xf data.tar.xz
  cp -a usr/lib/x86_64-linux-gnu/* "${install_prefix}"/lib/

  # Get rid of some Ubuntu-isms but at the same time still allow for them to
  # work because nobody is ever quite sure what the right names are.
  ln -s cudnn_v7.h "${install_prefix}"/include/cudnn.h
  ln -s libcudnn.so.7 "${install_prefix}"/lib/libcudnn.so
  ln -s libcudnn_static_v7.a "${install_prefix}"/lib/libcudnn_static.a

  install -Dm644 \
      "${srcdir}"/NVIDIA_SLA+cuDNN_Supp_Feb2017_release.pdf \
      "${install_prefix}"/share/licenses/${pkgname}/NVIDIA_SLA+cuDNN_Supp_Feb2017_release.pdf
}

# vim: ft=sh syn=sh et
