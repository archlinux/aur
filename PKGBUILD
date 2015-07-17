# Maintainer: peter1000 <https://github.com/peter1000>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: cataphract <mail at geleia dot net>
# Contributor: lluixhi <lluixhi at gmail dot com>

_srcname=x265
pkgname=${_srcname}-hg_p
pkgrel=1
pkgver=1.7.r357.b2ba7df1fc69
pkgdesc="CLI tools for encoding H265/HEVC video streams."
arch=('i686' 'x86_64')
license=('GPL')
depends=('gcc-libs')
makedepends=('yasm' 'cmake' 'mercurial')
url="https://bitbucket.org/multicoreware/x265"
conflicts=('x265' 'x265-hg' 'x265-10bit')
provides=('x265' 'libx265.so')
replaces=()
source=("${_srcname}::hg+https://bitbucket.org/multicoreware/x265")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_srcname}"
  echo "$(hg log -r. --template "{latesttag}").r$(hg log -r. --template "{latesttagdistance}").$(hg log -r. --template "{node|short}")"
}

build() {
  cd "${srcdir}/${_srcname}"/build/linux
  [[ $CARCH == x86_64 ]] && LDFLAGS+=',-z,noexecstack'
  cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=/usr ../../source -DHIGH_BIT_DEPTH=1
  make
}

package() {
  cd "${srcdir}/${_srcname}"/build/linux
  make DESTDIR="${pkgdir}" install  
}
