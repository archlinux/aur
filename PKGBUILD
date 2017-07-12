# $Id$
# Maintainer: John Andersen <johnandersenpdx@gmail.com>

pkgname=cc-oci-runtime
pkgver=2.2.2
__postfix_ver=""
__clear_img_ver=16390
__clear_img=clear-${__clear_img_ver}-containers
__clear_kernel_rpm=linux-container-4.9.35-76.x86_64.rpm
__clear_oci_rpm_sha=2.1.8-22
__clear_oci_rpm=cc-oci-runtime-${__clear_oci_rpm_sha}.x86_64.rpm
__clear_oci_rpm_extras=cc-oci-runtime-extras-${__clear_oci_rpm_sha}.x86_64.rpm
__clear_oci_rpm_data=cc-oci-runtime-data-${__clear_oci_rpm_sha}.x86_64.rpm
__clear_oci_rpm_config=cc-oci-runtime-config-${__clear_oci_rpm_sha}.x86_64.rpm
__clear_oci_rpm_bin=cc-oci-runtime-bin-${__clear_oci_rpm_sha}.x86_64.rpm
__cc_oci_runtime=linux-container-4.9.35-76.x86_64.rpm
__cl_url=https://download.clearlinux.org/releases/${__clear_img_ver}/clear
pkgrel=1
pkgdesc="Intel Clear Containers runtime"
install=${pkgname}.install
arch=(x86_64)
url="https://clearlinux.org"
license=('GPLv2')
depends=('json-glib')
makedepends=('go'
        'glib2'
        'libmnl'
        'check'
        'sed'
        'bash-bats'
        'autoconf-archive'
        'gcc')
checkdepends=('valgrind')
source=("https://github.com/01org/cc-oci-runtime/archive/${pkgver}${__postfix_ver}.tar.gz"
        "${__cl_url}/${__clear_img}.img.xz"
        "${__cl_url}/x86_64/os/Packages/${__clear_kernel_rpm}"
        "${__cl_url}/x86_64/os/Packages/${__clear_oci_rpm_extras}"
        "${__cl_url}/x86_64/os/Packages/${__clear_oci_rpm_data}"
        "${__cl_url}/x86_64/os/Packages/${__clear_oci_rpm_config}"
        # "${__cl_url}/x86_64/os/Packages/${__clear_oci_rpm_bin}"
        "${__cl_url}/x86_64/os/Packages/${__clear_oci_rpm}"
)
sha1sums=('319874d981f263ac98db069a2d624d744c984dde'
          '54b275ae7a96673106f9cd2301d3a8ce9c9a7722'
          '844ad63677365c71f0055648086b584716391cc6'
          '9f7b0b539c65368d7a2e73f9b7b3d9bac374ad81'
          '958ec7db768c21aec712b9f81e0992bdb08e1e79'
          'd5c9353301927008141aa3fa17906be50bf7778b'
          '225eb8e68be104f91e3adb676dc91bd099bce9f0')

build() {
  export GOPATH=$PWD
  mkdir -p "$GOPATH/src/github.com/01org/"
  rm -f "$GOPATH/src/github.com/01org/cc-oci-runtime"
  ln -s $PWD/$pkgname-${pkgver}${__postfix_ver} "$GOPATH/src/github.com/01org/cc-oci-runtime"
  cd "$GOPATH/src/github.com/01org/cc-oci-runtime"
  for i in $(ls "vendor/github.com/"); do
    rm -f "$GOPATH/src/github.com/$i"
    ln -s "$GOPATH/src/github.com/01org/cc-oci-runtime/vendor/github.com/$i" \
      "$GOPATH/src/github.com/$i"
  done
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

check() {
  cd "$GOPATH/src/github.com/01org/cc-oci-runtime"
  # make check
}

package() {
  mv usr $pkgdir
  mv ${__clear_img}.img $pkgdir/usr/share/clear-containers/
  __DIR=$PWD
  cd $pkgdir/usr/share/clear-containers/
  ln -s clear-${__clear_img_ver}-containers.img clear-containers.img
  cd $__DIR
  cd "$GOPATH/src/github.com/01org/cc-oci-runtime"
  make DESTDIR="$pkgdir/" install
  sed -i \
    's#/usr/var/lib/cc-oci-runtime/data/image/#/usr/share/clear-containers/#g' \
    $pkgdir/usr/share/defaults/cc-oci-runtime/vm.json
  sed -i \
    's#/usr/var/lib/cc-oci-runtime/data/kernel/#/usr/share/clear-containers/#g' \
    $pkgdir/usr/share/defaults/cc-oci-runtime/vm.json
}
