# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Utsob Roy <uroybd(at)gmail(dot)com>

pkgname=franz-bin
pkgver=5.6.0
pkgrel=1
pkgdesc='Franz is a free messaging app for services like WhatsApp, Slack, Messenger and many more'
arch=('x86_64')
url='https://meetfranz.com'
license=('Apache')
depends=('alsa-lib' 'gtk3' 'libsecret' 'libxss' 'libxtst' 'nss')
optdepends=('org.freedesktop.secrets')
conflicts=('franz')
options=('!strip' '!emptydirs')
source=("https://github.com/meetfranz/franz/releases/download/v${pkgver//_/-}/franz_${pkgver//_/-}_amd64.deb"
        "${pkgname}.patch")
sha256sums=('1b82bf5c654b5344ebabaf1ffc1ec128db543d5cf808643e0c71df6bbb51352a'
            'a5a35da27f2cb51bc07e973b443437e4d4cfae4a081f6d2a264363ce550a6be0')

package() {
  # Extract package data
  bsdtar -xJf data.tar.xz

  # Install package data
  mv "usr" "${pkgdir}"
  install -dm755 "${pkgdir}/usr/bin" "${pkgdir}/usr/lib"
  mv "opt/Franz" "${pkgdir}/usr/lib/franz"
  ln -s "../lib/franz/franz" "${pkgdir}/usr/bin/franz"

  # Permission fix
  chmod 644 "${pkgdir}/usr/lib/franz/"*.so

  # Fix binary path in .desktop file
  patch -d "${pkgdir}" -p1 <"${pkgname}".patch

  # Link licenses
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/lib/franz/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  ln -s "/usr/lib/franz/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
