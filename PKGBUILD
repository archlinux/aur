# Maintainer: Popolon <popolon@popolon.org
# Contributor: Miroslav Koškár <http://mkoskar.com/>

_basename='vcvrack'
_plugname='ESeries'

pkgname=vcvrack-eseries-git
pkgver=r39.e584aa6
pkgrel=1
pkgdesc="E-Series VCV modules"
url='https://github.com/vcvrack/eseries'
license=('GPL3')
arch=(i686 x86_64)
depends=(vcvrack)
makedepends=(git)

source=(
    "$_basename-$_plugname::git+https://github.com/$_basename/$_plugname.git"
)
sha256sums=(
    SKIP
)

pkgver() {
    cd "$_basename-$_plugname"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" \
                    "$(git rev-parse --short HEAD)"
}

build() {
  # define RACK_DIR, so Makefile snippets can be found
  export RACK_DIR="/usr/share/vcvrack"
  # define FLAGS, so headers can be included
  export FLAGS="-I/usr/include/vcvrack -I/usr/include/vcvrack/dep"
  # exporting LDFLAGS for libsamplerate, as the Delay module requires it
  export LDFLAGS="$(pkg-config --libs samplerate) ${LDFLAGS}"
  cd "${_basename}-${_plugname}"
  USE_SYSTEM_LIBS=true make
  USE_SYSTEM_LIBS=true make dist
}

package() {
  cd "${_basename}-${_plugname}"
  install -vDm 644 "dist/${_plugname}"*".zip" \
    "${pkgdir}/opt/vcvrack/${_plugname}.zip"
  install -vDm 644 LICENSE-GPLv3.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -vDm 644 {CHANGELOG,README}.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
