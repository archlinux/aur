# Maintainer: Joan Figueras <ffigue at gmail dot com>

_arch=x64v1
pkgname=linux-xanmod-linux-headers-bin-${_arch}
_major=6.0
pkgver=${_major}.9
xanmod=1
pkgrel=${xanmod}
pkgdesc="Headers and scripts for building modules for the Linux Xanmod - Current Stable (MAIN) - Prebuilt version - ${_arch}"
url="http://www.xanmod.org/"
arch=(x86_64)

license=(GPL2)
options=('!strip')
depends=(pahole)

_url=$(curl -L -s https://api.github.com/repos/xanmod/linux/releases/tags/${pkgver}-xanmod${xanmod} | jq --arg PKGVER "${pkgver}" --arg XANMOD "${xanmod}" --arg ARCH "${_arch}" -r '.assets[] | select(.name | contains("linux-headers-" + $PKGVER + "-" + $ARCH + "-xanmod" + $XANMOD)).browser_download_url')
source=("${_url}")
validpgpkeys=(
    'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linux Torvalds
    '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
)

sha256sums=('62da0dcb63d69c39b84e6635c4b51400d2344eba12e1f199de68a2a96d192be4')

prepare() {
  bsdtar -xf data.tar.xz
}

package() {

  local kernver="${pkgver}-${_arch}-xanmod${xanmod}"
  local modulesdir="$pkgdir/usr/lib/modules/${kernver}"
  mkdir -p "${modulesdir}"
  cp -r lib/modules/${kernver}/* ${modulesdir}
  cp -r usr/* ${pkgdir}/usr
}

# vim:set ts=8 sts=2 sw=2 et:
