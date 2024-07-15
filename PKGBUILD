# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Contributor: Torge Matthies <openglfreak at googlemail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgbase=linux-fsync-nobara-bin
pkgname=${pkgbase}
pkgver=6.9.8
pkgrel=3
build_id=7732347
fedora=40
extras=204.fsync.fc${fedora}
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

sha256sums=('01c614415dd75c5afba882d82529107f4ffc32aa82ef2f8a20dd982716872bf3'
            '40a411b869a319d6bb1897019471e33bec6a88d0a83c80792d1f5cd43328573e'
            'ee77896a8e315e706e25b22aa3e1d35cda21bf4a644a4bc0d9874be7dc3454b7'
            'f2dd94929b86fdc7ecd7cf6e9596fd6fa445366d676c41ab2b900d61cbaeab6b'
            '734ce3596964297eab5f4444bedbc8c35763793627c174cedf1964fc1f535a7a'
            '65eca31c9e6154c0c5088d67dea613e72ac74b7c417f574bb640ff8053317b11')

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
  rm -fv "${pkgdir}"/usr/lib/modules/${pkgver}-${extras}.x86_64/build
  mv -v "${pkgdir}"/usr/src/kernels/${pkgver}-${extras}.x86_64 "${pkgdir}"/usr/lib/modules/${pkgver}-${extras}.x86_64/build
  rmdir -v "${pkgdir}"/usr/src/kernels
  cd "${pkgdir}"/usr/lib/modules/${pkgver}-${extras}.x86_64
  ln -sr "${pkgdir}"/usr/lib/modules/${pkgver}-${extras}.x86_64/build "$pkgdir/usr/src/$pkgbase"

  # Perms
  chmod 644 "${pkgdir}"/usr/lib/modules/${pkgver}-${extras}.x86_64/vmlinuz

  # Used by mkinitcpio to name the kernel
  echo "${pkgname}" | install -Dm644 /dev/stdin "${modulesdir}/pkgbase"

}

# vim:set ts=8 sts=2 sw=2 et:
