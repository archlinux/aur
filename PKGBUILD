# Maintainer: Marc Plano-Lesay <marc.planolesay@gmail.com>
# Contributor: Muflone http://www.muflone.com/contacts/english/

_apilevel=29
_sdkShortVer=10
_sdkver="${_sdkShortVer}.0.0"
_rev='r08'
pkgname="android-google-apis-playstore-x86-64-system-image-${_apilevel}"
pkgver="${_apilevel}_${_sdkver}_${_rev}"
pkgrel=1
pkgdesc="Android with Google APIs and Play Store x86_64 Atom System Image, API ${_apilevel}"
arch=('any')
url='https://software.intel.com/en-us/android/tools'
license=('custom')
depends=("android-platform-${_apilevel}")
optdepends=('qemu' 'libvirt')
provides=("${pkgname}-${pkgver/_*/}")
conflicts=("${pkgname}-${pkgver/_*/}")
options=('!strip')
source=("http://dl.google.com/android/repository/sys-img/google_apis_playstore/x86_64-${_apilevel}_${_rev}-linux.zip"
        "package.xml")
sha256sums=('161340ce75aebca479c0073993e868c576d24293e23cf1c0c2a4091b896d3627'
            '252f22f70bedb8fd76ad5a9642ebdfb9fd72a159e42377f0dcde79a129e97649')

prepare() {
  # Fix permissions
  cd 'x86_64'
  find . -type f -print0 | xargs --null chmod -R u=rw,go=r
  find . -type d -print0 | xargs --null chmod -R u=rwx,go=rx
}

package() {
  # Install files
  install -d -m 755 "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/google_apis_playstore"
  cp -r 'x86_64' "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/google_apis_playstore/"
  # Install license
  install -D -m 644 "package.xml" "${pkgdir}/usr/share/licenses/${pkgname}/package.xml"
  ln -s "/usr/share/licenses/${pkgname}/package.xml" \
    "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/google_apis_playstore/x86_64/"
}
