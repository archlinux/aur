pkgname=otf-operator-mono-lig
_pkgname=operator-mono-lig
pkgver=2.4.2
pkgrel=1
pkgdesc='Add ligatures to Operator Mono similar to Fira Code'
arch=('x86_64' 'arm64')
url="https://github.com/kiliman/operator-mono-lig"
license=('MIT')
makedepends=(
	'npm'
	'python-fonttools'
	'python2'
)
# markdown license generated using:
# curl https://www.typography.com/requests/policies/eula.json | jq .content.markdown | sed -e 's/^"//' -e 's/"$//' -e 's/\\n/\n/g' > hoefler-co-eula.md
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	"hoefler-co-eula.md"
)
sha256sums=('f66cc609655e9cc3426bc0e6c058c6528db9ccc25a58c841c34ba6a99dbd249a'
            '820160042b3a26add024ad21f0cb93e2898d96f4558a6b2cdd0c988c7601eadd')

prepare(){
	cd "${srcdir}/$_pkgname-$pkgver"
	npm i
	rm -rf original/
	ln -s ../../place-your-otfs-here original
}

build() {
	cd "${srcdir}/$_pkgname-$pkgver"
	./build.sh
}

package() {
	mkdir -p "${pkgdir}/usr/share/fonts/OTF/" \
		 "${pkgdir}/usr/share/licenses/otf-operator-mono-lig/"
	install -Dm644 "${srcdir}/hoefler-co-eula.md" \
		      "${pkgdir}/usr/share/licenses/otf-operator-mono-lig/"
	install -Dm644 "${srcdir}/$_pkgname-$pkgver/LICENSE" \
		      "${pkgdir}/usr/share/licenses/otf-operator-mono-lig/"
	find "${srcdir}/$_pkgname-$pkgver/build/" -name *.otf \
		-exec install -Dm644 {} "${pkgdir}/usr/share/fonts/OTF/" ";"
}
