# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Contributor: Timothée Ravier
# SELinux Contributor: Nicky726 <Nicky726@gmail.com>
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=findutils-selinux
pkgver=4.11.0
pkgrel=1
pkgdesc="GNU utilities to locate files with SELinux support"
arch=('x86_64' 'aarch64')
license=('GPL-3.0-or-later')
groups=('selinux')
depends=('glibc' 'libselinux')
makedepends=('git' 'wget' 'python')
conflicts=("${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
url='https://www.gnu.org/software/findutils/'
source=(
  git+https://git.savannah.gnu.org/git/findutils.git?signed#tag=v${pkgver}
  git+https://git.savannah.gnu.org/git/gnulib.git
)
validpgpkeys=(
  'A5189DB69C1164D33002936646502EF796917195' # Bernhard Voelker <mail@bernhard-voelker.de>
  '0CF4E8D871593224842832B888DD9E08C5DDACB9' # James Youngman <james@youngman.org>
)
b2sums=('234e55a7eb5d9b882e45f9fb40446f765741130e4c3ebd01154344e48f0d3bcb6b36442d1c99c3574df239511959d542ec9b201fe269a1fd7b527edd058c54d5'
        'SKIP')

prepare() {
  cd "${pkgname/-selinux}"

  git submodule init
  git config submodule.gnulib.url "${srcdir}/gnulib"
  git -c protocol.file.allow=always submodule update

  ./bootstrap
}

build() {
  cd "${pkgname/-selinux}"

  # Don't build or install locate because we use mlocate,
  # which is a secure version of locate.
  sed -e '/^SUBDIRS/s/locate//' -e 's/frcode locate updatedb//' -i Makefile.in

  ./configure --prefix=/usr
  # don't build locate, but the docs want a file in there.
  make -C locate dblocation.texi
  make
}

check() {
  cd "${pkgname/-selinux}"
  make check
}

package() {
  cd "${pkgname/-selinux}"
  make DESTDIR="${pkgdir}" install
}
