# Maintainer:  Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Hokum <hokum_at_mail_dot_ru>

_pkgname="gptfdisk"
pkgname="${_pkgname}-git"
pkgver=1.0.4.r177.g4cd84de
pkgrel=1
pkgdesc='A text-mode partitioning tool that works on Globally Unique Identifier (GUID) Partition Table (GPT) disks - GIT Version'
arch=('i686' 'x86_64')
url='http://www.rodsbooks.com/gdisk/'
license=('GPL2')
depends=('gcc-libs' 'util-linux' 'popt' 'ncurses')
makedepends=('git')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('strip' '!emptydirs' 'zipman' '!libtool' 'docs')
_srcdir="${_pkgname}"
source=("gptfdisk::git+http://git.code.sf.net/p/gptfdisk/code#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${_srcdir}"

  local _ACTUAL_VER
  _ACTUAL_VER="$(grep -e '#define GPTFDISK_VERSION' "${srcdir}/${_pkgname}/support.h" | awk '{print $3}' | sed -e 's|"||g')"
  echo "${_ACTUAL_VER}.r$(git rev-list --count HEAD).g$(git describe --always)" | sed -e 's|-|.|g'
}

prepare() {
  cd "${_srcdir}"

  git clean -x -d -f
  echo

  git reset --hard
  echo

  sed -e 's|ncursesw/ncurses.h|ncurses.h|g' -i 'gptcurses.cc'
}

build() {
  cd "${_srcdir}"
  make V=1
  echo
}

package() {
  cd "${_srcdir}"
  install -Dpm0755 'gdisk' 'cgdisk' 'sgdisk' 'fixparts' -t "${pkgdir}/usr/bin"
  install -Dpm0644 'gdisk.8' 'cgdisk.8' 'sgdisk.8' 'fixparts.8' -t "${pkgdir}/usr/share/man/man8"

  install -Dpm0644 'README' 'NEWS' -t "${pkgdir}/usr/share/${_pkgname}"
}
