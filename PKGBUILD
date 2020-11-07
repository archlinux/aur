# Maintainer: Kppqju77 <ju.adde-gmail-com>
# Contributor: Muflone

_apilevel=29
_arch=x86
pkgname=android-google-apis-${_arch/_/-}-system-image-${_apilevel}
pkgver=r11
pkgrel=1
pkgdesc="Android with Google APIs ${_arch} Atom System Image, API-${_apilevel}"
arch=('any')
url='https://software.intel.com/en-us/android/tools'
license=('custom')
provides=("${pkgname}")
conflicts=("${pkgname}")
options=('!strip')
source=("https://dl-ssl.google.com/android/repository/sys-img/google_apis/${_arch}-${_apilevel}_${pkgver}.zip"
        "package.xml")
sha256sums=('39b403f266e6e47f2340a4d13871a7551efbee7855e1bdcc1eeb74b788a41914'
            'a32b6c4a4e1470d7117582cd02252a1b42a344c3f51a3ff6fc45f640cb0a672b')

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
