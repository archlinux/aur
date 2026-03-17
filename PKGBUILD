# Maintainer: Javad <ja7ad@live.com>

pkgname=nordvpn-live-bin
_pkgver=4.5.0
pkgver=4.5.0
pkgrel=1
pkgdesc="NordVPN CLI/GUI tool for Linux (Live version)"
arch=('x86_64' 'i686' 'armv7h' 'aarch64' 'armeabi')
url="https://nordvpn.com/download/linux/"
license=('GPL3')
optdepends=('nordvpn-gui: Graphical Interface for NordVPN')
provides=('nordvpn')
conflicts=('openvpn-nordvpn')
install=nordvpn-bin.install

case "$CARCH" in
  x86_64)  _arch="amd64" ;;
  i686)    _arch="i386" ;;
  armv7h)  _arch="armhf" ;;
  aarch64) _arch="arm64" ;;
  armeabi) _arch="armel" ;;
  *) echo "Unsupported architecture: $CARCH"; exit 1 ;;
esac

_deb="nordvpn_${_pkgver//_/-}_${_arch}.deb"
source=("https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/n/nordvpn/${_deb}")

sha256sums=('6de9093b384b1b016c611b8f6a000dc1476ec82b9f694e17a093f05a8067891f')

package() {
  bsdtar -xf "${srcdir}/${_deb}" -C "${srcdir}"

  if [ -f "${srcdir}/data.tar.zst" ]; then
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
  elif [ -f "${srcdir}/data.tar.xz" ]; then
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
  else
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}/"
  fi

  install -dm755 "${pkgdir}/usr/bin"
  mv "${pkgdir}/usr/sbin/nordvpnd" "${pkgdir}/usr/bin/"
  rm -rf "${pkgdir}/etc/init.d"
  rm -rf "${pkgdir}/usr/sbin"

  install -dm755 "${pkgdir}/usr/lib/sysusers.d/"
  echo "g nordvpn - -" > "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
