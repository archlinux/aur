# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Maintainer: Kppqju77 <ju.adde-gmail-com>

_arch=x86_64
pkgname=android-google-apis-${_arch/_/-}-system-image
pkgver=35_r08
pkgrel=1
pkgdesc="Android with Google APIs ${_arch} Atom System Image, latest API"
arch=('any')
url='https://software.intel.com/en-us/android/tools'
license=('LicenseRef-custom')
provides=("${pkgname}-${pkgver/_*/}")
conflicts=("${pkgname}-${pkgver/_*/}")
options=('!strip' '!debug')
source=("https://dl.google.com/android/repository/sys-img/google_apis/${_arch}-${pkgver}.zip"
        "package.xml")
sha256sums=('169462d23d0a89f1732c0e901bca8e7dd6619ee392d035f14e7abd8547261477'
            '1c5e2bcfedbacf48ef07778917fde38b62c0041217d1005e6587fdc1362aa40d')

prepare() {
  # Fix permissions
  cd "${_arch}"
  find . -type f -print0 | xargs --null chmod -R u=rw,go=r
  find . -type d -print0 | xargs --null chmod -R u=rwx,go=rx
}

package() {
  depends=('android-platform')
  optdepends=('qemu' 'libvirt')

  # Install files
  install -d -m 755 "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/google_apis"
  cp -r "${_arch}" "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/google_apis/"
  # Install license
  install -D -m 644 "package.xml" "${pkgdir}/usr/share/licenses/${pkgname}/package.xml"
  ln -s "/usr/share/licenses/${pkgname}/package.xml" \
    "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/google_apis/${_arch}/"
}
