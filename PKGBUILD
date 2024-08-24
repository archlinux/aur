# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Maintainer: Kppqju77 <ju.adde-gmail-com>

_arch=x86
pkgname=android-google-apis-${_arch/_/-}-system-image
pkgver=30_r16
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
sha512sums=('3859baad67f5385efbe07950e97bbf2f9dd6a013baaa1d27704555b05866799ff088bfb412146b5710b55a0a045b15b6b910fd813bf66005ac1bfea69463ec53'
            '38050a05db4e0a025cc32df8db1a9e05396057b535c640f8070648b9ddf4d5d513e255901a4b3c0a3c71fe8017e06780b1227740abcf4cdb90d4c63a1c52b76f')

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
