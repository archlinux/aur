# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Maintainer: Kppqju77 <ju.adde-gmail-com>

_arch=x86
pkgname=android-google-apis-${_arch/_/-}-system-image
pkgver=30_r10
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
sha512sums=('f8b22538ee503e145b210440a7aa7b1f5af8d9e7b8d557bf6eaf91b6a0235cbea9bc2ef7a8888b7c1ad4c666a75dbd0bd71eb9202d8afb34555fcb9fdf2ae801'
            'd6559e805ca391231717fad32ff6920849131a8e478f8b4661e8ee7971984b41a1f8cfa6a96486f737ea9b35c0e34c5536216f1ce8eacfedd7f77e1b7542156b')

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
