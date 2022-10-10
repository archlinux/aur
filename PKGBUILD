# Maintainer: Cynthetika <opensourceATcynthetikaDOTcom>

# NOTE: '-bin' suffix not applied as per Arch Nonfree Applications Package
#       Guidelines (as there will never be a source release)
pkgname=rtt-rstudio
# INFO: Upstream Binary Release Date: 2022-SEP-07
pkgver=5.1.191044
pkgrel=1
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
url="https://www.r-studio.com/data_recovery_linux/"
license=('custom')
depends=(
  'xdg-utils'
  'polkit'
)
provides=('r-studio-for-linux-bin')
conflicts=('r-studio-for-linux-bin')
source=(
  "${pkgname}-eula.html"
  "${pkgname}-usage-recovery-manual.pdf::https://www.r-studio.com/downloads/Linux_Recovery_Manual.pdf"
)
source_x86_64=("https://www.r-studio.com/downloads/RStudio5_x64.rpm")
source_i686=("https://www.r-studio.com/downloads/RStudio5_i386.rpm")
sha512sums=('1bc63c247ee4bc210b435ea68fd06b9194e2c9c074a2d7fb3bcaef5f2930a2faba554e27785ca3b14c47bc42b5beb4ae42e2cf088ce92cb0fa846213412bccc2'
            'ab9b4e51fa97e03330ae773f13ed26a8b5c4b18386b3686a9b2296207237d85eed5051be491ce8712a7266098df00544e1ec31e0a1cc0498b8949e1e8aa870c1')
sha512sums_x86_64=('699d467e9ec3c94d64d739712b9734eedca8711462f4926acb6aed3f98fe7c9e209efc8d09c888d772e06144d634cee35a73bb7e297e951e587b8488c92550d2')
sha512sums_i686=('58f4b599f40f1be7bb14cef032f3ca4913e0ad705b0d103b84ad1bc3b9b3a5c053a2e624b1e7b9872c0e203207ce35ca6b60e1634c3c9a52a8fbf5ac5a098ef4')

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

  # install usage / recovery manual
  install -D -m644 "${srcdir}/${pkgname}-usage-recovery-manual.pdf" "${pkgdir}/usr/share/doc/${pkgname}/${pkgname}-usage-recovery-manual.pdf"
}
