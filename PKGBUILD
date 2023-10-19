# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Maintainer: Kppqju77 <ju.adde-gmail-com>

_arch=x86_64
pkgname=android-google-apis-${_arch/_/-}-system-image
pkgver=34_r10
pkgrel=1
pkgdesc="Android with Google APIs ${_arch} Atom System Image, latest API"
arch=('any')
url='https://software.intel.com/en-us/android/tools'
license=('custom')
provides=("${pkgname}-${pkgver/_*/}")
conflicts=("${pkgname}-${pkgver/_*/}")
options=('!strip')
source=("https://dl.google.com/android/repository/sys-img/google_apis/${_arch}-${pkgver}.zip"
        "package.xml")
sha256sums=('f76ad89af36719490a6bfd114b269fce4e935f59e3393a85cac8eac8a4483d10'
            '99551f1fe2cefc3ebbbe2b0a2c67553c4e25cf81443c83aba766c63a454f94e7')

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
