# Maintainer: mnovick1988 <anonymous - contact through aur.>
# Cloned from: xf86-video-vmware-git pkgbuild
#
# Note: Just a quick-fix to get this back on the AUR for those of us that need it.
#

pkgname=xf86-video-vmware-git
_realpkgname=xf86-video-vmware
pkgver=13.0.2.r40.gd5550b7
pkgrel=1
pkgdesc="X.org vmware video driver. Git version"
arch=('i686' 'x86_64')
url="http://xorg.freedesktop.org/"
provides=("${_realpkgname}")
depends=('libdrm>=2.4.41' 'systemd' 'mesa')
optdepends=('vmwgfx-git: git version kernel module')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION>=21.0'  )
conflicts=('xorg-server<1.16.0' 'xf86-video-vmware' 'X-ABI-VIDEODRV_VERSION<22.0' 'X-ABI-VIDEODRV_VERSION>=24.0')
license=('custom')
install=xf86-video-vmware-git.install

source=('xf86-video-vmware::git://anongit.freedesktop.org/xorg/driver/xf86-video-vmware#branch=master')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/xf86-video-vmware"
  ( set -o pipefail
  git describe --long | sed 's/^xf86-video-vmware-//;s/\([^-]*-g\)/r\1/;s/-/./g'
  )
}

build() {
  cd "${srcdir}/xf86-video-vmware"

  ./autogen.sh --prefix=/usr \
    --enable-vmwarectrl-client
	make
}

package() {
  cd "${srcdir}/xf86-video-vmware"
  
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}

