# Maintainer: Marc Plano-Lesay <marc.planolesay@gmail.com>
# Contributor: Muflone http://www.muflone.com/contacts/english/

_apilevel=28
_sdkShortVer=10
_sdkver="${_sdkShortVer}.0.0"
_rev='r09'
pkgname="android-google-apis-playstore-x86-system-image-${_apilevel}"
pkgver="${_apilevel}_${_sdkver}_${_rev}"
pkgrel=1
pkgdesc="Android with Google APIs and Play Store x86 Atom System Image, API ${_apilevel}"
arch=('any')
url='https://software.intel.com/en-us/android/tools'
license=('custom')
depends=("android-platform-${_apilevel}")
optdepends=('qemu' 'libvirt')
provides=("${pkgname}-${pkgver/_*/}")
conflicts=("${pkgname}-${pkgver/_*/}")
options=('!strip')
source=("http://dl.google.com/android/repository/sys-img/google_apis_playstore/x86-${_apilevel}_${_rev}.zip"
        "package.xml")
sha256sums=('0ee38d916d57c12442e0fde319d254641124164661fad11f33c3aa59c7f3a82d'
            '2ac85d768d6b20576d5cf0e927d61673c6e0638f0f5fc65a195a6e7f813c5469')

prepare() {
  # Fix permissions
  cd 'x86'
  find . -type f -print0 | xargs --null chmod -R u=rw,go=r
  find . -type d -print0 | xargs --null chmod -R u=rwx,go=rx
}

package() {
  # Install files
  install -d -m 755 "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/google_apis_playstore"
  cp -r 'x86' "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/google_apis_playstore/"
  # Install license
  install -D -m 644 "package.xml" "${pkgdir}/usr/share/licenses/${pkgname}/package.xml"
  ln -s "/usr/share/licenses/${pkgname}/package.xml" \
    "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/google_apis_playstore/x86/"
}
