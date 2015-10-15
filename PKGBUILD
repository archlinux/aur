# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: 2ion <dev@2ion.de>

# 2.2.1 doesn't build yet

set -u
pkgname='miller'
pkgver='2.2.0'
pkgrel='1'
pkgdesc="Miller is like sed, awk, cut, join, and sort for name-indexed data such as CSV"
arch=('x86_64' 'i686')
url='https://github.com/johnkerl/miller'
license=('MIT')
depends=('glibc')
makedepends=('make' 'gcc' 'flex' 'ctags' 'valgrind' 'asciidoc')
_verwatch=("${url}/releases" "${url#*github.com}/archive/v\(.*\)\.tar\.gz" 'l')
_srcdir="${pkgname}-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('65bebfc393a95ba3677a5d11536540db0c48bda0657b8570b65bda1f4a946c1d')

build() {
  set -u
  cd "${_srcdir}"
  make -s -j "$(nproc)"
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  # make install is broken. It remakes some of the sources for no reason.
  if ! :; then
    install -d "${pkgdir}/usr/bin"
    make INSTALLDIR="${pkgdir}/usr/bin" DESTDIR="${pkgdir}" MANDIR='/usr/share/man/man1' install
  else
    install -Dpm755 'c/mlr' -t "${pkgdir}/usr/bin/"
    install -Dpm644 'doc/miller.1' -t "${pkgdir}/usr/share/man/man1/"
  fi
  set +u
}
set +u
