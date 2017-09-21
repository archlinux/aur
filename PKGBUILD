# Maintainer:  Michael Lass <bevan@bi-co.net>
# Contributor: Justin Dray <justin@dray.be>
# Contributor: Patrick McCarty <pnorcks at gmail dot com>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Thomas S Hatch <thatch45 ar gmail dot com>
# Contributor: Michael P <ptchinster@archlinux.us>
# Contributor: Matt Heagney <matt@heagney.com>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=multipath-tools
pkgver=0.7.3
pkgrel=1
pkgdesc='Multipath tools for Linux (including kpartx)'
arch=('i686' 'x86_64' 'armv7h')
url="http://christophe.varoqui.free.fr/"
license=('GPL2')
depends=('libaio' 'device-mapper' 'json-c' 'liburcu')
optdepends=('ceph: support for RADOS Block Devices (needs to be installed at build time)')
makedepends=('git')
conflicts=('multipath-tools-git')
install=multipath-tools.install
source=("multipath-tools::git+http://git.opensvc.com/multipath-tools/.git#tag=${pkgver}"
        0001-multipathd-fix-build-without-systemd.patch)
sha256sums=('SKIP'
            '753a7c4c09fe9c93c42beddaf25a913a92cb1bf91bddc6f5cb22c722e9d60bf7')

prepare() {
  cd  "${srcdir}/${pkgname}"

  # Patch multipathd to build when no systemd is installed
  patch -p1 < "${srcdir}"/0001-multipathd-fix-build-without-systemd.patch

  # Fix bindir in Makefile
  sed -i 's|$(exec_prefix)/sbin|$(exec_prefix)/bin|g' Makefile.inc
}

build() {
  cd  "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  make \
       DESTDIR="${pkgdir}" \
       exec_prefix="/usr" \
       LIB="/usr/lib" \
       install
}
