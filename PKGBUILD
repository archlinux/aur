# Maintainer: Stephano Cetola <stephano@cetola.net>

pkgbase=linux-mnt-reform-bin
pkgname=('linux-mnt-reform-bin' 'linux-mnt-reform-bin-headers')
pkgver=7.0.9.reform1
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
  '2466aa6f355eb6c9008f2124e1ffcd414906e7825e273025e9dc7a99abb725c3'
  '24e36fc74f7aa27fe699e5eac923c14ae80c7bc85038cfab3d8cd93148d7cb3e'
  '18268c761b155d772c8d79f3f2f012b54783ce6dc565b5a9a1d3e3255885b6ee'
)
sha256sums_aarch64=(
  'f01d430e689a6b6e6bd0812bf73ad721c5457cdf332949a6ad72e606f0242223'
  '9a6efe1f668817827cb3da021b1774832497289890a618563f72124bc854c6a8'
)
sha256sums_x86_64=(
  'a586db02603ad8679a7b1ca48f859407af7b04a62df0d921a4e029f924776c1f'
  '687d35d9e8e7a5709b3fa6d715db6ed75478bb89752b3bfe1aac7cf3c6d704d8'
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
