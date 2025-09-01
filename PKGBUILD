# Maintainer: Kimiblock Moe

pkgname=hmcl-portable
pkgver=3.6.16
pkgrel=1
pkgdesc="A Minecraft Launcher which is multi-functional, cross-platform and popular. Sandboxed by portable."
arch=(any)
url="https://hmcl.huangyuhui.net"
license=(Apache)
makedepends=(
	hmcl
)
depends+=(hicolor-icon-theme)
source=(
        net.huangyuhui.hmcl.desktop
        start.sh
        portable-config)
sha256sums=('744da95283655004d6e231cca886587a9abd3fef47d181b6be3988b21661ad03'
            '1857c88af6ec87898383eb7d4672dfe008311d18f74cb78e29dbf860ac5d72d7'
            'a3ee3b0e3cee5ff1000b7ba0f9d2d37c93616d06ba22c531683f5b0799210906')

function prepare() {
	pacman -Ql hmcl >file.list
}

function package() {
	provides+=("hmcl" "net.huangyuhui.hmcl")
	conflicts+=("hmcl")
	depends+=('portable' 'java-runtime')

	while IFS= read -r line; do
	file="$(echo "$line" | awk '{print $2}')"
	if [[ -d ${file} ]]; then
		echo "Omitting Directory"
	else
		install -Dm755 "${file}" "${pkgdir}/${file}"
	fi
	done < file.list
	rm -f "${pkgdir}/usr/share/applications"/*
	rm -f "${pkgdir}/usr/bin"/*
	install -vDm755 "${srcdir}/portable-config" "${pkgdir}/usr/lib/portable/info/net.huangyuhui.hmcl/config"
	install -vDm644 "${srcdir}/net.huangyuhui.hmcl.desktop" -t "${pkgdir}/usr/share/applications"
	install -vDm755 "${srcdir}/start.sh" "${pkgdir}/usr/bin/hmcl-portable"
}

