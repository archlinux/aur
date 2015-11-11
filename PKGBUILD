# $Id: PKGBUILD 69719 2012-04-23 02:56:20Z svenstaro $
# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=cuda-7.0
pkgver=7.0.28
pkgrel=1
pkgdesc="NVIDIA's GPU programming toolkit - Frozen at version 7.0"
arch=('x86_64')
url="http://www.nvidia.com/object/cuda_home.html"
license=('custom:NVIDIA')
depends=('gcc-libs' 'opencl-nvidia')
replaces=('cuda-toolkit' 'cuda-sdk')
provides=('cuda-toolkit' 'cuda-sdk')
optdepends=('gdb: for cuda-gdb')
options=(!strip staticlibs)
install=cuda.install
source=(http://developer.download.nvidia.com/compute/cuda/7_0/Prod/local_installers/cuda_${pkgver}_linux.run
        cuda.sh
        cuda.conf)
md5sums=('312aede1c3d1d3425c8caa67bbb7a55e'
         '7e5990e03eea90075f5a500e91a0c3d3'
         'ffe1e6fb7f97b23da28fd94a5fd7356d')

prepare() {
  sh cuda_${pkgver}_linux.run -extract=${srcdir}
  ./cuda-linux64-rel-*.run --noexec --keep
  ./cuda-samples-linux-*.run --noexec --keep

  # path hacks

  # 1rd sed line: sets right path to install man files
  # 2rd sed line: hack to lie installer, now detect launch script by root
  # 3rd sed line: sets right path in .desktop files and other .desktop stuff (warnings by desktop-file-validate)
  sed -e "s|/usr/share|${srcdir}/../pkg/${pkgname}/usr/share|g" \
      -e 's|can_add_for_all_users;|1;|g' \
      -e 's|=\\"$prefix\\\"|=/opt/cuda|g' -e 's|Terminal=No|Terminal=false|g' -e 's|ParallelComputing|ParallelComputing;|g' \
      -i pkg/install-linux.pl

  # set right path in Samples Makefiles
  sed 's|\$cudaprefix\\|\\/opt\\/cuda\\|g' -i pkg/install-sdk-linux.pl

  # use python2
  find pkg -name '*.py' | xargs sed -i -e 's|env python|env python2|g' -e 's|bin/python|bin/python2|g'
}

package() {
  cd pkg
  perl install-linux.pl -prefix="${pkgdir}/opt/cuda" -noprompt
  perl install-sdk-linux.pl -cudaprefix="${pkgdir}/opt/cuda" -prefix="${pkgdir}/opt/cuda/samples" -noprompt

  # allow gcc 4.9 to work
  sed -i "/unsupported GNU/d" $pkgdir/opt/cuda/include/host_config.h

  install -Dm755 "${srcdir}/cuda.sh" "${pkgdir}/etc/profile.d/cuda.sh"
  install -Dm644 "${srcdir}/cuda.conf" "${pkgdir}/etc/ld.so.conf.d/cuda.conf"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /opt/cuda/doc/pdf/EULA.pdf "${pkgdir}/usr/share/licenses/${pkgname}/EULA.pdf"

  # remove redundant man and samples
  rm -fr "${pkgdir}/opt/cuda/doc/man"
  rm -fr "${pkgdir}/opt/cuda/cuda-samples"
}
