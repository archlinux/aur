# Maintainer:
# Contributor: Jake <aur@ja-ke.tech>

_pkgname="octoprint"
pkgname="$_pkgname-venv"
pkgver=1.11.2
pkgrel=1
pkgdesc="Web interface for 3D printers (venv installation type)"
url="https://github.com/OctoPrint/OctoPrint"
license=('AGPL-3.0-only')
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')

depends=('python')
optdepends=(
  'ffmpeg: timelapse support'
  'mjpg-streamer: stream images from webcam'
)

provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

install="$_pkgname.install"

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=(
  "$_pkgsrc.$_pkgext"::"$url/releases/download/${pkgver}/OctoPrint-${pkgver}.source.tar.gz"
  'octoprint.service'
  'octoprint.sysusers'
  'octoprint.tmpfiles'
)
sha256sums=(
  '0d0e19670ec98dbfca7a97edfc68a9d0ea3bc5c362ec25024dbc38ddead3be44'
  '70be0efa0f6a536ed8a89a81bfdb5a978b1036ffead09a4db2e4d67599e02302'
  '79d0f9fe053181eaa77f472b5235463ce217475d47fada9869f42d313b4651a9'
  '67f7844f39428058d59e2a7cb03b3d3077b5f4b0a136fc9dd123e6538a92e851'
)

package() {
  cd "$_pkgsrc"

  python -m venv "${pkgdir}/opt/$pkgname"
  "${pkgdir}/opt/$pkgname/bin/pip3" install . --compile

  # relocate without breaking plugin system
  sed -i "s|${pkgdir}/opt/$pkgname|/opt/$pkgname|g" "${pkgdir}/opt/$pkgname/bin/"*

  install -Dm644 "${srcdir}/octoprint.service" "${pkgdir}/usr/lib/systemd/system/octoprint.service"
  install -Dm644 "${srcdir}/octoprint.sysusers" "${pkgdir}/usr/lib/sysusers.d/octoprint.conf"
  install -Dm644 "${srcdir}/octoprint.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/octoprint.conf"

  install -d "${pkgdir}/var/lib/octoprint" "${pkgdir}/etc/"
  ln -s /var/lib/octoprint/.octoprint/ "${pkgdir}/etc/octoprint"
}
