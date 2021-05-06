# Maintainer: Pawel Mosakowski <pawel at mosakowski dot net>
# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=appgate-sdp
pkgver=5.4.0
pkgrel=1
pkgdesc="Appgate SDP (Software Defined Perimeter) desktop client"
arch=("x86_64")
url="https://www.${pkgname%%-*}.com/support/software-defined-perimeter-support"
license=("custom" "custom:commercial")
depends=("dnsmasq" "gtk3" "libsecret" "libxss" "nodejs" "nss" "python-dbus" "python-distro")
optdepends=("gnome-keyring: saves the endpoint certificate between sessions")
provides=("${pkgname}")
conflicts=()
replaces=("${pkgname}-${pkgver%%.*}")
options=(staticlibs)
source=(
  "https://bin.${pkgname}.com/${pkgver%.*}/client/${pkgname}_${pkgver}_amd64.deb"
  "${pkgname}-${pkgname%%-*}driver.service.patch"
)
sha256sums=(
  "d83cd9e499c518179a1ed0dfec20176ffaafea4548fac60c5b935cdb913778d0"
  "0789aa07d6a7af44187e407696d930e78c50370c19b8399722ebecb0655ffcdb"
)

prepare() {
  mkdir "${srcdir}/${pkgname}"
  cd "${srcdir}/${pkgname}"

  bsdtar -xf "${srcdir}/data.tar.xz" -C .

  patch -Np1 -i "${srcdir}/${pkgname}-${pkgname%%-*}driver.service.patch"

  # Remove unnecessary .deb related directory
  rm -rf "${srcdir}/${pkgname}/etc/init.d"
}

package() {
  # Install application files
  cp -dpr "${srcdir}/${pkgname}/"{opt,usr,etc} "${pkgdir}"

  # Install service files
  install -dm755 "${pkgdir}/usr/lib/systemd/system"
  install -Dm644 "${srcdir}/${pkgname}/lib/systemd/system/"* "${pkgdir}/usr/lib/systemd/system/"

  # Install license files
  install -Dm644 "${srcdir}/${pkgname}/usr/share/doc/${pkgname%%-*}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
  install -Dm644 "${srcdir}/${pkgname}/usr/share/doc/${pkgname%%-*}/LICENSE.github" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.github"
  install -Dm644 "${srcdir}/${pkgname}/usr/share/doc/${pkgname%%-*}/LICENSES.chromium.html.bz2" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html.bz2"
}
