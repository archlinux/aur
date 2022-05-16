# Maintainer: antoniovazquezblanco <antoniovazquezblanco@gmail.com>

pkgname="h4bcm_wireshark_dissector-git"
pkgver=0.0.0
pkgrel=0
pkgdesc="Bluetooth H4 Broadcom Wireshark plugin from the InternalBlue project"
arch=('x86_64')
url='https://github.com/seemoo-lab/h4bcm_wireshark_dissector'
icense=('GPL')
depends=('wireshark-cli')
makedepends=('git' 'wireshark-cli' 'cmake')
provides=('h4bcm_wireshark_dissector')
conflicts=('h4bcm_wireshark_dissector')
gitbranch='master'
source=("${pkgname}::git+https://github.com/seemoo-lab/h4bcm_wireshark_dissector.git#branch=${gitbranch}"
	"00-cmake-wireshark-detect.patch"
  "01-wireshark-config-include.patch")
sha512sums=('SKIP'
	 '588f3d1943624ba05a4bae77b45174945b0b03269f45166b889fa22b9ba0d86187bf7bff9d91f1a09a96f38cc95e385c235aa6e2ef51afbe80582c1a2c12607a'
   'ddea854624ae25ff562d7af1eb6369f1ca4324f8b30269c75520f266d7f4a77c8e7c88222cee4ef27cc9492bf527e14c306700fceae559179de6d4066e9d2235')

prepare() {
  cd "$pkgname"
  patch --forward --strip=1 --input="${srcdir}/00-cmake-wireshark-detect.patch"
  patch --forward --strip=1 --input="${srcdir}/01-wireshark-config-include.patch"
}

build() {
  cd "${srcdir}"
  cmake -B build -S "${pkgname}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
  cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
