# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=PerryTS
_pkgname=perry
pkgname=${_pkgname}-bin
pkgdesc="Native TypeScript compiler that compiles TypeScript to native executables"

pkgver=0.5.1182
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

url="https://www.perryts.com/"
_ghurl="https://github.com/${_pkgauthor}/${_pkgname}"
__ghurlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

makedepends=('git')
depends=('bash' 'glibc' 'libgcc' 'xz' 'bzip2')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

options=(!strip)

source=("README-${pkgver}.md::${__ghurlraw}/README.md"
		"LICENSE-${pkgver}::${__ghurlraw}/LICENSE"
		"tests.patch")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}.tar.gz")
sha256sums=('74ff6b3bc76918cf0db8ca82d0c3ed79342abec8c1a9b031d948f6225f2c756a'
            'c871483477d7105432645affac5be5edbd92b41a6faedb4c692e0681e46ada09'
            'dfdebdfbae47153c486750ce859fe5b1b1fdab83a876feed07551ddf1502cb47')
sha256sums_x86_64=('d1f31b809df5c4ff35ea55f3af1b4c85a5eb31a3df5763beba6de4b3d5ea229b')
sha256sums_aarch64=('d83526f3c2cc437ce163d70eccb8034e6484017d02f943b60e7711ae3a814b0a')


prepare() {
	cd "${srcdir}/" || exit

	rm -rf git && git clone -n --depth=1 --filter=tree:0 "${_ghurl}" git && cd git

	git sparse-checkout set --no-cone /tests/wasm && git checkout

	patch -p1 < ../tests.patch
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 -t "${pkgdir}/usr/bin/" ./${_pkgname}

	install -Dm644 -t "${pkgdir}/usr/lib/" ./lib*.a

	install -dm755 "${pkgdir}/usr/share/${_pkgname}/tests/"
	cp -rf ./git/tests/wasm/* "${pkgdir}/usr/share/${_pkgname}/tests/"

	install -Dm644 "./README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "./LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
