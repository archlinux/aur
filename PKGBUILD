# Maintainer: 7Ji <pugokushin@gmail.com>
# Contributor: Thomas Bächler <thomas@archlinux.org>
# Contributor: Kevin Mihelich <kevin@archlinuxarm.org>
#  - ALARM: Kevin Mihelich: 
#      disable distcc - configure checks for clang first

_pkgname=v4l-utils
pkgname=${_pkgname}-mpp
pkgver=1.24.1
pkgrel=1
pkgdesc="Userspace tools and conversion library for Video 4 Linux, with Rockchip MPP support"
arch=('aarch64')
url="https://linuxtv.org/"
provides=("libv4l=${pkgver}")
replaces=('libv4l')
conflicts=('libv4l')
backup=(etc/rc_maps.cfg)
license=('LGPL')
options=('!distcc')
depends=('hicolor-icon-theme' 'gcc-libs' 'libjpeg-turbo'  'systemd-libs' 'json-c' 'mpp-git')
makedepends=('qt5-base' 'alsa-lib')
optdepends=('qt5-base: for qv4l2 and qvidcap' 'alsa-lib: for qv4l2')
source=(https://linuxtv.org/downloads/v4l-utils/${_pkgname}-${pkgver}.tar.bz2{,.asc})
_patches=(
  '0001-libv4l2-Support-mmap-to-libv4l-plugin.patch'
  '0002-libv4l-mplane-Filter-out-multiplane-formats.patch'
  '0003-libv4l-Support-V4L2_MEMORY_DMABUF.patch'
  '0004-libv4l-mplane-Support-VIDIOC_EXPBUF-for-dmabuf.patch'
  '0005-Support-builtin-v4l-plugins.patch'
  '0006-libv4l-Disallow-conversion-by-default.patch'
)
_patch_commit='86099cc0e149e84b59758e09b3598b358024c620'
_patch_parent="https://github.com/JeffyCN/meta-rockchip/raw/${_patch_commit}/recipes-multimedia/v4l2apps/v4l-utils/"
for _patch in ${_patches[@]}; do
  source+=("${_patch_parent}${_patch}")
done
sha256sums=(
  'cbb7fe8a6307f5ce533a05cded70bb93c3ba06395ab9b6d007eb53b75d805f5b'
  'SKIP'
  '2b6b3e39a0bc46518bb1c77b165412818c8d3be2f0d1ba63aff762243e7860e3'
  '06f4516e03e4f387732e6b357e1d44a3546ed56b82f5d93fb090f30fcccc599b'
  'e59e60cea2158eb4ed5901ef1c623ac9e5e829ae503b3dbb6e901fe0515b6b2f'
  '1749ec09358bf15853e2c5eb6f6f72a0278f86071c301fc4db6672b4cac98edf'
  'd176613ae41b124600a290c2e004651c5aee9bfb7acb3f2bebc1e47d39c2b501'
  'e594ff7c90ad7a1ac9295178349ccf6b51050696d1e79f8ea632e2a73360eb61'
)
validpgpkeys=('05D0169C26E41593418129DF199A64FADFB500FF') # Gregor Jasny <gjasny@googlemail.com>

_srcname="${_pkgname}-${pkgver}"

prepare() {
  cat ${_patches[@]} | patch -p1 -d "${_srcname}"
}

build() {
  cd "${_srcname}"

  ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin
  make
}

package() {
  cd "${_srcname}"
  MAKEFLAGS="-j1" make install DESTDIR="${pkgdir}/"
  rm "${pkgdir}/usr/bin/ivtv-ctl"
}
