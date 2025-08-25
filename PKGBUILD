# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Maintainer: Kppqju77 <ju.adde-gmail-com>

_arch=x86_64
pkgname=android-google-apis-${_arch/_/-}-system-image
pkgver=36_r07
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
sha256sums=('b1bb0769d0bed7698e61f203d7dc9bf6e7c37cd01a39d0d8788a11186bc78160'
            '1fd4bbdb451520d71263e08e72db6c5ed4f7ccccb7f40fe68ea1d710bc9d59c2')

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
