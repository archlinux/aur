# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Contributor: Torge Matthies <openglfreak at googlemail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgbase=linux-fsync-nobara-bin
pkgname=${pkgbase}
pkgver=6.6.14
pkgrel=1
build_id=6971962
fedora=39
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

sha256sums=('ef5aee3d52c0cf546b4a41fbb2995f3fb2040a07b98bfe93eb2b10606f964d73'
            '060e26eaaf8f97695f1f758a36c83599850d70e637bc74bba22f661ebeb8424a'
            'ca2c3a7d67227178dc95abfc19e3e5a04c2486b65419b7410d7bdffdf510b00e'
            'd8348be0a99fc00b09552f4ab879b1634b1032fe529359a84039de9ecc542f74'
            '7d74d00e5c9bf1030344f68a3c92032a0c98fd29e0be20bf3e54d133dbb8a041'
            '8f33ae4f3f248d0d9a651157403043c5d64eaf8bf5cecf10ac66a4a7d1409185')

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
