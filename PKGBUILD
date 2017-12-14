pkgname=john-mpi
pkgver=1.8.0
pkgrel=5
_patchlevel=jumbo-1
_commit=76109448e1a42e6a900d61ee87d0c9e3b6f76215
_pkgname=JohnTheRipper
arch=('i686' 'x86_64')
pkgdesc='JohnTheRipper password cracker with Jumbo patch and MPI support'
url='http://openwall.info'
license=('GPL')
provides=('john')
conflicts=('john' 'john-latest')
# For OpenCL support change swap the {make}depends arrays
depends=('mpich' 'libpcap')
optdepends=('perl' 'python2' 'ruby')
makedepends=('mpich' 'unzip')
# Remember to include one of the following packages into the depends
# array for OpenCL to work:
# opencl-mesa
# amdapp-sdk
# opencl-nvidia
# cuda
# intel-opencl-sdk
#depends=('mpich'
#         'libcl'
#         'YOUR_OPENCL_VENDOR_HERE')
#makedepends=('opencl-headers'
#             'libcl')
backup=(etc/john/john.conf
        etc/john/dumb32.conf
        etc/john/dumb16.conf
        etc/john/dynamic.conf)

source=("https://github.com/magnumripper/${_pkgname}/archive/${_commit}.zip"
        "params.h.patch")

prepare() {
  cd ${srcdir}/${_pkgname}-${_commit}/src
  patch -p0 < ${srcdir}/params.h.patch
}

build() {
  export PATH=/opt/mpich/bin:${PATH}
  export CFLAGS="${CFLAGS} -DJOHN_SYSTEMWIDE=1"

  cd ${srcdir}/${_pkgname}-${_commit}/src
  ./configure --prefix=/usr --enable-mpi

  if [ $(which icc &>/dev/null; echo $?) -eq 0 ]; then
    case "${CARCH}" in
      "x86_64")
        make sse-intrinsics-64.S
        break
        ;;
      "i686")
        make sse-intrinsics-32.S
        break
        ;;
    esac
  fi

  make
}

package() {
  # config file
  sed -i 's|$JOHN|/usr/share/john|g' ${srcdir}/${_pkgname}-${_commit}/run/john.conf
  sed -i 's|/usr/share/john/dumb|/etc/john/dumb|g' ${srcdir}/${_pkgname}-${_commit}/run/john.conf
  sed -i 's|/usr/share/john/korelogic.conf|/etc/john/korelogic.conf|g' ${srcdir}/${_pkgname}-${_commit}/run/john.conf
  sed -i 's|/usr/share/john/repeats16.conf|/etc/john/repeats16.conf|g' ${srcdir}/${_pkgname}-${_commit}/run/john.conf
  sed -i 's|/usr/share/john/repeats32.conf|/etc/john/repeats32.conf|g' ${srcdir}/${_pkgname}-${_commit}/run/john.conf
  sed -i 's|.include <regex_alphabets.conf>|.include /etc/john/regex_alphabets.conf|g' ${srcdir}/${_pkgname}-${_commit}/run/john.conf
  sed -i 's|.include <dynamic.conf>|.include /etc/john/dynamic.conf|g' ${srcdir}/${_pkgname}-${_commit}/run/john.conf
  sed -i 's|.include "/usr/share/john/john.local.conf"|#.include "/usr/share/john/john.local.conf"|g' ${srcdir}/${_pkgname}-${_commit}/run/john.conf
  install -dm755 ${pkgdir}/etc/john
  install -m644 ${srcdir}/${_pkgname}-${_commit}/run/*.conf ${pkgdir}/etc/john/
  
  # docs
  install -d -m755 ${pkgdir}/usr/share/doc/john
  install -m644 ${srcdir}/${_pkgname}-${_commit}/doc/* ${pkgdir}/usr/share/doc/john/
  install -d -m755 ${pkgdir}/usr/share/john/
  install -m644 ${srcdir}/${_pkgname}-${_commit}/run/*.chr ${pkgdir}/usr/share/john/
  install -m644 ${srcdir}/${_pkgname}-${_commit}/run/password.lst ${pkgdir}/usr/share/john/
  install -Dm644 ${srcdir}/${_pkgname}-${_commit}/doc/LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE

  # install binaries
  cd ${srcdir}/${_pkgname}-${_commit}/run/
  for i in $(find . -type f -perm 755); do
    install -Dm755 ${i} ${pkgdir}/usr/bin/${i}
  done
  cd ${pkgdir}/usr/bin
  ln -s john unafs
  ln -s john unique
  ln -s john unshadow
  ln -s john undrop
}
sha256sums=('ca8a7099b8f121ee0e3061d8bc0e7c875a8785d5aff74266a354466d9afd548f'
            '432466152dda1bfaae66095ac6d1db48e91c2557e412c799b8c01921b749414a')
