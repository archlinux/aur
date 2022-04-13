# Maintainer: Cynthetika <opensource AT cynthetika DOT com>
pkgname=android-image-kitchen-bin
pkgver=3.8
pkgrel=3
pkgdesc="Automated scripts to inspect and rebuild Android boot images - including patched binaries only used by the scripts provided by this package"
## for further details and discussion, see also:
## https://forum.xda-developers.com/t/tool-android-image-kitchen-unpack-repack-kernel-ramdisk-win-android-linux-mac.2073775/
url="https://github.com/osm0sis/Android-Image-Kitchen/tree/AIK-Linux"
arch=('i686' 'x86_64')
license=('unknown')
source=("AIK-Linux-v3.8-ALL.tar.gz::https://forum.xda-developers.com/attachments/aik-linux-v3-8-all-tar-gz.5300923/"
        "work-in-present-working-directory-only.patch")
md5sums=('36eb592b1dbef0c6c4bb96cd6e6524a6'
         '670b25e7bb925a80091349c62794abae')
options=(!strip)

prepare() {
  cd "${srcdir}/AIK-Linux"

  # apply patch to only operate on files within present working directory
  patch -p1 < ${srcdir}/work-in-present-working-directory-only.patch
}

package() {
  cd "${srcdir}/AIK-Linux"

  # remove files not required on any Linux platform
  rm "authors.txt"
  rm -rf "bin/macos"

  # install all files to /opt
  cd "${srcdir}"
  mkdir -p "${pkgdir}/opt"
  cp -r "AIK-Linux" "${pkgdir}/opt/${pkgname%-bin}"

  # symlink main scripts to /usr/bin
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname%-bin}/cleanup.sh"   "${pkgdir}/usr/bin/aik-cleanup"
  ln -s "/opt/${pkgname%-bin}/repackimg.sh" "${pkgdir}/usr/bin/aik-repack"
  ln -s "/opt/${pkgname%-bin}/unpackimg.sh" "${pkgdir}/usr/bin/aik-unpack"
}
