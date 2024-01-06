# Maintainer: Brijesh8291 <brijeshsundi@gmail.com>

# NOTE: '-bin' suffix not applied as per Arch Nonfree Applications Package
#       Guidelines (as there will never be a source release)
pkgname=rtt-rstudio
# INFO: Upstream Binary Release Date: 2022-OCT-18
pkgver=6.3.191253
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
  'qt4'
)
provides=('r-studio-for-linux-bin')
conflicts=('r-studio-for-linux-bin')
source=("${pkgname}-eula-PopupEulaDRC-R-Studio-For-Linux.html::https://www.r-studio.com/includes/eula/PopupEulaDRC.shtml?R-Studio-for-Linux",
  "${pkgname}-Free-Linux-Recovery-Manual.pdf::https://www.r-studio.com/downloads/Free_Linux_Recovery_Manual.pdf"
)
source_x86_64=("https://www.r-studio.com/downloads/RStudio5_x64.rpm")
source_i686=("https://www.r-studio.com/downloads/RStudio5_i386.rpm")
sha512sums=('SKIP'
'c567249d385e6fbaf548bd79d0523cafd6b13d404d3be139ffa4925437f135aa0ac027d48d734186466116f395a84e831f088667acf13207947ebfe97e890f5a')
sha512sums_x86_64=('476931b9ffe29a28b7c1387660c266c8b88a1d88708954b09882a7eda5a3972d0735eab45852b8c17a78143410c81a8d9f2c06e83d37815ea8878264143e4dfb')
sha512sums_i686=('6da449e4e2a6954152b2abe14fbe99e889e87be182d1fe52f866c9fed42133788af38e40ca86520f3cf24bb3b618dc43dfedb3e0e12437c07bab344c975aeaac')

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
  install -D -m644 "${srcdir}/${pkgname}-eula-PopupEulaDRC-R-Studio-For-Linux.html" "${pkgdir}/usr/share/licenses/${pkgname}/${pkgname}-eula-PopupEulaDRC-R-Studio-For-Linux.html"

  # install usage / recovery manual
  install -D -m644 "${srcdir}/${pkgname}-Free-Linux-Recovery-Manual.pdf" "${pkgdir}/usr/share/doc/${pkgname}/${pkgname}-Free-Linux-Recovery-Manual.pdf"
}
