# $Id$
# Maintainer: John Andersen <johnandersenpdx@gmail.com>

pkgname=cc-oci-runtime
pkgver=2.1.0
__postfix_ver="-rc.3"
__clear_img_ver=12000
__clear_img=clear-${__clear_img_ver}-containers
__clear_kernel_rpm=linux-container-4.5-50.x86_64.rpm
__clear_oci_rpm_sha=8c8b25e15101a04ed758ba486fc8be8076e40d7f-12
__clear_oci_rpm=cc-oci-runtime-${__clear_oci_rpm_sha}.x86_64.rpm
__clear_oci_rpm_extras=cc-oci-runtime-extras-${__clear_oci_rpm_sha}.x86_64.rpm
__clear_oci_rpm_data=cc-oci-runtime-data-${__clear_oci_rpm_sha}.x86_64.rpm
__clear_oci_rpm_config=cc-oci-runtime-config-${__clear_oci_rpm_sha}.x86_64.rpm
__clear_oci_rpm_bin=cc-oci-runtime-bin-${__clear_oci_rpm_sha}.x86_64.rpm
__cc_oci_runtime=linux-container-4.5-50.x86_64.rpm
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
sha1sums=('a0d3ec7afbdee60623eb2b1edc82f3615c6b767b'
          'c78fa07966bc0a01f810d4759534a17895a1ee3d'
          '4653cbdac9530620e04dc10f94f26c4d1ea9ea7a'
          '33528235696954d7809838d342417fce821a747b'
          '612841ee658b9feb60b4d661015ee0fa074041f3'
          '11f6a756a6348e321ed6f595863e6abff2a1bcb9'
          '5c78daf0644abbb43804041a5496f43d8d10803f')

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
  ln -s clear-12000-containers.img clear-containers.img
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
