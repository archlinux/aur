# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Contributor: Paul Mattal <paul@mattal.com>
# Contributor: Juergen Hoetzel <juergen@hoetzel.info>

pkgname=xf86-video-openchrome
#_commit=8c819ed # 7 digits # = 0.6.0 RC1
#pkgver=0.5.0+279+g8c819ed
pkgver=0.6.0
pkgrel=3
pkgdesc="X.Org Openchrome drivers"
arch=(x86_64)
license=('custom')
url="http://www.freedesktop.org/wiki/Openchrome/"
depends=('libdrm' 'libxvmc' 'libsystemd')
optdepends=('unichrome-dri')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=24.0' 'systemd')
#             'git')
conflicts=('xorg-server<1.20' 'X-ABI-VIDEODRV_VERSION<24' 'X-ABI-VIDEODRV_VERSION>=25'
           'xf86-video-via' 'xf86-video-unichrome' 'openchrome')
replaces=('openchrome' 'xf86-video-via')
groups=('xorg-drivers')
options=('!emptydirs')
source=(https://xorg.freedesktop.org/archive/individual/driver/${pkgname}-${pkgver}.tar.bz2{,.sig})
#source=("git://anongit.freedesktop.org/openchrome/xf86-video-openchrome#commit=${_commit}")
sha256sums=('da2975c6379358de52c1257710c67eb59139a7f0a1cd28d00cc64cc3e1c02f75'
            'SKIP')
validpgpkeys=('CDA92E38A7A7A82237E9AB61C922784178BFFDB0') # "Kevin Brace <kevinbrace@gmx.com>"

#pkgver() {
#  cd $pkgname
#  git describe --long | sed 's/-/+/g'
#  git describe --long | sed "s/openchrome-//;s/-/./g"
#  git describe --long | sed "s/openchrome-//;s/0.5/0.5.200/;s/-/+/g"
#  git describe --long | sed "s/openchrome-//;s/0.5/0.5.0/;s/-/+/g"
#}

#prepare() {
#  cd $pkgname
#  NOCONFIGURE=1 ./autogen.sh
#}

build() {
  cd ${pkgname}-${pkgver}

  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, module fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/,-z,now}

  ./configure --prefix=/usr
  make
}

check() {
  cd $pkgname-${pkgver}
  make check
}


package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
