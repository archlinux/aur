# Maintainer:  dreieck
# Contributor: Muflone
# Contributor: lestb

pkgname=android-desktop-x86-64-system-image
pkgver=33_r01
pkgrel=4
pkgdesc='Android desktop x86_64 Atom System Image.'
arch=('any')
url='https://software.intel.com/en-us/android/tools'
license=('custom')
depends=('android-platform')
optdepends=('qemu' 'libvirt')
provides=(
  "android-system-image"
  "${pkgname}-${pkgver/_*/}"
)
conflicts=("${pkgname}-${pkgver/_*/}")
options=('!strip')
source=(
  "${pkgname}-${pkgver}.zip"::"https://dl.google.com/android/repository/sys-img/desktop/x86_64-${pkgver}.zip"
  "package.xml"
)
sha256sums=(
  'd1eac898e1d99a50010b28ca3f0236afa9d7a17e482c6941758f8a63b0826861'
  '4cb006ba3fe9234cae6a2ee7a77e316e3b33559292a87db17dbbb7bf177356a5'
)

prepare() {
  # Fix permissions
  cd 'x86_64'
  find . -type f -print0 | xargs --null chmod -R u=rw,go=r
  find . -type d -print0 | xargs --null chmod -R u=rwx,go=rx
}

package() {
  # Install files
  install -dvm 755 "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/desktop"
  cp -rv 'x86_64' "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/desktop/"
  # Install license
  install -Dvm 644 "package.xml" "${pkgdir}/usr/share/licenses/${pkgname}/package.xml"
  ln -sv "/usr/share/licenses/${pkgname}/package.xml" \
    "${pkgdir}/opt/android-sdk/system-images/android-${pkgver/_*/}/desktop/x86_64/"
}
