# Maintainer: Lily Wilson <hotaru@thinkindifferent.net>
# Contributor: Thomas Bächler <thomas@archlinux.org>
pkgname=ipxe-netboot
pkgver=r5942.ebff21a5
pkgrel=1
pkgdesc="iPXE build for Arch Linux netboot"
arch=('i686' 'x86_64')
url="http://ipxe.org"
license=('GPL')
makedepends=('git'
             'gcc'
             'binutils'
             'make'
             'perl'
             'xz'
             'zlib')
options=(!strip)
source=('ipxe::git+https://git.ipxe.org/ipxe.git#branch=master'
        arch.ipxe
        codesigning_thomas_archlinux.pem
        codesigning_pierre_archlinux.pem
        dst_x1.pem
        fcommon.patch
        test-netboot)
sha256sums=('SKIP'
            '2f018d7a5f76efff4078ab3c9a83ebd8ddb8e1dc1a993f86180850e4788e45db'
            '3ba0cf390975bb07bf1d3c7ff802d6977bdf901c94883ea2de44c16d444252e5'
            '64d021f345a0b4633de17ba43d816295076adc8a378eaa54e6796e8c0e95d6d0'
            '139a5e4a4e0fa505378c72c5f700934ce8333f4e6b1b508886c4b0eb14f4be99'
            'c063b56a6b9b5b61595be0f96b3f541e57103a681011327963c2bc10993e0242'
            'c485ec0609580bedceb22b008cc7fcadebd30af94b5c42f7ceecd0c40b9abbbe')

pkgver() {
  cd "$srcdir/ipxe"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/ipxe/src"
  patch -p2 <"$srcdir/fcommon.patch"
  mkdir -p config/local
  : > config/local/general.h
  echo '#define NET_PROTO_IPV6' >> config/local/general.h
  echo '#define DOWNLOAD_PROTO_HTTPS' >> config/local/general.h
  echo '#define IMAGE_TRUST_CMD' >> config/local/general.h
  echo '#define NTP_CMD' >> config/local/general.h
}

build() {
  cd "$srcdir/ipxe/src"

  NO_WERROR=1
  export NO_WERROR

  make \
    EMBED="$srcdir/arch.ipxe" \
    CERT="$srcdir/codesigning_pierre_archlinux.pem","$srcdir/codesigning_thomas_archlinux.pem","$srcdir/dst_x1.pem" \
    TRUST="$srcdir/codesigning_pierre_archlinux.pem","$srcdir/codesigning_thomas_archlinux.pem","$srcdir/dst_x1.pem" \
    bin/ipxe.lkrn \
    bin/ipxe.pxe \
    bin-x86_64-efi/ipxe.efi
}

package() {
  cd "$srcdir/ipxe/src"
  install -d -m755 "$pkgdir"/usr/share/ipxe-netboot
  install -m644 bin/ipxe.lkrn "$pkgdir"/usr/share/ipxe-netboot/
  install -m644 bin/ipxe.pxe "$pkgdir"/usr/share/ipxe-netboot/
  install -m644 bin-x86_64-efi/ipxe.efi "$pkgdir"/usr/share/ipxe-netboot/
  install -D -m755 "$srcdir"/test-netboot "$pkgdir"/usr/bin/test-netboot
}
