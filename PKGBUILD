# Maintainer: Mark Collins <tera_1225 hat hotmail doat com>
pkgname=adb-arm-bin
pkgver=1.0.41
_deb_ver="10.0.0+r36"
pkgrel=1
pkgdesc="Android debug bridge (adb) binary (from debian package)"
arch=('armv7h')
_deb_arch='armhf'
_deb_dist_version='sid' # Unstable, matches arch's rolling release model
url="https://packages.debian.org/${_deb_dist_version}/adb"
license=('GPL')
_deb_mirror="ftp.de.debian.org"
provides=("adb")
depends=("android-udev")
makedepends=("binutils") # provides "ar" utility to extract .deb
source=(
  "http://${_deb_mirror}/debian/pool/main/a/android-platform-external-boringssl/android-libboringssl_${_deb_ver}-1_${_deb_arch}.deb"
  "http://${_deb_mirror}/debian/pool/main/a/android-platform-system-core/adb_${_deb_ver}-7_${_deb_arch}.deb"
  "http://${_deb_mirror}/debian/pool/main/a/android-platform-system-core/android-libadb_${_deb_ver}-7_${_deb_arch}.deb"
  "http://${_deb_mirror}/debian/pool/main/a/android-platform-system-core/android-libbase_${_deb_ver}-7_${_deb_arch}.deb"
  "http://${_deb_mirror}/debian/pool/main/a/android-platform-system-core/android-libcrypto-utils_${_deb_ver}-7_${_deb_arch}.deb"
  "http://${_deb_mirror}/debian/pool/main/a/android-platform-system-core/android-libcutils_${_deb_ver}-7_${_deb_arch}.deb"
  "http://${_deb_mirror}/debian/pool/main/a/android-platform-system-core/android-liblog_${_deb_ver}-7_${_deb_arch}.deb"
  "http://${_deb_mirror}/debian/pool/main/a/android-sdk-meta/android-sdk-platform-tools-common_28.0.2+3_all.deb"
  )
noextract=(
  "adb_${_deb_ver}-7_${_deb_arch}.deb"
  "android-libadb_${_deb_ver}-7_${_deb_arch}.deb"
  "android-libbase_${_deb_ver}-7_${_deb_arch}.deb"
  "android-libboringssl_${_deb_ver}-1_${_deb_arch}.deb"
  "android-libcrypto-utils_${_deb_ver}-7_${_deb_arch}.deb"
  "android-libcutils_${_deb_ver}-7_${_deb_arch}.deb"
  "android-liblog_${_deb_ver}-7_${_deb_arch}.deb"
  "android-sdk-platform-tools-common_28.0.2+3_all.deb")
md5sums=('853680b70dca8fb274832ffc27b2b757'
         '37c938a48e1aba223c01cb8db0a66da2'
         '752ac11d4ccbd3e68dc8a4d09e788c1e'
         '47a62ffe8a818a2f0bf16ec86924ebed'
         'b82dd6a3f10e93b5daf508fcf2413ddb'
         '953c51e0fac01958676909f5a9929de8'
         '7fdbe4830a1c8b15373103170810077f'
         '4361d3e9704510b3e9b4345517f232a8')

prepare() {
  for src in "${noextract[@]}"; do
    # This will extract the source .deb file to a folder of same
    # name without the .deb at the end
    # It is necessary to do this because, although makepkg will
    # happily handle .deb files, all contents share same name and
    # overwrite each other…
    mkdir "${srcdir}/${src%.deb}"
    cd "${srcdir}/${src%.deb}" || exit 10
    ar -x "../$src"
  done
}

package() {
  for package_source in "${source[@]}"; do
    package="${package_source##*/}"
    cd "${srcdir}/${package%.deb}" || exit 10
    tar xf data.tar.xz -C "${pkgdir}"
  done
  # We can't install to "lib" in Arch, only "usr/lib"
  # However, here "lib" only contains udev rules, and the necessary
  # udev rules are provided by the "android-udev" dependency, so we can
  # just delete the folder:
  rm -R "$pkgdir/lib"
}
