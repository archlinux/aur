# Maintainer: Eldeberen <eldeberen@middleearth.fr>
pkgname=cahute
pkgver=0.6
pkgrel=4
pkgdesc="A toolkit to handle communication and file formats related to CASIO calculators"
arch=('x86_64')
url="https://cahuteproject.org"
license=('custom:CeCILL')
depends=('libusb' 'sdl2')
makedepends=('cmake' 'python' 'python-toml')
provides=('p7' 'libp7' 'p7screen' 'p7os' 'cahute')
conflicts=('p7' 'p7screen' 'p7os' 'cahute')
replaces=('p7' 'libp7' 'p7screen')
options=(!strip)
install="$pkgname.install"
source=("https://ftp.cahuteproject.org/releases/$pkgname-$pkgver.tar.gz"
        "2024-12-21-0eb968c38ccdb438803cb6ffa6e1ada818fa66d5.patch"
        "2025-02-14-6a05a70541a39b5c8f4791eaf7bca2f5ca6f9dfc.patch")
b2sums=("686b39fd9857afe5758a4cb95e8b889516d80dc7f02507eedc83bb08f4649ba44f816c8d4e756dce044e3c265316e9f884b069ba78efec182c91b3ce4e4d49fc"
        "ad4c3c6fafcbc7ae20567d326d5a85059296f9b9b4ddf61d4c01addbe7657e0e750b7b15c0ce03e1ac70c09fb4c1da8e7d0c585ef14889679daf482d18096076"
        "0f82c74dfb13c95a6e2ea74661eaf02634763533e0146c8eb29b52839d49bb992ff30643cb686206369c3d2c4c3807e3c4bc719195a00cee28a5cc0003ef526c")

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 <../../2024-12-21-0eb968c38ccdb438803cb6ffa6e1ada818fa66d5.patch
  patch -p1 <../../2025-02-14-6a05a70541a39b5c8f4791eaf7bca2f5ca6f9dfc.patch

  # ensure a clean build
  [[ -d build ]] && rm -rf build
  mkdir build
}

build() {
	cmake -B build -S "$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build --strip

	install -Dm644 "$pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

