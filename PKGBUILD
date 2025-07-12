# Maintainer: envolution
# Contributor: Einhard Leichtfuß <alguien@respiranto.de>
# Contributor: Enrico Morelli <morelli@cerm.unifi.it>
# Contributor: Andrew Engelbrecht <sudoman@ninthfloor.org>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=dict-wn
pkgver=3.1
_srcver=3.0
_debsubver=39
pkgrel=6
pkgdesc="WordNet for dictd et al."
arch=('any')
url="https://wordnet.princeton.edu/"
license=("LicenseRef-custom")
optdepends=('dictd: dict client and server')
makedepends=('dictd' 'python')
provides=('dictd-wn')
conflicts=('dictd-wn')
install="${pkgname}.install"

source=(
  #"https://wordnetcode.princeton.edu/${_srcver}/WordNet-${_srcver}.tar.bz2"
  "http://deb.debian.org/debian/pool/main/w/wordnet/wordnet_${_srcver}-${_debsubver}.debian.tar.xz"
  "http://deb.debian.org/debian/pool/main/w/wordnet/wordnet_${_srcver}.orig.tar.gz"
  "https://wordnetcode.princeton.edu/wn${pkgver}.dict.tar.gz"
)
sha256sums=('0e3001b38c6f77aaa276deff6276c9bbcb31dd17f32a9d2ee30e806bb4315c6e'
            '73572005ef8eb15be48ea1010d18082b80bfbf8684b78ce64bc3abf11db1f95f'
            '3f7d8be8ef6ecc7167d39b10d66954ec734280b5bdcd57f7d9eafe429d11c22a')

prepare() {
  mapfile -t _patch_series <debian/patches/series
  cd "$srcdir/WordNet-$_srcver"
  for _patch in "${_patch_series[@]}"; do
    patch -Np1 -i "../debian/patches/$_patch"
  done
  sed -i '/dictzip -n wn.dict/s/ -n//' contrib/wordnet_structures/Makefile*
  find dict -type d -exec chmod 755 {} + && find dict -type f -exec chmod 644 {} +
}

build() {
  cd "$srcdir/WordNet-$_srcver"
  sed 's:/usr/lib/wordnet/wishwn:/usr/bin/wishwn:g' -i src/wnb
  ./configure --prefix=/usr --mandir=/usr/share/man \
    CFLAGS="${CFLAGS} -std=gnu89 -fPIC -DUSE_INTERP_RESULT -Wno-error=format-security" \
    CXXFLAGS="${CXXFLAGS} -fPIC"
  make

	make -C src/grind/ grind
	make -C dict/dbfiles/
	make -C contrib/wordnet_structures/
}


package() {
	cd "WordNet-${_srcver}"

	install -m 0755 -d "${pkgdir}/usr/share/dictd"
	install -m 0644 -t "${pkgdir}/usr/share/dictd/" \
		contrib/wordnet_structures/wn.{dict.dz,index}

	# Note: The documentation is for the old version.
	install -m 0755 -d "${pkgdir}/usr/share/doc/${pkgname}"
	install -m 0644 -t "${pkgdir}/usr/share/doc/${pkgname}/" \
		AUTHORS COPYING NEWS README

	install -m 0755 -d "${pkgdir}/usr/share/licenses/dict-wn"
	ln -s /usr/share/doc/dict-wn/COPYING "${pkgdir}/usr/share/licenses/dict-wn"
}
# vim:set ts=2 sw=2 et:
