# Maintainer: nezu <nezu@nezu.cc>
# Contributor: Muflone http://www.muflone.com/contacts/english/
_pkgname=android-google-apis-playstore-x86-64-system-image
_apilevel=33
pkgname="${_pkgname}-${_apilevel}"
pkgver="${_apilevel}_r07"
pkgrel=1
pkgdesc="Android with Google APIs and Play Store x86_64 Atom System Image, API ${_apilevel}"
arch=('any')
url='https://developer.android.com/studio/index.html'
license=('custom')
depends=("android-platform-${_apilevel}")
optdepends=('qemu' 'libvirt')
provides=("${_pkgname}-${pkgver/_*/}")
conflicts=("${_pkgname}-${pkgver/_*/}")
options=('!strip')
source=("${_pkgname}-${pkgver}.zip::http://dl.google.com/android/repository/sys-img/google_apis_playstore/x86_64-${pkgver}.zip"
        "package.xml")
sha256sums=('74b0a57c2cfee755dcf7645e5da9d5468a2982af0bf012dfb46f661bc8b9f84a'
            'f9e506475a22eed319e187dd908da12ea75a0694476e0401bab3a63dd891a1ef')

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
