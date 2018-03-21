# Maintainer : Fredy García <frealgagu at gmail dot com>
# Contributor: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: JIN Xiao-Yong <jinxiaoyong@gmail.com>
# Contributor: bohoomil <@zoho.com>

pkgname=freetype2-infinality
pkgver=2.9
pkgrel=1
pkgdesc="Font rasterization library with Infinality patches and custom settings."
arch=("armv7h" "i686" "x86_64")
license=("GPL")
url="http://www.${pkgname%2-infinality}.org/"
# adding harfbuzz for improved OpenType features auto-hinting
# introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
depends=("bzip2" "harfbuzz" "libpng" "sh" "zlib")
makedepends=("libx11")
conflicts=("${pkgname%-infinality}")
provides=("${pkgname%-infinality}=${pkgver}" "${pkgname}-ultimate" "lib${pkgname%2-infinality}.so")
install="${pkgname%-infinality}.install"
backup=("etc/profile.d/${pkgname%-infinality}.sh")
source=(http://download.savannah.gnu.org/releases/${pkgname%2-infinality}/${pkgname%2-infinality}-${pkgver}.tar.gz{,.sig}
        http://download.savannah.gnu.org/releases/${pkgname%2-infinality}/${pkgname%2-infinality}-doc-${pkgver}.tar.gz{,.sig}
        "${pkgname%-infinality}.sh::https://raw.githubusercontent.com/archfan/infinality_bundle/master/01_${pkgname%-infinality}-iu/${pkgname%-infinality}.sh")
sha256sums=("bf380e4d7c4f3b5b1c1a7b2bf3abb967bda5e9ab480d0df656e0e08c5019c5e6"
            "06460168615c4c69293e4126c7e69731b7cc7d4db5470bca3cb95c05807993e2"
            "9312f7d2e5c798684d39e1fecddfed8e29d2102f035c4bd765157e2d077175f8"
            "37c0ee3d983769a50a33292f547bec8d0dc064da62090dd7690bedf2d1dba7d0"
            "f7f8e09c44f7552c883846e9a6a1efc50377c4932234e74adc4a8ff750606467")
validpgpkeys=("58E0C111E39F5408C5D3EC76C1A60EACE707FDA5")

build() {
  cd "${pkgname%2-infinality}-${pkgver}"
  ./configure --prefix=/usr --disable-static
  make
}

check() {
  cd "${pkgname%2-infinality}-${pkgver}"
  make -k check
}

package() {
  cd "${pkgname%2-infinality}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../${pkgname%-infinality}.sh "${pkgdir}/etc/profile.d/${pkgname%-infinality}.sh"

  # Package docs
  install -dm755 "${pkgdir}/usr/share/doc"
  cp -a docs "${pkgdir}/usr/share/doc/${pkgname}"
}
