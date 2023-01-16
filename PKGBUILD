# Maintainer: vladislemon <vladislemon@gmail.com>
# Contributor: Kppqju77 <ju.adde-gmail-com>

pkgname=android-google-apis-playstore-x86-64-system-image-31
_apilevel=31
_arch=x86_64
pkgver=r09
pkgrel=1
pkgdesc="Android with Google APIs and Play Store ${_arch} Atom System Image, API-${_apilevel}"
arch=('any')
url='https://software.intel.com/en-us/android/tools'
license=('custom')
provides=("${pkgname}")
conflicts=("${pkgname}")
options=('!strip')
source=("http://dl.google.com/android/repository/sys-img/google_apis_playstore/${_arch}-${_apilevel}_${pkgver}.zip"
        "package.xml")
sha256sums=('6e809f8541408c98039e27737fbd25056ae25d0c89e105d6b983ac3340a67e44'
            '3c9ef588682a2cb0f13f9b59e946c5e809e2f3ee0f9fa664200994526ecf2369')

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
  install -d -m 755 "${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/google_apis_playstore"
  cp -r "${_arch}" "${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/google_apis_playstore/"
  # Install license
  install -D -m 644 "package.xml" "${pkgdir}/usr/share/licenses/${pkgname}/package.xml"
  ln -s "/usr/share/licenses/${pkgname}/package.xml" \
    "${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/google_apis_playstore/${_arch}/"
}
