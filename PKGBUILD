# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Daniel Menelkir <dmenelkir at gmail dot com>
# Contributor: Muhammad Herdiansyah <herdiansyah@netc.eu>
# Contributor: Alexander Keller <git@nycroth.com>

pkgname="sinit"
pkgver=1.1
pkgrel=4
pkgdesc="A simple suckless init"
url="https://core.suckless.org/sinit"
arch=('x86_64' 'i686')
license=('MIT')
makedepends=('git')
depends=('glibc')
install="${pkgname}.install"
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}::git+https://git.suckless.org/sinit#tag=v${pkgver}"
        "${pkgname}.install")
b2sums=('266b800993c83c74bf8cd19ad124ee14d2653cf2bda77334756e7198180dc1e7d7f4053b6aafa515d4ac8510a3af4adce722ee6838a9a67bbf8bc85fb2fbe7e6'
        'b05835138d6c6e6d3a1f95dc8c02cb27a7317268111cb64b30480511e17157356c81bf0d75822d4ba343c299773ee36a7e7260f7fcb948ae5ac538a3ba71ab38')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  cp -f "config.def.h" "config.h"
  sed -i 's|bin|usr/bin|g' "config.h"

  sed -i 's/^\(CFLAGS\|LDFLAGS\)\s*= \(\S.*\)/\1 ?= \2/' config.mk
  sed -i 's/\$(CC)\s*\$(LDFLAGS)/$(CC) $(CFLAGS) $(LDFLAGS)/' Makefile
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" PREFIX='/usr' install
  install -Dm644 "README"  "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
