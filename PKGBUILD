# Maintainer: Popolon <popolon@popolon.org>
# Contributor: Miroslav Koškár <http://mkoskar.com/>
# Contributor: David Runge <dave@sleepmap.de>

_name='Fundamental'

pkgname=vcvrack-fundamental
pkgver=1.3.1
pkgrel=1
pkgdesc='Fundamental VCV modules'
url="https://github.com/VCVRack/Fundamental"
license=('Custom' 'GPL3')
arch=('x86_64')
depends=('vcvrack' 'libsamplerate')
makedepends=('git' 'jq' 'zip')

source=("https://github.com/VCVRack/Fundamental/archive/v${pkgver}.tar.gz")
sha512sums=('d766d142b27c76da039f905a0144dadc068b5f6bbbd52b6d80d937f4f4f896ce292902ed815f7e369ac522c52c90d913ff4dc0d76378728b875917ff4239f909')

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
  install -vDm 644 LICENSE-dist.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -vDm 644 LICENSE-GPLv3.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -vDm 644 {CHANGELOG,README}.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
