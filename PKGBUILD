# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: Pawel Mosakowski <pawel at mosakowski dot net>

pkgname=appgate-sdp-headless
pkgver=5.4.2
pkgrel=1
pkgdesc="Appgate SDP (Software Defined Perimeter) headless client (It does not support 2FA.)"
arch=("x86_64")
url="https://www.${pkgname%%-*}.com/support/software-defined-perimeter-support"
license=("custom" "custom:commercial")
depends=("dnsmasq" "libsecret" "libxss" "nodejs" "nss" "python-dbus" "python-distro")
optdepends=("bash-completion: allows bash completion for scripts")
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
backup=("etc/appgate.conf" "etc/dbus-1/system.d/appgate.conf")
options=(staticlibs !strip !emptydirs)
source=(
  "https://bin.${pkgname%-*}.com/${pkgver%.*}/client/${pkgname}_${pkgver}_amd64.deb"
  "${pkgname%%-*}driver.service.patch"
)
sha256sums=(
  "a507abc3f3be149b9dc34a0db774b92b005c1713bb43704087e1693b410e96e0"
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
  mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"

  # Install license files
  install -Dm644 "${srcdir}/${pkgname}/usr/share/doc/${pkgname/-sdp/}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
}
