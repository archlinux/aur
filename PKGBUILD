# Maintainer: Kppqju77 <ju.adde-gmail-com>
# Contributor: Muflone

pkgname=android-google-apis-x86-64-system-image-29
_apilevel=29
_arch=x86_64
pkgver=r12
pkgrel=2
pkgdesc="Android with Google APIs ${_arch} Atom System Image, API-${_apilevel}"
arch=('any')
url='https://software.intel.com/en-us/android/tools'
license=('custom')
provides=("${pkgname}")
conflicts=("${pkgname}")
options=('!strip')
source=("http://dl.google.com/android/repository/sys-img/google_apis/${_arch}-${_apilevel}_${pkgver}.zip"
        "package.xml")
sha256sums=('c0068e6dfd2833ca8a9704242bfe6087cee153373fa576b63461b3eecd27666f'
            '08409401c76ab9eb67fdfd60070adddae417eabcf8a708df704adb0a3bef62b3')

prepare() {
  # Fix permissions
  cd "${_arch}"
  find . -type f -print0 | xargs --null chmod -R u=rw,go=r
  find . -type d -print0 | xargs --null chmod -R u=rwx,go=rx
}

package() {
  # Run dependencies
  depends=("android-platform-${_apilevel}")
  optdepends=('qemu' 'libvirt')
  # Install files
  install -d -m 755 "${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/google_apis"
  cp -r "${_arch}" "${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/google_apis/"
  # Install license
  install -D -m 644 "package.xml" "${pkgdir}/usr/share/licenses/${pkgname}/package.xml"
  ln -s "/usr/share/licenses/${pkgname}/package.xml" \
    "${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/google_apis/${_arch}/"
}
