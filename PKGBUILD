# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: jtts <jussaar@mbnet.fi>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Franco Tortoriello <franco.tortoriello@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

set -u
pkgname=libtirpc
pkgver=1.3.8
pkgrel=2
pkgdesc="Transport Independent RPC library (SunRPC replacement)"
arch=('x86_64')
url="https://git.linux-nfs.org/?p=steved/libtirpc.git;a=summary"
license=('SISSL' 'BSD-3-Clause')
depends=('krb5' 'glibc')
depends+=('e2fsprogs')
depends=("${depends[@]/#/lib32-}")
depends+=("libtirpc>=${pkgver%%.r*}")
# git tree: git://linux-nfs.org/~steved/libtirpc
_srcdir="${pkgname}-${pkgver%%.r*}"
#_tag=5bd87617e4b3129e76e79847c95bdea4b1290d9f
source=(https://downloads.sourceforge.net/sourceforge/libtirpc/${_srcdir}.tar.bz2)
sha1sums=('fe35ce7e81ccfa974c74ced9ac725207af9fa318')
sha512sums=('390c06b8beeb2b0110ab68953d23fef10c823f598146c7fcebce0cb461d6112d0163eded09fd0b5d3e82d0e189a48184ab3d09b994a41f5cbe4799c16eb1a117')

if [ ! -z "${_tag:-}" ]; then
  source[0]="git://git.linux-nfs.org/projects/steved/libtirpc.git#tag=${_tag}"
  sha1sums[0]='SKIP'
  sha512sums[0]='SKIP'
  makedepends=('git')
  _srcdir="${pkgname}"
pkgver() {
  cd "${_srcdir}"
  #git describe --tags | sed 's/libtirpc-//; s/-/./g'
  git describe --long --tags --abbrev=7 | sed -e 's/libtirpc-//' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
}
elif [[ "${pkgver}" = *.r* ]]; then
pkgver() {
  printf '%s\n' "${pkgver%%.r*}"
}
fi

pkgname="lib32-${pkgname}"

prepare() {
  cd "${_srcdir}"
  # git cherry-pick -n d473f1e1f6ba80bfaee4daa058da159305167323 # gcc 15
  # git cherry-pick -n 240ee6c774729c9c24812aa8912f1fcf8996b162 # gcc 15
  chmod +x 'autogen.sh'
}

build() {
  cd "${_srcdir}"
  export CC='gcc -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig
if [ ! -s 'configure' ]; then
  ./autogen.sh
fi
if [ ! -s 'Makefile' ]; then
  ./configure --prefix=/usr --sysconf=/etc \
    --libdir=/usr/lib32
fi
  make
}

package() {
  cd "${_srcdir}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/{etc,usr/{include,share}}
  install -dm 755 "${pkgdir}"/usr/share/licenses/lib32-libtirpc
  install -m 644 COPYING -t "${pkgdir}"/usr/share/licenses/lib32-libtirpc/
}
set +u

# vim: ts=2 sw=2 et:
