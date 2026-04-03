# Maintainer: Stephano Cetola <stephanoc@gmail.com>

pkgbase=linux-mnt-reform-bin
pkgname=('linux-mnt-reform-bin' 'linux-mnt-reform-bin-headers')
pkgver=6.19.11
pkgrel=1
_kernver="${pkgver}-mnt-reform"
arch=('aarch64')
url="https://github.com/cetola/mnt-build"
license=('GPL-2.0-only')
options=(!strip !docs !emptydirs)
source=(
  "kernel-${pkgver}-${pkgrel}-mnt.tar.gz::https://github.com/cetola/mnt-build/releases/download/${pkgver}-${pkgrel}-mnt-reform/kernel-${pkgver}-${pkgrel}-mnt.tar.gz"
  "headers-${pkgver}-${pkgrel}-mnt.tar.gz::https://github.com/cetola/mnt-build/releases/download/${pkgver}-${pkgrel}-mnt-reform/headers-${pkgver}-${pkgrel}-mnt.tar.gz"
  'extlinux.conf.example'
  'mnt-reform-initramfs.hook'
  'mnt-reform-initramfs.sh'
)
sha256sums=(
  '782549a63d212c499c11ce32b0bcdb57c1a59019db2d75055fa9c667a1579e99'
  '54a7c7d82c977c64e9afce309467ee32f56f6d393085dce042a5fcc27728076a'
  '8a15cec00fc571b7b62dba4ad9aa7b0132fe837dca3a424828bb19a37f5d3e58'
  '24e36fc74f7aa27fe699e5eac923c14ae80c7bc85038cfab3d8cd93148d7cb3e'
  '4c3f37067e72d40b02c246fc4971869ca7a096a0cfe9b7c9edefb13426ffcaee'
)

build() {
  :
}

package_linux-mnt-reform-bin() {
  pkgdesc='Linux kernel for MNT Reform (arm64)'
  depends=('coreutils' 'dracut' 'kmod' 'cpio')
  optdepends=('linux-mnt-reform-bin-headers: for building modules')
  provides=("linux=${pkgver}")
  conflicts=('linux')
  install='linux-mnt-reform-bin.install'

  cd "$srcdir"

  install -dm755 "$pkgdir/usr/lib/modules/${_kernver}"
  cp -r "lib/modules/${_kernver}"/* "$pkgdir/usr/lib/modules/${_kernver}/"

  install -Dm644 'arch/arm64/boot/Image' \
    "$pkgdir/boot/Image-linux-mnt-reform"

  install -dm755 "$pkgdir/boot/dtbs"
  for dtb in *.dtb; do
    [[ -f "$dtb" ]] || continue
    install -Dm644 "$dtb" "$pkgdir/boot/dtbs/$dtb"
  done

  install -Dm644 "$srcdir/extlinux.conf.example" \
    "$pkgdir/usr/share/doc/linux-mnt-reform-bin/extlinux.conf.example"

  install -Dm644 "$srcdir/mnt-reform-initramfs.hook" \
    "$pkgdir/usr/share/libalpm/hooks/mnt-reform-initramfs.hook"

  install -Dm755 "$srcdir/mnt-reform-initramfs.sh" \
    "$pkgdir/usr/lib/linux-mnt-reform-bin/mnt-reform-initramfs.sh"
}

package_linux-mnt-reform-bin-headers() {
  pkgdesc='Header files and scripts for building modules for linux-mnt-reform-bin kernel'
  depends=('perl' "linux-mnt-reform-bin=${pkgver}-${pkgrel}")
  provides=("linux-headers=${pkgver}")
  conflicts=('linux-mnt-reform-headers')

  cd "$srcdir/linux-${pkgver}"

  install -dm755 "$pkgdir/usr/lib/modules/${_kernver}/build"
  echo 'Installing pre-prepared kernel headers...'
  cp -a . "$pkgdir/usr/lib/modules/${_kernver}/build"
}
