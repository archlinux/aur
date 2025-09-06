# Maintainer: mads256h <mads256h(at)gmail(dot)com>
# Contributor: ava1ar <mail(at)ava1ar(dot)me>
# Contributor: mod24 <bruenker(at)sintro(dot)de>

pkgname=airtame-application
pkgver=4.14.0
pkgrel=1
pkgdesc="Airtame official screen streaming application."
arch=('x86_64')
url="https://airtame.com"
license=('custom')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'libutil-linux' 'libappindicator-gtk3' 'libsecret' 'libpulse' 'opus')
makedepends=('patchelf')
source=("https://downloads.airtame.com/app/latest/linux/Airtame-${pkgver}.deb")
sha1sums=('c538988db437573654356c9ca4b5f36e2cb59d0d')
package() {
  # Extract package data
  tar xf data.tar.xz -C "${pkgdir}"

  # Move airtame to correct folder
  mv "${pkgdir}/opt/Airtame/" "${pkgdir}/opt/${pkgname}"

  # Fix path for desktop file
  sed -i "s|/opt/Airtame|/opt/${pkgname}|g" "${pkgdir}/usr/share/applications/airtame-application.desktop"

  # Fix insecure rpath
  patchelf --force-rpath --set-rpath "\$ORIGIN" "${pkgdir}/opt/${pkgname}/resources/build/native/out/lib/libAirtameEncryption.so"

  # Install licenses
  install -m 644 -D "${pkgdir}/opt/${pkgname}/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  install -m 644 -D "${pkgdir}/opt/${pkgname}/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"

  # Make airtame-application available in /usr/bin/
  mkdir "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/airtame-application" "${pkgdir}/usr/bin/airtame-application"
}
