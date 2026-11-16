# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: Christian Cornelssen
# Contributor: myself600 <myself600 at tuta dot io>
# Contributor: Alex Theotokatos <alex dot theoto at pm dot me>

pkgname=ponscripter
_name="${pkgname}-fork"
epoch=1
pkgver=4.0.1
pkgrel=1
pkgdesc="Fork of the Ponscripter visual novel engine to take advantage of SDL2 and improve Steam integration"
arch=(x86_64)
url="https://github.com/07th-mod/${_name}"
license=("GPL-2.0-or-later")
conflicts=(ponscripter-bin)
depends=(sdl2_{image,mixer} smpeg freetype2)
makedepends=(git xmlto docbook-xsl)

source=("git+${url}.git#tag=v$pkgver")
sha256sums=(SKIP)

build() {
  cd "${_name}"
  ./configure -with-external-sdl-mixer
  make
  sed -i 's/ *//;/^$/d' doc/*.[0-9]	# fix indentation
  A=doc/ponscr-ext.7;sed -i '219d;222,231d;'218r<(sed '287,323!d;287s/^d/D/' $A.xml) $A	# fix ponscr-ext
}

package() {
  cd "${_name}"
  make PREFIX="$pkgdir/usr" install

  for f in BUGS CHANGES MANUAL README.md TODO; do
    install -Dm644 "$f" -t "$pkgdir/usr/share/doc/$pkgname"
  done

  mv "$pkgdir"/usr/{man,share}
}

