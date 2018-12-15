# Maintainer: Frederic Bezies < fredbezies at gmail dot com >
# Maintainer: Mario Rodas <marsam@users.noreply.github.com>

pkgname=watchman-git
_gitname=watchman
pkgver=v4.9.0.r566.g1d4d1bf4
pkgrel=1
pkgdesc='Watches files and records, or triggers actions, when they change.'
arch=('i686' 'x86_64')
url='https://facebook.github.io/watchman/'
license=('Apache')
depends=('pcre' 'openssl')
makedepends=('git')
conflicts=('watchman')
options=('!libtool' 'staticlibs')
provides=()
source=("${_gitname}::git+https://github.com/facebook/watchman.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_gitname}"
  ./autogen.sh
  ./configure --prefix=/usr \
              --with-pcre \
              --without-python \
              --enable-statedir="/var/lib/${_gitname}"\
               --enable-lenient # to work around a gcc 8.x bug ; https://github.com/facebook/watchman/issues/638
  make
}

check() {
  cd "${srcdir}/${_gitname}"
  make check
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="${pkgdir}" install
}

# Local Variables:
# compile-command: "makepkg -sm && mksrcinfo"
# End:# Maintainer: Mario Rodas <marsam@users.noreply.github.com>

