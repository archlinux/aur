# Maintainer: Miroslav Koškár <http://mkoskar.com/>
# Contributor: David Runge <dave@sleepmap.de>

_name='Fundamental'
# according to plugin.json, this is already somehow 1.0.1.. but oh well... yolo
_commit='770e045d2a466fd40524d04077f93c80d6c495f8'

pkgname=vcvrack-fundamental
pkgver=0.6.0+99+g770e045
pkgrel=1
pkgdesc='Fundamental VCV modules'
url="https://github.com/VCVRack/Fundamental"
license=('CCPL' 'BSD')
arch=('x86_64')
depends=('vcvrack' 'libsamplerate')
makedepends=('git' 'jq' 'zip')
source=("${_name}-${pkgver}::git+https://github.com/VCVRack/$_name.git#commit=${_commit}")
sha512sums=('SKIP')

pkgver() {
  cd "${_name}"-"${pkgver}"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd "${_name}"-"${pkgver}"
  # removing static lib stuff
  sed -e '7,20d' -i Makefile
}

build() {
  # define RACK_DIR, so Makefile snippets can be found
  export RACK_DIR="/usr/share/vcvrack"
  # define FLAGS, so headers can be included
  export FLAGS="-I/usr/include/vcvrack -I/usr/include/vcvrack/dep"
  # exporting LDFLAGS for libsamplerate, as the Delay module requires it
  export LDFLAGS="$(pkg-config --libs samplerate) ${LDFLAGS}"
  cd "${_name}"-"${pkgver}"
  USE_SYSTEM_LIBS=true make
  USE_SYSTEM_LIBS=true make dist
}

package() {
  cd "${_name}"-"${pkgver}"
  install -vDm 644 "dist/${_name}"*".zip" \
    "${pkgdir}/opt/vcvrack/${_name}.zip"
  install -vDm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -vDm 644 {CHANGELOG,README}.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
