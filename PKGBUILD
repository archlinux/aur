# Maintainer: yair reshef <yair99@gmail.com>
# Contributor: piojo, jediofthecode, megahertz

pkgname=astrill
pkgver=3.9.0.2180
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

sha256sums_x86_64=('f21488ca0ca9e38ab95b95e5ba0c58bc348c33aab56a246dcb06d0ed35a4dbb1')
sha256sums_i686=('9eadf4d62e12df3448760f912c4175414524b9293afba9d6eeb7636a5efcd5fc')

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
