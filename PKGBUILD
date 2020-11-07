# Maintainer: Kppqju77 <ju.adde-gmail-com>
# Contributor: Muflone

pkgname=android-google-apis-x86-64-system-image-29
_apilevel=29
_arch=x86_64
pkgver=r11
pkgrel=1
pkgdesc="Android with Google APIs ${_arch} Atom System Image, API-${_apilevel}"
arch=('any')
url='https://software.intel.com/en-us/android/tools'
license=('custom')
provides=("${pkgname}")
conflicts=("${pkgname}")
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/sys-img/google_apis/${_arch}-${_apilevel}_${pkgver}.zip"
        "package.xml")
sha256sums=('5029360d33a33baba23b0f224abf42e951a5d3596eccf4ef212c11236362d223'
            '6962710637ef177de9fb9a5f311a4d595d4cd402bba96e3fee9b44030feaa73b')

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
