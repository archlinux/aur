# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Maintainer: Kppqju77 <ju.adde-gmail-com>

_arch=x86
pkgname=android-google-apis-${_arch/_/-}-system-image
pkgver=30_r12
pkgrel=2
pkgdesc="Android with Google APIs ${_arch} Atom System Image, latest API (No release of x86 image since API 30, you might want to use the updated x86_64 image instead)"
arch=('any')
url='https://software.intel.com/en-us/android/tools'
license=('custom')
provides=("${pkgname}-${pkgver/_*/}")
conflicts=("${pkgname}-${pkgver/_*/}")
options=('!strip')
source=("https://dl.google.com/android/repository/sys-img/google_apis/${_arch}-${pkgver}.zip"
        "package.xml")
sha512sums=('620dd369eeddb09df85e0ae9a853b304be7ac50349bb658257ab871f05d6d28a3b3dd4be6ad3294dfa92f654c4db8ff8c394dc0b6efe98bda0f145cfe28e7c4a'
            '67fbf4e44b047a290664a35ca55785087dd4383f0153d2c5213936a6b817b866dcb030c91da0a204c4e7120c457f930b84ec9ea0893b7f8b2abcaec60f056ea6')

prepare() {
  # Fix permissions
  cd "${_arch}"
  find . -type f -print0 | xargs --null chmod -R u=rw,go=r
  find . -type d -print0 | xargs --null chmod -R u=rwx,go=rx
}

package() {
  depends=("android-platform-${pkgver/_*/}")
  optdepends=('qemu' 'libvirt')

  # Install files
  install -d -m 755 "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/google_apis"
  cp -r "${_arch}" "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/google_apis/"
  # Install license
  install -D -m 644 "package.xml" "${pkgdir}/usr/share/licenses/${pkgname}/package.xml"
  ln -s "/usr/share/licenses/${pkgname}/package.xml" \
    "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/google_apis/${_arch}/"
}
