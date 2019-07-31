# Maintainer: spider-mario <spidermario@free.fr>
# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: svoufff <svoufff at gmail dot com>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>

_pkgname=linuxsampler
pkgname=linuxsampler-vst
pkgver=2.1.1
pkgrel=2
pkgdesc="Professional-grade audio sampler alternative to Gigasampler (including VST plugin)"
arch=('x86_64')
url="https://www.linuxsampler.org/"
license=('GPL2')
groups=('pro-audio')
depends=('libgig' 'jack' 'sqlite')
makedepends=('ladspa' 'dssi' 'lv2' 'steinberg-vst36')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://download.linuxsampler.org/packages/${_pkgname}-${pkgver}.tar.bz2")
sha512sums=('3f172efe40bbe130a2ac09f9393a46a30cc327a6754a80fdb36e65276518ec82befa2075acc567ccd99c22d9859c1a65f58ff2ad7af70cd9e4649ae14fd5357c')

prepare() {
  cd "${_pkgname}-${pkgver}"
  autoreconf -vfi
  # creating a ld.so.conf entry for linuxsampler.so
  echo "/usr/lib/${_pkgname}" > "${pkgname}.conf"
}

build() {
  cd "${_pkgname}-${pkgver}"
  ./configure --prefix=/usr --enable-vstsdk-dir=/usr/include/vst36/
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  # docs
  install -vDm 644 {AUTHORS,ChangeLog,NEWS,README} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
  # adding linuxsampler.so library path to ld.so.conf (required for dependants
  # during runtime)
  install -vDm 644 "${pkgname}.conf" -t "${pkgdir}/etc/ld.so.conf.d/"
  # lscp files conflict with nilfs-utils:
  # https://bugs.archlinux.org/task/45827
  mv -v "${pkgdir}/usr/bin/lscp" "${pkgdir}/usr/bin/lscp-${_pkgname}"
  mv -v "$pkgdir/usr/share/man/man1/lscp.1" \
    "${pkgdir}/usr/share/man/man1/lscp-${_pkgname}.1"
}
# vim:set ts=2 sw=2 et:
