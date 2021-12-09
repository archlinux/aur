# Maintainer: Kppqju77 <ju.adde-gmail-com>

pkgname=android-google-apis-x86-64-system-image-31
_apilevel=31
_arch=x86_64
pkgver=r08
pkgrel=1
pkgdesc="Android with Google APIs ${_arch} Atom System Image, API-${_apilevel}"
arch=('any')
url='https://software.intel.com/en-us/android/tools'
license=('custom')
provides=("${pkgname}")
conflicts=("${pkgname}")
options=('!strip')
source=("http://dl.google.com/android/repository/sys-img/google_apis/${_arch}-${_apilevel}_${pkgver}.zip"
        "package.xml")
sha256sums=('dd3c590a4776c9c9401d6e3bf53706c08c26ff16b7b14ba2ecaffbdc3e1ad3a4'
            'e070ba43b732a7f0089bdcafbed1bb955f76a4c9322fb34fddb7030571891444')

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
