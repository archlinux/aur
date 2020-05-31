# Maintainer: nycex <nycex / cccp.org>
_pkgbasename=zls
pkgname=${_pkgbasename}-git
pkgrel=1
pkgver=r292.585ae07
pkgdesc="Zig LSP implementation + Zig Language Server"
arch=('any')
url="https://github.com/zigtools/${_pkgbasename}"
license=('MIT')
depends=('zig')
source=(git+https://github.com/zigtools/${_pkgbasename}
        git+https://github.com/ziglibs/known-folders)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
	cd "${srcdir}/${_pkgbasename}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgbasename}"
  git submodule init
  git config submodule.known-folders.url "$srcdir"/known-folders
  git submodule update
}

build() {
	cd "${srcdir}/${_pkgbasename}"
	zig build -Drelease-fast
}

package() {
	cd "${srcdir}/${_pkgbasename}"

	install -D -m755 zig-cache/bin/$_pkgbasename "${pkgdir}/usr/bin/$_pkgbasename"
	install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/$_pkgbasename/LICENSE"
}
