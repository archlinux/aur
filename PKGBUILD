# Maintainer: Miroslav Koškár <http://mkoskar.com/>
# Contributor: David Runge <dave@sleepmap.de>

_name='Befaco'
# upstream doesn't tag properly any more (plugin.json suggests the version is
# currently at 1.0.0) because yolo
_commit='31da1ab46d698e6a89867b7a10251870e1d8aa91'

pkgname='vcvrack-befaco'
pkgver=0.6.0+21+g31da1ab
pkgrel=1
pkgdesc="Rack plugins based on Befaco Eurorack modules"
url='https://github.com/VCVRack/Befaco'
license=('BSD')
arch=('x86_64')
depends=('vcvrack')
makedepends=('git' 'jq' 'zip')
install="$pkgname.install"
source=("${_name}-${pkgver}::git+https://github.com/VCVRack/${_name}.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "${_name}"-"${pkgver}"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd "${_name}"-"${pkgver}"
}

build() {
  # define RACK_DIR, so Makefile snippets can be found
  export RACK_DIR="/usr/share/vcvrack"
  # define FLAGS, so headers can be included
  export FLAGS="-I/usr/include/vcvrack -I/usr/include/vcvrack/dep"
  cd "${_name}"-"${pkgver}"
  USE_SYSTEM_LIBS=true make
  USE_SYSTEM_LIBS=true make dist
}

package() {
  cd "${_name}"-"${pkgver}"
  install -vDm 644 "dist/${_name}"*".zip" \
    "${pkgdir}/opt/vcvrack/${_name}.zip"
  install -vDm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
