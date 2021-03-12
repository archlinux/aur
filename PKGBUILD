# Maintainer: Marc Plano-Lesay <marc.planolesay@gmail.com>

_apilevel=28
_sdkShortVer=9
_sdkver="${_sdkShortVer}.0.0"
_rev='r05'
pkgname="android-wear-x86-system-image-${_apilevel}"
pkgver="${_apilevel}_${_sdkver}_${_rev}"
pkgrel=3
pkgdesc="Wear OS Intel x86 Atom System Image, API ${_apilevel}"
arch=('any')
url='https://software.intel.com/en-us/android/tools'
license=('custom')
depends=("android-platform-${_apilevel}")
optdepends=('qemu' 'libvirt')
provides=("${pkgname}-${pkgver/_*/}")
conflicts=("${pkgname}-${pkgver/_*/}")
options=('!strip')
source=("http://dl.google.com/android/repository/sys-img/android-wear/x86-${_apilevel}_${_rev}.zip"
        "package.xml")
sha256sums=('7289bc1dbd70ab312e5b936bdfd8944ea4ab9ff7443a77a69d9cab3e8f27d227'
            'd9366cc9863053a6146d41a5cff12cc5d713759fd59c5dbf465bbe36fa417f3e')

prepare() {
  # Fix permissions
  cd 'x86'
  find . -type f -print0 | xargs --null chmod -R u=rw,go=r
  find . -type d -print0 | xargs --null chmod -R u=rwx,go=rx
}

package() {
  # Install files
  install -d -m 755 "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/android-wear"
  cp -r 'x86' "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/android-wear/"
  # Install license
  install -D -m 644 "package.xml" "${pkgdir}/usr/share/licenses/${pkgname}/package.xml"
  ln -s "/usr/share/licenses/${pkgname}/package.xml" \
    "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/android-wear/x86/"
}
