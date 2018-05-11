# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-vmware
_commit=6b7dc2f9304298e669e7ac97594b948d1476ae52 # master
pkgver=xf86+video+vmware+13.0.2+69+g6b7dc2f
pkgrel=1
pkgdesc="X.org vmware video driver"
arch=(x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('mesa' 'libsystemd')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=24.0' 'git')
conflicts=('xorg-server<1.20' 'X-ABI-VIDEODRV_VERSION<24' 'X-ABI-VIDEODRV_VERSION>=25')
groups=('xorg-drivers')
options=('!emptydirs')
#source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2{,.sig})
source=("git+https://anongit.freedesktop.org/git/xorg/driver/xf86-video-vmware#commit=$_commit"
        0001-saa-Build-compatibility-with-xserver-1.20.patch
        gcc8.diff)
sha256sums=('SKIP'
            'eb8fcf7b0b886e47c8d8deb12e7d33742223723f76de8122e6161b46fa052403'
            '76ac76c213a3a27e757d62d59980ddd65b34ac02bd0e4efb00833fc69c01793e')
validpgpkeys=('90D027AEAF33CBABC140735BC1F5D3CDF5176580') #  Thomas Hellstrom (VMware) <thellstrom@vmware.com>

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
  # xorg-server 1.20 build fix by FC
  patch -Np1 -i ../0001-saa-Build-compatibility-with-xserver-1.20.patch
  
  patch -Np0 -i ../gcc8.diff
  
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd ${pkgname} #-${pkgver}

  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, module fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/,-z,now}

  ./configure --prefix=/usr --enable-vmwarectrl-client
  make
}

package() {
  cd ${pkgname} #-${pkgver}
  make DESTDIR="${pkgdir}" install
  
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
