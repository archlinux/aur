# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=chrisdone
_gitname=hell
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Haskell-based shell scripting language"

pkgver=2026.05.02
pkgrel=1
_gitversion=${pkgver//\./-}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url='https://chrisdone.github.io/hell/'

license=('BSD-3-Clause')

provides=("${_appname}")
conflicts=("${_appname}")

makedepends=('git')
depends=('glibc' 'libgcc')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/docs/readme.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('48113def1f44d3cd5067b4965fbb7ee677bb7b096cc45047179fb1fa23fd773c'
            '317fa73085a455f60eb9c8d7f558545dd0377c6e9d4e9e362a6ed1d72d242f99')
sha256sums_x86_64=('9e25d8981edb78fdb30c29c4c1bb93dad6a71b5698b8bbc26f0cedd8fcbcddd2')
sha256sums_aarch64=('c129e2402995218ba7405de83c31ff782dd53d5431d0770f1dbd83f905e799b2')


prepare() {
	cd "${srcdir}/" || exit

	rm -rf git && git clone -n --depth=1 --filter=tree:0 "${_ghurl}" git && cd git

	git sparse-checkout set --no-cone /examples && git checkout
}

build() {
	cd "${srcdir}/" || exit

	SHEBANG='#!/usr/bin/env hell'

	for file in git/examples/*.hell; do
	# Only process regular files
	if [[ -f "${file}" ]]; then
		# Check if the file already has a shebang to avoid duplicates
		if head -n 1 "${file}" | grep -q "^#!"; then
			msg2 "Skipping '${file}': already has a shebang."
			continue
		fi

		sed -i "1i $SHEBANG" "${file}"
		msg2 "Updated '${file}'."
	fi
done
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	for example in git/examples/*.hell; do
		install -Dm755 ${example} -t "${pkgdir}/usr/share/doc/${pkgname}/examples/"
	done

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
