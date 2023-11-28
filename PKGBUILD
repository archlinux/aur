# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Contributor: Torge Matthies <openglfreak at googlemail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgbase=linux-fsync-nobara-bin
pkgname=${pkgbase}
pkgver=6.6.2
pkgrel=1
build_id=6701806
fedora=39
extras=202.fsync.fc${fedora}
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

sha256sums=('543711979a00304140b0fb28da137031fad964c7efa80baad74a5cdb5f806266'
            'f991f1df3e060e51c9da64c1b52f031c4de316d9288376d3167359651b3807ec'
            '81a47aeb12eaf438e2a0797eaa86e5b3bf83d8a3fe48483166561f2371d5e499'
            '60367a2eb3430a7f7814c6678b536793d83801d5a1f0d49f233729997223b436'
            '656a714a8c532a909218c60e98879a7af56a8c50b6d7e5305bbb425ac0b646b1'
            'd92641ad5353c1b8b6b969675b034e49c08a9bb18b86633c95e6a46727a00e9a')

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
