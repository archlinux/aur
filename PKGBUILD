# Maintainer: mnovick1988 <anonymous - contact through aur.>
# Cloned from: xf86-video-vmware-git pkgbuild
#
# Note: Just a quick-fix to get this back on the AUR for those of us that need it.
#

pkgname=vmwgfx-git
_realpkgname=vmwgfx
pkgver=1.4.1.r362.g9cb5f5b
pkgrel=1
pkgdesc="vmwgfx(vmware) gpu kernel driver. Git version"
arch=('i686' 'x86_64')
url="http://xorg.freedesktop.org/wiki/vmware/"
provides=("${_realpkgname}")
depends=('libdrm>=2.4.41' 'systemd' 'mesa')
makedepends=('linux-headers')
license=('custom')
install=vmwgfx.install

_kernver="$(uname -r)"

source=('vmwgfx::git://anongit.freedesktop.org/git/mesa/vmwgfx#branch=master')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/vmwgfx"
  ( set -o pipefail
  git describe --long | sed 's/^vmwgfx-//;s/\([^-]*-g\)/r\1/;s/-/./g'
  )
}

build() {
  cd "${srcdir}/vmwgfx"

	make
}

package() {
  cd "${srcdir}/vmwgfx"
  
  gzip vmwgfx.ko
  install -dm755 "$pkgdir/usr/lib/modules/$_kernver/kernel/drivers/gpu/drm/vmwgfx"
  install -m644 vmwgfx.ko.gz "$pkgdir/usr/lib/modules/$_kernver/kernel/drivers/gpu/drm/vmwgfx"
}

