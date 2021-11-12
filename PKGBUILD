# Maintainer: Kppqju77 <ju.adde-gmail-com>
# Contributor: Muflone

_apilevel=29
_arch=x86
pkgname=android-google-apis-${_arch/_/-}-system-image-${_apilevel}
pkgver=r12
pkgrel=2
pkgdesc="Android with Google APIs ${_arch} Atom System Image, API-${_apilevel}"
arch=('any')
url='https://software.intel.com/en-us/android/tools'
license=('custom')
provides=("${pkgname}")
conflicts=("${pkgname}")
options=('!strip')
source=("https://dl.google.com/android/repository/sys-img/google_apis/${_arch}-${_apilevel}_${pkgver}.zip"
        "package.xml")
sha256sums=('17586494ca2494e57f50b775858acc46ff08fa16becfa8423831fbd27e3d86f8'
            'fbc9b3f7494950b1c4e31bb18893e24be1f805bb929ff94b4eb43bae5b6cbc84')

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
