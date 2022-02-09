# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: Pawel Mosakowski <pawel at mosakowski dot net>

pkgname=appgate-sdp
pkgver=5.5.2
pkgrel=1
pkgdesc="Appgate SDP (Software Defined Perimeter) desktop client"
arch=("x86_64")
url="https://www.${pkgname%%-*}.com/support/software-defined-perimeter-support"
license=("custom" "custom:commercial")
depends=("dnsmasq" "gtk3" "libsecret" "libxss" "nodejs" "nss" "python-dbus" "python-distro")
optdepends=("dnsmasq: dns resolver for systems without systemd-resolved"
            "gnome-keyring: saves the endpoint certificate between sessions")
provides=("${pkgname}")
options=(staticlibs !strip !emptydirs)
source=(
  "https://bin.${pkgname}.com/${pkgver%.*}/client/${pkgname}_${pkgver}_amd64.deb"
  "${pkgname%%-*}driver.service.patch"
)
sha256sums=(
  "f0aed1aa4c69c91b10dd01c621f4dc84b699efffa4d216e225d97bb9cfbebd8b"
  "0789aa07d6a7af44187e407696d930e78c50370c19b8399722ebecb0655ffcdb"
)

prepare() {
  mkdir "${srcdir}/${pkgname}"
  cd "${srcdir}/${pkgname}"

  bsdtar -xf "${srcdir}/data.tar.xz" -C .

  patch -Np1 -i "${srcdir}/${pkgname%%-*}driver.service.patch"

  # Remove unnecessary .deb related directory
  rm -rf "${srcdir}/${pkgname}/etc/init.d"
}

package() {
  # Install application files
  cp -dpr "${srcdir}/${pkgname}/"{etc,opt,usr} "${pkgdir}"

  # Install service files
  install -dm755 "${pkgdir}/usr/lib/systemd/system"
  install -Dm644 "${srcdir}/${pkgname}/lib/systemd/system/"* "${pkgdir}/usr/lib/systemd/system/"

  # Install license files
  install -Dm644 "${srcdir}/${pkgname}/usr/share/doc/${pkgname/-sdp/}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
  install -Dm644 "${srcdir}/${pkgname}/usr/share/doc/${pkgname/-sdp/}/LICENSE.github" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.github"
  install -Dm644 "${srcdir}/${pkgname}/usr/share/doc/${pkgname/-sdp/}/LICENSES.chromium.html.bz2" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html.bz2"
}
