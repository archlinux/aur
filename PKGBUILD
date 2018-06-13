# Maintainer: dreieck

_pkgname=nyu-hpc-opencl-demo
pkgname="${_pkgname}-git"
epoch=0
pkgver=20150501+6cf0f31
pkgrel=1
pkgdesc="OpenCL demo and OpenCL print devices from the NYU HPC lecture."
arch=('i386' 'i686' 'x86_64')
url="https://github.com/hpc12/tools/"
license=('custom')
depends=(
  'opencl-icd-loader'
)
makedepends=('git')
optdepends=()
provides=(
  "${_pkgname}=${pkgver}"
  "cl-demo"
)
conflicts=("${_pkgname}")
source=(
  "${_pkgname}::git+git://github.com/hpc12/tools/"
  'license.txt'
)
sha256sums=(
  'SKIP'
  '67586be98c23bf64f949659d889ee74d04b7cc3c3c2e172ffaf9b65bb6d7ee53'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _date_rev="$(git log -n1 --format=tformat:'%cI+%h' | sed 's|T[^+]*||' | tr -d '-')"
  if [ -z "${_date_rev}" ]; then
    {
      echo "error: pkgver() could not retrieve version or revision. Please check."
      echo "Aborting."
    } > /dev/stderr
    return 1
  fi
  echo "${_date_rev}"
}

prepare() {
  # Upstream might have compiled binaries already included. Remove in that case.
  cd "${srcdir}/${_pkgname}"
  rm -f cl-demo print-devices
}

build() {
  cd "${srcdir}/${_pkgname}"
  OPENCL_INC=/usr/include/ocl_icd.h OPENCL_LIB=/usr/lib/libOpenCL.so make
}

package() {
  cd "${srcdir}/${_pkgname}"
  
  for _executable in cl-demo print-devices; do
    install -Dvm755 "${_executable}" "${pkgdir}/usr/bin/${_executable}"
  done
  
  install -Dvm644 "${srcdir}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/lincense.txt"
}
