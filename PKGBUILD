# Maintainer: Davide Depau <davide@depau.eu>
# Contributor: goll <adrian.goll+aur[at]gmail>

pkgname=mfoc-nonested-git
pkgver=115.fdd4602
pkgrel=1
pkgdesc="Mifare Classic Offline Cracker (nested attack disabled in code)"
arch=('i686' 'x86_64')
url="https://github.com/nfc-tools/mfoc"
license=('GPL2')
depends=('libnfc>=1.7.0')
makedepends=('git')
provides=('mfoc')
conflicts=('mfoc' 'mfoc-git')
source=("$pkgname"::'git://github.com/nfc-tools/mfoc.git'
        0001-Never-try-nested-attack.patch)
sha1sums=('SKIP'
          'a4de43b1641de38fe73f8a51e57268cefca3a6c5')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  git am < ../0001-Never-try-nested-attack.patch
}

build() {
	cd "${srcdir}/${pkgname}"
	autoreconf -vis
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}" install
}
