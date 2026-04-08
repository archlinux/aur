# Maintainer: Stephano Cetola <stephano@cetola.net>

pkgbase=linux-mnt-reform-bin
pkgname=('linux-mnt-reform-bin' 'linux-mnt-reform-bin-headers')
pkgver=6.19.11.reform2
pkgrel=1
_base_kernel_version="${pkgver%%.reform*}"
_kernver="${pkgver/.reform/-reform}"
arch=('aarch64' 'x86_64')
url="https://github.com/cetola/mnt-build"
license=('GPL-2.0-only')
options=(!strip !docs !emptydirs)
source=(
  'extlinux.conf.example'
  'mnt-reform-initramfs.hook'
  'mnt-reform-initramfs.sh'
)
source_aarch64=(
  "kernel-${pkgver}-mnt-aarch64.tar.gz::https://github.com/cetola/mnt-build/releases/download/${pkgver}-aarch64/kernel-${pkgver}-mnt.tar.gz"
  "headers-${pkgver}-mnt-aarch64.tar.gz::https://github.com/cetola/mnt-build/releases/download/${pkgver}-aarch64/headers-${pkgver}-mnt.tar.gz"
)
source_x86_64=(
  "kernel-${pkgver}-mnt-x86_64.tar.gz::https://github.com/cetola/mnt-build/releases/download/${pkgver}-x86_64/kernel-${pkgver}-mnt.tar.gz"
  "headers-${pkgver}-mnt-x86_64.tar.gz::https://github.com/cetola/mnt-build/releases/download/${pkgver}-x86_64/headers-${pkgver}-mnt.tar.gz"
)
sha256sums=(
  '8a15cec00fc571b7b62dba4ad9aa7b0132fe837dca3a424828bb19a37f5d3e58'
  '24e36fc74f7aa27fe699e5eac923c14ae80c7bc85038cfab3d8cd93148d7cb3e'
  '370f19f603a52da48b13a1d18925402c5d4bf65ac2b63ea76a043b416d94cfff'
)
sha256sums_aarch64=(
  '91b1e8e9c5cb5cf5f66836133af0e0a3ef02bc5db3947d8ad49c2b4a1db2a580'
  '6bb38fb3f44398a270ed061b2833c9c0eb092ea94f415c52e18003d4f1a124a6'
)
sha256sums_x86_64=(
  '34cf352189cc7a49ea98c47bedc03c1f73f60370630ceff962613b7fd21ddf36'
  'cd899fc10896c1177fe87f3ff0c39793688504535a85786bab29be712be7860b'
)

build() {
  :
}

package_linux-mnt-reform-bin() {
  pkgdesc="Linux kernel for MNT Reform"
  depends=('coreutils' 'dracut' 'kmod' 'cpio')
  optdepends=('linux-mnt-reform-bin-headers: for building modules')
  provides=("linux=${_base_kernel_version}")
  conflicts=('linux')
  install='linux-mnt-reform-bin.install'

  cd "$srcdir"

  install -dm755 "$pkgdir/usr/lib/modules/${_kernver}"
  cp -r "lib/modules/${_kernver}"/* "$pkgdir/usr/lib/modules/${_kernver}/"

  case "${CARCH}" in
    aarch64)
      install -Dm644 'arch/arm64/boot/Image' \
        "$pkgdir/boot/Image-linux-mnt-reform"

      install -dm755 "$pkgdir/boot/dtbs"
      for dtb in *.dtb; do
        [[ -f "$dtb" ]] || continue
        install -Dm644 "$dtb" "$pkgdir/boot/dtbs/$dtb"
      done

      install -Dm644 "$srcdir/extlinux.conf.example" \
        "$pkgdir/usr/share/doc/linux-mnt-reform-bin/extlinux.conf.example"
      ;;
    x86_64)
      install -Dm644 'arch/x86/boot/bzImage' \
        "$pkgdir/boot/vmlinuz-linux-mnt-reform"
      ;;
    *)
      echo "Unsupported architecture: ${CARCH}" >&2
      return 1
      ;;
  esac

  install -Dm644 "$srcdir/mnt-reform-initramfs.hook" \
    "$pkgdir/usr/share/libalpm/hooks/mnt-reform-initramfs.hook"

  install -Dm755 "$srcdir/mnt-reform-initramfs.sh" \
    "$pkgdir/usr/lib/linux-mnt-reform-bin/mnt-reform-initramfs.sh"
}

package_linux-mnt-reform-bin-headers() {
  pkgdesc='Header files and scripts for building modules for linux-mnt-reform-bin kernel'
  depends=('perl' "linux-mnt-reform-bin=${pkgver}-${pkgrel}")
  provides=("linux-headers=${_base_kernel_version}")
  conflicts=('linux-mnt-reform-headers')

  cd "$srcdir/linux-${pkgver}"

  install -dm755 "$pkgdir/usr/lib/modules/${_kernver}/build"
  echo 'Installing pre-prepared kernel headers...'
  cp -a . "$pkgdir/usr/lib/modules/${_kernver}/build"
}
