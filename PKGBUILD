# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Contributor: Torge Matthies <openglfreak at googlemail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgbase=linux-fsync-nobara-bin
pkgname=${pkgbase}
pkgver=6.3.9
pkgrel=1
build_id=6119637
fedora=38
extras=201.fsync.fc${fedora}
printf -v l_build_id %08d%s ${build_id}
pkgdesc='The Linux kernel and modules of Nobara Project - Prebuilt version'
url="https://nobaraproject.org"
arch=(x86_64)
license=(GPL2)
options=('!strip')
depends=(coreutils kmod initramfs)
optdepends=('crda: to set the correct wireless channels of your country'
            'linux-firmware: firmware images needed for some devices')
provides=(VIRTUALBOX-GUEST-MODULES
          WIREGUARD-MODULE
          KSMBD-MODULE
          NTFS3-MODULE)
source=("https://download.copr.fedorainfracloud.org/results/sentry/kernel-fsync/fedora-${fedora}-x86_64/${l_build_id}-kernel/kernel-core-${pkgver}-${extras}.x86_64.rpm"
        "https://download.copr.fedorainfracloud.org/results/sentry/kernel-fsync/fedora-${fedora}-x86_64/${l_build_id}-kernel/kernel-modules-${pkgver}-${extras}.x86_64.rpm"
        "https://download.copr.fedorainfracloud.org/results/sentry/kernel-fsync/fedora-${fedora}-x86_64/${l_build_id}-kernel/kernel-modules-core-${pkgver}-${extras}.x86_64.rpm"
        "https://download.copr.fedorainfracloud.org/results/sentry/kernel-fsync/fedora-${fedora}-x86_64/${l_build_id}-kernel/kernel-modules-extra-${pkgver}-${extras}.x86_64.rpm"
        "https://download.copr.fedorainfracloud.org/results/sentry/kernel-fsync/fedora-${fedora}-x86_64/${l_build_id}-kernel/kernel-modules-internal-${pkgver}-${extras}.x86_64.rpm"
        "https://download.copr.fedorainfracloud.org/results/sentry/kernel-fsync/fedora-${fedora}-x86_64/${l_build_id}-kernel/kernel-devel-${pkgver}-${extras}.x86_64.rpm")
#        "https://download.copr.fedorainfracloud.org/results/sentry/kernel-fsync/fedora-${fedora}-x86_64/${l_build_id}-kernel/kernel-uki-virt-${pkgver}-${extras}.x86_64.rpm")
validpgpkeys=(
    'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linux Torvalds
    '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
)

sha256sums=('8ea182858cfec1d24e8f5a18a000ca78b1fae1281f49da07a09406152fbbda21'
            '49e7e60c44ec3e51486cae25153430ede65fd3cd70c44d0edb656cfdb2feeb1c'
            'b1e06fc21e48c9b3126bcc338d567e6724d76a26b3a142a5f99324d64f9eb7d8'
            '7eaa4dc9a65c4d9a2807e2e32e4633f368a5e1cf1f3876094ca3542dda703b1e'
            '2c9cd5c715bd75e30551e27a04c6b78ec50eec14836f7262b5fb84f6e66fb8a0'
            '240d486e6e6792e312dccc01e1336b253e88e813d7f9da63f09809101c894a9f')

package() {

  local srcmodulesdir=$(ls -d ${srcdir}/lib/modules/${pkgver}*)
  local kernver="${srcmodulesdir#${srcdir}/lib/modules/}"
  local modulesdir="${pkgdir}/usr/lib/modules/${kernver}"
  mkdir -p "${modulesdir}"

  msg2 "Installing modules..."
  cp -r ${srcmodulesdir} "${pkgdir}/usr/lib/modules"
  cp -r "${srcdir}/usr" "${pkgdir}/"

  #msg2 "Installing boot image..."
  #install -Dm644 "$modulesdir/vmlinuz" "boot/vmlinuz-${pkgver}-fsync-nobara"

  # Used by dmks
  mv "${pkgdir}"/usr/src/kernels/* "${pkgdir}"/usr/src/
  rmdir "${pkgdir}"/usr/src/kernels
  cd "${pkgdir}"/usr/lib/modules/${pkgver}-${extras}.x86_64
  ln -sf /usr/src/${pkgver}-${extras}.x86_64 build

  # Perms
  chmod 644 "${pkgdir}"/usr/lib/modules/${pkgver}-${extras}.x86_64/vmlinuz

  # Used by mkinitcpio to name the kernel
  echo "${pkgname}" | install -Dm644 /dev/stdin "${modulesdir}/pkgbase"

}

# vim:set ts=8 sts=2 sw=2 et:
