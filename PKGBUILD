# Maintainer: Stephano Cetola <stephanoc@gmail.com>

pkgbase=linux-mnt-reform-bin
pkgname=('linux-mnt-reform-bin' 'linux-mnt-reform-bin-headers')
pkgver=6.19.11
pkgrel=1
_kernver="${pkgver}-mnt-reform"
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
  "kernel-${pkgver}-${pkgrel}-mnt-aarch64.tar.gz::https://github.com/cetola/mnt-build/releases/download/${pkgver}-${pkgrel}-mnt-reform/kernel-${pkgver}-${pkgrel}-mnt.tar.gz"
  "headers-${pkgver}-${pkgrel}-mnt-aarch64.tar.gz::https://github.com/cetola/mnt-build/releases/download/${pkgver}-${pkgrel}-mnt-reform/headers-${pkgver}-${pkgrel}-mnt.tar.gz"
)
source_x86_64=(
  "kernel-${pkgver}-${pkgrel}-mnt-x86_64.tar.gz::https://github.com/cetola/mnt-build/releases/download/${pkgver}-${pkgrel}-mnt-reform-x86_64/kernel-${pkgver}-${pkgrel}-mnt.tar.gz"
  "headers-${pkgver}-${pkgrel}-mnt-x86_64.tar.gz::https://github.com/cetola/mnt-build/releases/download/${pkgver}-${pkgrel}-mnt-reform-x86_64/headers-${pkgver}-${pkgrel}-mnt.tar.gz"
)
sha256sums=(
  '8a15cec00fc571b7b62dba4ad9aa7b0132fe837dca3a424828bb19a37f5d3e58'
  '24e36fc74f7aa27fe699e5eac923c14ae80c7bc85038cfab3d8cd93148d7cb3e'
  'a53ac0ff7d5f8d5ab07e21dd09a1e94a36e10cdad0d5a1b853b0c04dc4018481'
)
sha256sums_aarch64=(
  '782549a63d212c499c11ce32b0bcdb57c1a59019db2d75055fa9c667a1579e99'
  '54a7c7d82c977c64e9afce309467ee32f56f6d393085dce042a5fcc27728076a'
)
sha256sums_x86_64=(
  '5dd331a4593a1bad83d13986a309c2ee24bce109936ca6c613fe1aa55dc62ee9'
  '594dba8fe8b4a084464b976d4b7c56d363fd5cb94d02fe4b9abc5b145b99122f'
)

build() {
  :
}

package_linux-mnt-reform-bin() {
  pkgdesc="Linux kernel for MNT Reform (${CARCH})"
  depends=('coreutils' 'dracut' 'kmod' 'cpio')
  optdepends=('linux-mnt-reform-bin-headers: for building modules')
  provides=("linux=${pkgver}")
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
  provides=("linux-headers=${pkgver}")
  conflicts=('linux-mnt-reform-headers')

  cd "$srcdir/linux-${pkgver}"

  install -dm755 "$pkgdir/usr/lib/modules/${_kernver}/build"
  echo 'Installing pre-prepared kernel headers...'
  cp -a . "$pkgdir/usr/lib/modules/${_kernver}/build"
}
