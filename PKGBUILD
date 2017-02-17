# Maintainer: Yurii Kolesnykov <yurikoles@gmail.com>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-intel-git
_branch=master
pkgver=2.99.917+758+g860c3664
pkgrel=1
epoch=1
arch=(i686 x86_64)
url="https://01.org/linuxgraphics"
license=('custom')
install=$pkgname.install
pkgdesc="X.org Intel i810/i830/i915/945G/G965+ video drivers"
depends=('mesa' 'libxvmc' 'pixman' 'xcb-util>=0.3.9' 'libsystemd')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=23' 'libx11' 'libxrender'
             # additional deps for intel-virtual-output
             'libxrandr' 'libxinerama' 'libxcursor' 'libxtst' 'libxss'
             # additional for git snapshot
             'git')
optdepends=('libxrandr: for intel-virtual-output'
            'libxinerama: for intel-virtual-output'
            'libxcursor: for intel-virtual-output'
            'libxtst: for intel-virtual-output'
            'libxss: for intel-virtual-output')
replaces=('xf86-video-intel-uxa' 'xf86-video-intel-sna' 'xf86-video-intel')
provides=('xf86-video-intel-uxa' 'xf86-video-intel-sna' 'xf86-video-intel')
conflicts=('xorg-server<1.19' 'X-ABI-VIDEODRV_VERSION<23' 'X-ABI-VIDEODRV_VERSION>=24'
           'xf86-video-intel-sna' 'xf86-video-intel-uxa' 'xf86-video-i810' 'xf86-video-intel-legacy'
           'xf86-video-intel')
groups=('xorg-drivers')
#source=(${url}/archive/individual/driver/${pkgname}-${pkgver}.tar.bz2)
source=("$pkgname::git://anongit.freedesktop.org/xorg/driver/xf86-video-intel#branch=${_branch}")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr \
    --libexecdir=/usr/lib \
    --with-default-dri=3
  make
}

check() {
  cd $pkgname
  make check
}

package() {
  cd $pkgname

  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
