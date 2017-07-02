# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: philomath <philomath868 AT gmail DOT com>
# Contributor: Sebastien Binet <binet@farnsworth>

# Build conflicts with docbook-xml-dtd
# Must reinstall docbook-xml to repair

set -u
pkgname='latrace'
pkgver='0.5.11'
pkgrel='2'
pkgdesc='trace library calls and get their statistics in a manner similar to the strace utility (syscall tracing)'
arch=('i686' 'x86_64')
url='http://people.redhat.com/jolsa/latrace/index.shtml'
license=('GPL3')
depends=('glibc')
makedepends=('asciidoc' 'xmlto' 'docbook-xml' 'docbook-xsl')
_verwatch=("http://people.redhat.com/jolsa/${pkgname}/download.shtml" "dl/${pkgname}-\([0-9\.]\+\)\.tar\.bz2" 'l')
source=(
  "http://people.redhat.com/jolsa/latrace/dl/${pkgname}-${pkgver}.tar.bz2"
  # https://lists.fedorahosted.org/archives/list/latrace@lists.fedorahosted.org/thread/DLDXFBPDNVKTV5YUYTUBMF4D4LY7XFMP/
  'latrace-patch-armv7l.patch'
  # https://build.opensuse.org/package/view_file/server:monitoring/latrace/reproducible.patch?expand=1
  'latrace-patch-reproducible.patch'
  # https://git.pengutronix.de/cgit/ptxdist/tree/patches/latrace-0.5.11
  # https://www.mail-archive.com/ptxdist@pengutronix.de/msg11703.html
  #'0001-Buildsystem-fix-configure-creation.patch'
  #'0002-Buildsystem-fix-cross-compilation.patch'
  'latrace-patch-0003-Fix-scanner-config-for-flex-2.6.x.patch'
)
sha256sums=('3b5afacafa8c1f9f00fb911466f4e2944162aaedfd81805f54e34c22652dbdd5'
            '0e07f4875bff939f973717a591f632451b70f18280ed08f3ac743210bd187486'
            '91650879c793850794d5b60cc0c481127558ce3d3485fa699081c2825ad2c92f'
            '8c793ecd3fc16a41d3ffe54beb7dde5c18dbf61dc4c3372e4728125b1a1a404a')

prepare() {
  set -u
  cd "${pkgname}-${pkgver}"
  # diff -pu5 configure.ac{.orig,} > '/home/chris/build/latrace/latrace-patch-armv7l.patch'
  patch -bup0 < '../latrace-patch-armv7l.patch'
  # diff -pu3 doc/asciidoc.conf.in{.orig,} > '/home/chris/build/latrace/latrace-patch-reproducible.patch'
  patch -bup0 < '../latrace-patch-reproducible.patch'
  # diff -pu5 src/config-flex.l{.orig,} > '/home/chris/build/latrace/latrace-patch-0003-Fix-scanner-config-for-flex-2.6.x.patch'
  patch -bup0 < '../latrace-patch-0003-Fix-scanner-config-for-flex-2.6.x.patch'
  set +u
}

build() {
  set -u
  cd "${pkgname}-${pkgver}"
  if [ ! -s 'configure.log' ]; then
    aclocal
    autoconf
    sed -e 's/CONFIG_ARCH_HAVE_TEST="y"/CONFIG_ARCH_HAVE_TEST="n"/' -i 'configure'
    ./configure --prefix='/usr' --sysconfdir='/etc'
  fi
  local _nproc="$(nproc)"; _nproc=$((_nproc>4?4:_nproc))
  nice make -s -j "${_nproc}"
  set +u
}

package() {
  set -u
  cd "${pkgname}-${pkgver}"
  make -j1 DESTDIR="${pkgdir}/" install
  set +u
}
set +u
