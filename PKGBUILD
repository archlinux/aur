# Maintainer: Stephano Cetola <stephano@cetola.net>

pkgbase=linux-mnt-reform-bin
pkgname=('linux-mnt-reform-bin' 'linux-mnt-reform-bin-headers')
pkgver=7.3.3.reform1
pkgrel=1
_base_kernel_version="${pkgver%%.reform*}"
_kernver="${pkgver/.reform/-reform}"
arch=('aarch64' 'x86_64')
url="https://github.com/cetola/mnt-build"
license=('GPL-2.0-only')
options=(!strip !docs !emptydirs)
source=(
  'extlinux.conf.example'
  'linux-mnt-reform-bin.install'
  'mnt-reform-initramfs.hook'
  'mnt-reform-initramfs.sh'
)
source_aarch64=(
  "kernel-${pkgver}-aarch64.tar.gz::https://github.com/cetola/mnt-build/releases/download/${pkgver}-aarch64/kernel-${pkgver}.tar.gz"
  "headers-${pkgver}-aarch64.tar.gz::https://github.com/cetola/mnt-build/releases/download/${pkgver}-aarch64/headers-${pkgver}.tar.gz"
)
source_x86_64=(
  "kernel-${pkgver}-x86_64.tar.gz::https://github.com/cetola/mnt-build/releases/download/${pkgver}-x86_64/kernel-${pkgver}.tar.gz"
  "headers-${pkgver}-x86_64.tar.gz::https://github.com/cetola/mnt-build/releases/download/${pkgver}-x86_64/headers-${pkgver}.tar.gz"
)
sha256sums=(
  '8a15cec00fc571b7b62dba4ad9aa7b0132fe837dca3a424828bb19a37f5d3e58'
  '7c27485554ba7d5384bf40f309b015b3934d0a674a4ed716d19d18380298c0ad'
  '24e36fc74f7aa27fe699e5eac923c14ae80c7bc85038cfab3d8cd93148d7cb3e'
  'df72a1c7f74f6b459fb7b4ef57617b0c8adb73fb0503803db0d660378faa7d4a'
)
sha256sums_aarch64=(
  '707858afa3b0f33585450d6144fffaa0c0202f2dce486bea77b383da93fa8ec2'
  '950811b1d18725c739b2498e5f48affeb7a3f03b0728a7b49f62ba58fc89528f'
)
sha256sums_x86_64=(
  '616fd0851c81d57d2702bb56cfc6087a11c81b674d3e36ae618ff3fd51d48e90'
  '510c626dd845c7511b5c8e1980c86f99dfdc7b77d64064345d61b6354775eed0'
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
