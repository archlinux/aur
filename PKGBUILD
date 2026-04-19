# Maintainer: Stephano Cetola <stephano@cetola.net>

pkgbase=linux-mnt-reform-bin
pkgname=('linux-mnt-reform-bin' 'linux-mnt-reform-bin-headers')
pkgver=6.19.13.reform1
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
  '04af022e3b7b8ed590b99de3a700aeaddfc523e5adf7af4c395d2e6c6902ac8c'
  '24e36fc74f7aa27fe699e5eac923c14ae80c7bc85038cfab3d8cd93148d7cb3e'
  '7cc82511b3b40557f3813807d5c7d045366255c1af633e7e7dff629e719aeff3'
)
sha256sums_aarch64=(
  'fb89bce403f759e0d4b5c30f6fc0b894f4c4dc6f8b2749d094ae74159e1692f7'
  'c9de6f09bda9dbff457b20564e211758aa23ed8ca87ccb91348f74d43a016344'
)
sha256sums_x86_64=(
  'f98a1510182cf7582efaa03251a2ca6d7887abda410647165a8cedcb71c2727e'
  'bd7ab55d87b1de13a93f9cd1dcbbe4b87a187528648fe2a481887de513552947'
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
