# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Contributor: Torge Matthies <openglfreak at googlemail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgbase=linux-fsync-nobara-bin
pkgname=${pkgbase}
pkgver=6.17.11
pkgrel=1
build_id=9883013
fedora=43
extras=200.nobara.fc${fedora}
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
source=("https://download.copr.fedorainfracloud.org/results/gloriouseggroll/nobara-${fedora}/fedora-${fedora}-x86_64/${l_build_id}-kernel/kernel-core-${pkgver}-${extras}.x86_64.rpm"
        "https://download.copr.fedorainfracloud.org/results/gloriouseggroll/nobara-${fedora}/fedora-${fedora}-x86_64/${l_build_id}-kernel/kernel-modules-${pkgver}-${extras}.x86_64.rpm"
        "https://download.copr.fedorainfracloud.org/results/gloriouseggroll/nobara-${fedora}/fedora-${fedora}-x86_64/${l_build_id}-kernel/kernel-devel-${pkgver}-${extras}.x86_64.rpm")
validpgpkeys=(
    'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linux Torvalds
    '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
)

sha256sums=('605b2a3fa4843022f3e327db7fc3a6a793c4ee741bfda5dbba2566c8056b9f45'
            'f90bcf78eb41f1b0bb605f4c55c3bd7f2f22d00f042853f2c11d92bcdb73a7d9'
            '0f9633abc1e14d903e13dd527facfc6575b9597582f6d25d18823192055d10b2')

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
