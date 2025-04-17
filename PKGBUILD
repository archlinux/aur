# Maintainer: yair reshef <yair99@gmail.com>
# Contributor: piojo, jediofthecode, megahertz

pkgname=astrill
pkgver=3.10.0.3073
pkgrel=0
pkgdesc="VPN configuration tool for Astrill's servers"
arch=('x86_64' 'i686')
url="http://astrill.com/"
license=('custom')
depends=()
install=astrill.install

# Astrill doesn't provide direct download links without authenticating
# But their QA shared the following links for building the package
source_i686=('https://www.astrilldownloads.com/astrill-setup-linux.rpm')
source_x86_64=('https://www.astrilldownloads.com/astrill-setup-linux64.rpm')

sha256sums_x86_64=('2211073ef66a4389d96f500e74169d8db3cb4ca1955d020104496b372581402a')
sha256sums_i686=('cf5d376220988a6847684da1af525587dedf3cd1f0fb945d97972bdb1b477c42')

# Use this path instead of /usr/local/Astrill
_install_path=/opt/astrill

package() {
  install -Dm644 \
    "${srcdir}/etc/systemd/system/astrill-reconnect.service" \
    "${pkgdir}/etc/systemd/system/astrill-reconnect.service"

  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}${_install_path}"
  install -dm755 "${pkgdir}/usr/share"

  cp -rT  "${srcdir}/usr/local/Astrill" "${pkgdir}${_install_path}"
  cp -rT  "${srcdir}/usr/share" "${pkgdir}/usr/share"

  _patch_install_path '/etc/systemd/system/astrill-reconnect.service'
  _patch_install_path "${_install_path}/Astrill.desktop"
  _patch_install_path "/usr/share/applications/Astrill.desktop"

  ln -s ${_install_path}/astrill "${pkgdir}"/usr/bin/astrill
}

_patch_install_path() {
  local file_path="$1"
  sed "s%/usr/local/Astrill%${_install_path}%g" -i "${pkgdir}${file_path}"
}
