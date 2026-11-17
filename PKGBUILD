# Maintainer: Stephano Cetola <stephano@cetola.net>

pkgbase=linux-mnt-reform-bin
pkgname=('linux-mnt-reform-bin' 'linux-mnt-reform-bin-headers')
pkgver=7.3.5.reform1
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
  '19f4c4f1606daa548e5b8b9f007f76f11b57a205f6fb8217540858eafe132ee7'
  'b083739e895add58eb17ef405347286b8e6ffc1e8f4b21550174fe0e8c4ff98c'
  '24e36fc74f7aa27fe699e5eac923c14ae80c7bc85038cfab3d8cd93148d7cb3e'
  '97f8b4201b05226c6e34cbb90961087f84f504922e8d1bb955634d1ad2245d51'
)
sha256sums_aarch64=(
  '7b4678f0f9279270dc9262ad5212973d4741478c4e221b4ebead73cf08bb3d24'
  'cf349e29c12fe6412b55ff79b419bf1f722a53b2740dc40d728ed50eca17b259'
)
sha256sums_x86_64=(
  '418063eb161f06d39cdef1c7eeda5a146a4167da68f06f130b2ab385db79c67b'
  '3e3cc2dff9e9e683b00db401799488a43ab312362f50080d98039ef69c9768c0'
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
