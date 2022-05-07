# Maintainer: Cynthetika <opensourceATcynthetikaDOTcom>

# NOTE: '-bin' suffix not applied as per Arch Nonfree Applications Package
#       Guidelines (as there will never be a source release)
pkgname=rtt-rstudio
pkgver=5.0.5007
pkgrel=4
# INFO: Full publisher-provided description for reference:
#   R-Studio is a powerful cost-effective undelete and data recovery software utility.
#   Empowered by the new unique data recovery technologies, it is the most comprehensive
#   data recovery solution for recovery files from FAT/exFAT, NTFS/NTFS5 (created or updated
#   by Windows 2000 - 10), ReFS, HFS/HFS+/APFS (Macintosh), Little and Big Endian variants
#   of UFS1/UFS2 (FreeBSD/OpenBSD/NetBSD/Solaris) and Ext2FS/Ext3FS/Ext4FS (Linux). It
#   functions on local disks, even if such partitions are formatted, damaged or deleted.
#   Flexible parameter settings give you absolute control over data recovery.
pkgdesc="R-Studio is a powerful cost-effective undelete and data recovery software utility (non-free)."
arch=('x86_64' 'i686')
# INFO: for further reference, see: "https://www.r-studio.com/downloads/Linux_Recovery_Manual.pdf"
url="http://www.r-studio.com/data_recovery_linux/"
license=('custom')
depends=(
  'xdg-utils'
  'polkit'
)
provides=('r-studio-for-linux-bin')
conflicts=('r-studio-for-linux-bin')
source=("${pkgname}-eula.html::https://www.r-studio.com/includes/eula/PopupEulaDRC.shtml?R-Studio%20for%20Linux")
source_x86_64=("https://www.r-studio.com/downloads/RStudio5_x64.rpm")
source_i686=("https://www.r-studio.com/downloads/RStudio5_i386.rpm")
sha512sums=('fc35d65f69d850ccdbff1a7c87fa7745f609556d777266eec81349b885f4e24c3a5421c7df7979bf9e41dc3dc17a7861aa12575805084232118a5ffb40592545')
sha512sums_x86_64=('b08696f4c0fc6981a95b9c30b8ee096cd574701a1729b0e1042d3cd110c2a40330fa802b644661983aa491f3fd1e93a89b6b1687126868aa3384fc9e49d1d7eb')
sha512sums_i686=('47b9023def6ebf7154cae8366c8203a8dab766ae1567514b2ab629d66ec86b557578f99eb4a34b9bde9f5d2550d243e05265a157aecb16b79c75339e393356fa')

prepare() {
  cd "${srcdir}"

  # remove menu file (irrelevant to Arch Linux and friends)
  rm -rf "${srcdir}/usr/share"

  # remove error reporter (nobody likes a snitch; also - this is not a supported distribution)
  rm -f "${srcdir}/usr/local/R-Studio/bin/ErrorReport"

  # move publisher-provided XDG desktop file to root of source directory
  mv "${srcdir}/usr/local/R-Studio/share/${pkgname}.desktop" "${srcdir}/${pkgname}.desktop"

  # move file containing PolicyKit action definitions to root of source directory
  mv "${srcdir}/usr/local/R-Studio/share/com.r-tt.pkexec.rstudio.policy" "${srcdir}/com.r-tt.pkexec.rstudio.policy"
}

package() {
  cd "${srcdir}"

  # copy prepared binary files to intermediate packaging directory
  cp -ar "${srcdir}/usr" "${pkgdir}"

  # install publisher-provided XDG desktop file
  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # install PolicyKit action definitions
  install -D -m644 "${srcdir}/com.r-tt.pkexec.rstudio.policy" "${pkgdir}/usr/share/polkit-1/actions/com.r-tt.pkexec.rstudio.policy"

  # install copies of icons for XDG utilities in standard location
  for i in 16 24 32 48 64 256; do
    install -D -m644 "${pkgdir}/usr/local/R-Studio/share/logo_${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
  done

  # install end-user license agreement
  install -D -m644 "${srcdir}/${pkgname}-eula.html" "${pkgdir}/usr/share/licenses/${pkgname}/${pkgname}-eula.html"
}
