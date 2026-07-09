#@IgnoreInspection BashAddShebang
# Maintainer: Jérémy "Vrakfall" Lecocq <jeremy at artphotolaurent dot be>
# Contributor: David Manouchehri <manouchehri@riseup.net>
# Contributor: Christoph Bayer <chrbayer@criby.de>
# Contributor: Bence Hornák <hornak dot bence at gmail dot com>
# Contributor: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: danyf90 <daniele.formichelli@gmail.com>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_apilevel=28
_sdkver='9.0.0'
_rev='r04'
_image_arch='x86_64'
_sdkver_char='P'
pkgname=android-${_image_arch/x86_/x86-}-system-image-$_apilevel
pkgver=$_apilevel_$_sdkver_$_rev
pkgrel=2
pkgdesc="Android $_image_arch system image, API $_apilevel"
arch=('x86_64' 'aarch64')
url="https://developer.android.com/studio/index.html"
license=('custom')
optdepends=('android-emulator' 'qemu' 'libvirt')
options=('!strip')
source=("https://dl.google.com/android/repository/sys-img/android/${_image_arch}-${_apilevel}_${_rev}.zip"
        "package.xml")
sha256sums=('ff6ce81aa1424951a214da5f392f8e12382de46d33c08aeaa5d21caba6a39b62'
            '74c3dc0610ba38c1986135c2dd42c16f3c46233e3fe413b9cf5c73beb1081dad')

prepare() {
  # Fix permissions
  cd $_image_arch
  find . -type f -print0 | xargs --null chmod -R u=rw,go=r
  find . -type d -print0 | xargs --null chmod -R u=rwx,go=rx
}

package() {
  # Install files
  install -d -m 755 "${pkgdir}/opt/android-sdk/system-images/android-$_apilevel/default"
  cp -r $_image_arch "${pkgdir}/opt/android-sdk/system-images/android-$_apilevel/default/"
  # Install license
  install -D -m 644 "package.xml" "${pkgdir}/usr/share/licenses/$pkgname/package.xml"
  ln -s "/usr/share/licenses/$pkgname/package.xml" \
    "${pkgdir}/opt/android-sdk/system-images/android-$_apilevel/default/$_image_arch/"
}
