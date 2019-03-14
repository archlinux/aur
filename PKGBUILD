# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]
pkgname=vdr-softhdcuvid
pkgver=1.1.0.r10.g8682ab0
_gitver=8682ab01c440346212d65a91c5c4639a65d6473d
_vdrapi=2.4.0
pkgrel=2
pkgdesc="VDR output plugin with CUDA and Opengl"
url="https://github.com/jojo61/vdr-plugin-softhdcuvid"
arch=('x86_64')
license=('AGPL3')
depends=('ffmpeg' 'freeglut' 'glew' 'mesa' "vdr-api=${_vdrapi}" 'xcb-util-wm' 'xorg-server' 'nvidia>=410.48' 'libplacebo>=1.7.0')
optdepends=('vdr-xorg: Recommended way to start X.org server together with VDR')
makedepends=('git' 'glm' 'glu' 'vulkan-headers' 'cuda')
_plugname=${pkgname//vdr-/}
source=("vdr-plugin-${_plugname}::git+https://github.com/jojo61/vdr-plugin-softhdcuvid#commit=$_gitver"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
sha512sums=('SKIP'
         '0b336e5d0c18e5a875389c52d498ce81db0a407c6a93e1e72e0d0faec41d2165b80e91e9787465bb2cb9923ca65e6ce50e4a086f0d26410059899fef2bbe87b0')

pkgver() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "${srcdir}/vdr-plugin-${_plugname}"

  # Disable OSS. Arch Linux doesn't ship OSS
  sed -i '/OSS /d' Makefile

  # Enable libplacebo
  sed -i 's/LIBPLACEBO=0/LIBPLACEBO=1/' Makefile

  # Adapt path to cuda headers, in arch they are installed in /opt/cuda/include
  sed -i 's%/usr/local/cuda/include%/opt/cuda/include%' Makefile

  # Adapt path to cuda libraries, in arch the are installed in /opt/cuda/lib64
  sed -i 's%-L/usr/local/cuda/targets/x86_64-linux/lib%-L/opt/cuda/lib64%' Makefile
}

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
