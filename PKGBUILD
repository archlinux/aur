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
pkgver=0.6.4
pkgrel=1
pkgdesc='Multipath tools for Linux (including kpartx)'
arch=('i686' 'x86_64')
url="http://christophe.varoqui.free.fr/"
license=('GPL2')
depends=('libaio' 'device-mapper' 'liburcu')
makedepends=('git')
conflicts=('multipath-tools-git')
install=multipath-tools.install
source=("multipath-tools::git+http://git.opensvc.com/multipath-tools/.git#tag=${pkgver}"
        http://http.debian.net/debian/pool/main/m/multipath-tools/multipath-tools_0.6.3-2.debian.tar.xz)
sha256sums=('SKIP'
            '44e3d298d31c61da1d3f04c65878169ae8b54adfda0e900fcffec679cb2ff9c6')

# The rbd checker requires librados. On Arch this would require ceph to be
# installed, requiring a lot of space, not needed by most people.
# We use a patch taken from Debian to disable building this checker.
USERADOS=0

if [ $USERADOS -eq 1 ]; then
  depends+=('ceph')
fi

prepare() {
  cd  "${srcdir}/${pkgname}"

  # Fix bindir in Makefile
  sed -i 's|$(exec_prefix)/sbin|$(exec_prefix)/bin|g' Makefile.inc

  # Disable rbd checker if not explicitly requested
  if [ $USERADOS -eq 0 ]; then
    patch -p1 < "${srcdir}"/debian/patches/disable-rados-link-for-udeb.patch
  fi
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
