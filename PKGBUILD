# Maintainer: Francisco Magalhães <franmagneto@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=cuda65
_pkgname=cuda
pkgver=6.5.14
pkgrel=2
pkgdesc="NVIDIA's GPU programming toolkit (for compute capability < 2.0)"
arch=('x86_64')
url="http://www.nvidia.com/object/cuda_home.html"
license=('custom:NVIDIA')
depends=('gcc-libs' 'opencl-nvidia')
replaces=('cuda-toolkit' 'cuda-sdk')
conflicts=('cuda-toolkit' 'cuda-sdk' 'cuda')
provides=('cuda-toolkit' 'cuda-sdk' 'cuda')
optdepends=('gdb: for cuda-gdb' 'ncurses5-compat-libs: for cuda-gdb')
options=(!strip staticlibs)
install=cuda.install
source=(http://developer.download.nvidia.com/compute/cuda/6_5/rel/installers/cuda_${pkgver}_linux_64.run
        cuda.sh
        cuda.conf)
md5sums=( '90b1b8f77313600cc294d9271741f4da'
         '7e5990e03eea90075f5a500e91a0c3d3'
         'ffe1e6fb7f97b23da28fd94a5fd7356d')

prepare() {
  mkdir ${srcdir}/tmp
  sh cuda_${pkgver}_linux_64.run -extract=${srcdir} -tmpdir ${srcdir}/tmp

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

  mkdir -p "${pkgdir}/usr/share/licenses/${_pkgname}"
  ln -s /opt/cuda/doc/pdf/EULA.pdf "${pkgdir}/usr/share/licenses/${_pkgname}/EULA.pdf"

  # remove redundant man and samples
  rm -fr "${pkgdir}/opt/cuda/doc/man"
  rm -fr "${pkgdir}/opt/cuda/cuda-samples"

  # remove tmpdir
  rm -fr "${srcdir}/tmp"
}
