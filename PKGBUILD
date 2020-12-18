# Maintainer: Fredy García <frealgagu at gmail dot com>
# Maintainer: Pawel Mosakowski <pawel at mosakowski dot net>

pkgname=appgate-sdp-4
pkgver=4.3.2
pkgrel=1
pkgdesc="Appgate SDP (Software Defined Perimeter) desktop client"
arch=("x86_64")
url="https://www.${pkgname%%-*}.com/support/software-defined-perimeter-support"
license=("custom" "custom:commercial")
depends=("dnsmasq" "gtk3" "libsecret" "libxss" "nodejs" "nss" "python")
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}" "${pkgname%-*}-headless")
replaces=("${pkgname%-*}=${pkgver}")
options=(staticlibs)
source=(
  "https://bin.${pkgname%-*}.com/${pkgver%.*}/client/${pkgname%-*}_${pkgver}_amd64.deb"
  "appgatedriver.service"
  "${pkgname}-avoid_dist_validation-nm.py.patch"
)
sha256sums=(
  "4232e7345f79669491652b2e75ef306ff267a4c96042be539e6e571492759bf2"
  "3f13c4f9de7fe546dc16e9fce4abda72eb7e51bf3662d633a09f6a8c373d9bb4"
  "f82e8b195546087af58f0608caf786df523caeb033455a2eb8c01a76c3ac6dfe"
)

prepare() {
  mkdir "${srcdir}/${pkgname}"
  cd "${srcdir}/${pkgname}"

  bsdtar -xf "${srcdir}/data.tar.xz" -C .

  patch -Np1 -i "${srcdir}/${pkgname}-avoid_dist_validation-nm.py.patch"

  # Remove unnecessary .deb related directory
  rm -rf "${srcdir}/${pkgname}/etc/init.d"
}

package() {
  # Install application files
  cp -dpr "${srcdir}/${pkgname}/"{opt,usr,etc} "${pkgdir}"

  # Install service files
  install -dm755 "${pkgdir}/usr/lib/systemd/system"
  install -Dm644 "${srcdir}/${pkgname}/lib/systemd/system/"* "${pkgdir}/usr/lib/systemd/system/"
  install "${srcdir}/appgatedriver.service" "${pkgdir}/usr/lib/systemd/system/appgatedriver.service"

  # Install license files
  install -Dm644 "${srcdir}/${pkgname}/usr/share/doc/${pkgname%%-*}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
  install -Dm644 "${srcdir}/${pkgname}/usr/share/doc/${pkgname%%-*}/LICENSE.github" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.github"
  install -Dm644 "${srcdir}/${pkgname}/usr/share/doc/${pkgname%%-*}/LICENSES.chromium.html.bz2" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html.bz2"
}
