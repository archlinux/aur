# Maintainer: Your Name <nikita6@bk.ru>
pkgname=cheat-asm-git
_gitname="CheatASM"
pkgver=v0.1.r0.g87236e8
pkgrel=1
pkgdesc="Cheat Assembler/Disassembler for Atmosphere Cheat Codes"
arch=('any')
url="https://github.com/tslater2006/${_gitname}"
license=('GPL2')
depends=(dotnet-runtime)
makedepends=(dotnet-sdk git)
source=(
    "git+https://github.com/tslater2006/${_gitname}.git"
    "dotnet7.patch"
)
sha256sums=('SKIP'
            '2d2c4c9d6b873239ef6bbb80c3f554d04f46da863a5aa08eea385d5f76aaaeb3')

pkgver() {
    cd "${_gitname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${_gitname}"
    patch -Np1 -i "${srcdir}/dotnet7.patch"
}

build() {
	cd "${_gitname}"
    dotnet build --configuration publish --output "artifacts" CheatASM
    dotnet build --configuration release --output "artifacts" CheatASM
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

package() { 
  mkdir -p "${pkgdir}/usr/share/"
  cp -r "${srcdir}/${_gitname}/artifacts/" "${pkgdir}/usr/share/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/usr/share/${pkgname}/CheatASM" "${pkgdir}/usr/bin/CheatASM"

  # Licenses
  install -Dm644 "${srcdir}/${_gitname}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
