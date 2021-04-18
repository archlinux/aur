# Maintainer: Popolon <popolon@popolon.org>
# Contributor: Miroslav Koškár <http://mkoskar.com/>
# Contributor: David Runge <dave@sleepmap.de>

_name='Fundamental'

pkgname=vcvrack-fundamental
pkgver=1.4.0
pkgrel=1
pkgdesc='Fundamental VCV modules'
url="https://github.com/VCVRack/Fundamental"
license=('Custom' 'GPL3')
arch=('x86_64')
depends=('vcvrack' 'libsamplerate')
makedepends=('git' 'jq' 'zip')

source=("https://github.com/VCVRack/Fundamental/archive/v${pkgver}.tar.gz")
sha512sums=('32fa69f239ea92689a267f517398ab01b1c6cf7bd8899410e1e63d915378bed237ee72016eb882d0faebd504ef56cc632b3c779233d141289041fd3943b26aec')

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
#  install -vDm 644 "dist/${_name}"*".zip" \
#    "${pkgdir}/opt/vcvrack/${_name}.zip"
  install -d "$pkgdir/opt/vcvrack/plugins/$_name"
  cp -dr --preserve=mode -t "$pkgdir/opt/vcvrack/plugins/$_name" \
      res plugin.so plugin.json
  install -vDm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -vDm 644 LICENSE-GPLv3.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -vDm 644 {CHANGELOG,README}.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
