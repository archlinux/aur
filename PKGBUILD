# Maintainer: MGislv <nocentinigabriele91@gmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=neix
pkgver=0.1.5
pkgrel=4
pkgdesc='RSS/Atom feed reader for your terminal'
arch=('i686' 'x86_64')
url='https://github.com/qw3rtty/neix'
license=('GPL3')
conflicts=('neix-git')
depends=('ncurses' 'curl')
makedepends=('cmake' 'git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('85db547eba97b112895abd998f7f597a425aff5e37e917052c7c4fff3d7a8b14bf3c5704abc60ac6b3a9f6d7c25d0d690c64c06407927015036c2b733d18d7db')

prepare() {
	cd "${pkgname}-${pkgver}"
	sed -i 's/openCmd += " ";/openCmd += " '"'"'";/g' src/application/Application.cpp
	sed -i '501i openCmd += "'"'"'";' src/application/Application.cpp
}

build() {
	cmake -B build \
	      -S "${pkgname}-${pkgver}" \
	      -DCMAKE_BUILD_TYPE=None \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_INSTALL_LIBDIR=lib \
	      -DENABLE-TESTS=ON
	make -C build
}

check() {
	cd build
	./bin/tests
}

package() {
	DESTDIR="${pkgdir}" make -C build install
	install -Dm644 "${pkgname}-${pkgver}/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
