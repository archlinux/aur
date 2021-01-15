# Author:  Chris Severance aur.severach aATt spamgourmet dott com

# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
# Temporary package until `uhubctl` adds support for ARM architectures

# sudo lsusb -v 2>/dev/null | grep -e '^Bus\|Per-port power switching' | grep -B1 'Per-port power switching'

set -u
pkgname=uhubctl-arm
_pkgbase=uhubctl
pkgver=2.3.0
pkgrel=1
pkgdesc='control USB per-port power switching on PPPS smart USB hubs'
provides=(uhubctl)
conflicts=(uhubctl)
arch=('x86_64' 'armv7h' 'aarch64')
_github='mvp'
url="https://github.com/${_github}/${_pkgbase}"
license=('GPL')
depends=('libusb>=1.0.12' 'libudev.so')
_verwatch=("https://github.com/${_github}/${_pkgbase}/releases.atom" "\s\+<title>${_pkgbase}\sv*\([0-9\.]\+\)</title>.*" 'f')
_srcdir="${_pkgbase}-${pkgver}"
source=("${pkgname}-${pkgname}.tgz::https://github.com/${_github}/${_pkgbase}/archive/v${pkgver}.tar.gz")
md5sums=('674fb3bdcc46eb7152ff0b94a3aa62c0')
sha256sums=('714f733592d3cb6ba8efc84fbc03b1beed2323918ff33aef01cdb956755be7b7')

prepare() {
  set -u
  cd "${_srcdir}"
  sed -e 's/^GIT_VERSION :=/#&/g' -i 'Makefile'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  CFLAGS+=' -Wformat-overflow=2'
  make -s -j1 GIT_VERSION="${pkgver}"
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -s -j1 install DESTDIR="${pkgdir}" sbindir='/usr/bin'
  install -Dpm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
  set +u
}
set +u
