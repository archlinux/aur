# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=profullstack
_gitname=diskpush
_appname=${_gitname}
pkgname=${_gitname}-bin
pkgdesc="Push files fast. Sync only what changed."

pkgver=0.17.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('bash' 'expat' 'libdrm' 'libcups' 'libx11' 'nodejs' 'libgcc' 'nspr' 'cairo' 'systemd-libs' 'nss' 'at-spi2-core' 'libxkbcommon' 'mesa' 'alsa-lib' 'glibc' 'libxcomposite' 'libxext' 'libxcb' 'libxfixes' 'pango' 'glib2' 'libxdamage' 'gtk3' 'dbus' 'libxrandr' 'hicolor-icon-theme')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.deb")
sha256sums=('f7f0d5a12f8209b5445d1e948f73ade0a227901d6b35900a88fd7559b9b69751'
            'de1b680e8cf8ebf3641646e14f5c0730f726da2d9d6d211d498032c20d0d9e2c')
sha256sums_x86_64=('698db0de9d197203c04b5e6cc12da18bd187e0eae4c783c9de288a5c48b1a9c7')


prepare() {
	cd "${srcdir}/" || exit

	rm -rf git && git clone -n --depth=1 --filter=tree:0 "${_ghurl}" git

	cd git && git sparse-checkout set --no-cone /docs && git checkout

	cp -rfa docs "${srcdir}/" && cd .. && rm -rf git
}

package() {
	cd "${srcdir}/" || exit

	tar -xf "data.tar.xz" --hard-dereference -C "${pkgdir}"

	rm -rf "${pkgdir}/usr/share/doc/"

	mv "${pkgdir}/opt/"*"/" "${pkgdir}/opt/${_appname}"
	sed -e "s|Exec=/opt/.*/${_appname}-desktop|Exec=/opt/${_appname}/${_appname}-desktop|g" -i "${pkgdir}/usr/share/applications/"*".desktop"

	install -dm755 "${pkgdir}/usr/bin/"
	ln -sf "/opt/${_appname}/${_appname}-desktop" "${pkgdir}/usr/bin/${_appname}-desktop"

	install -Dm755 /dev/stdin "$pkgdir/usr/bin/${_appname}" << END
#!/usr/bin/env sh
exec "/opt/${_appname}/resources/cli/${_appname}" "\$@"
END

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	for doc in docs/*.md; do
		install -Dm644 "${doc}" "${pkgdir}/usr/share/doc/${pkgname}/$(name=$(basename "${doc}" .md); echo "${name^^}.md")"
	done

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
