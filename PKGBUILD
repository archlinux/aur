# Maintainer: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>

pkgname=musixmatch-bin
_pkgname="${pkgname%-bin}"
pkgver='3.10.4043_master.20200211001'
pkgrel=5
pkgdesc='Lyrics for your music'
arch=('x86_64')
url='https://about.musixmatch.com/apps'
license=('custom')
depends=(
	'dconf'
	'desktop-file-utils'
	'electron9'
	'hicolor-icon-theme'
	'libnotify'
	'libxtst'
	'nss'
)
optdepends=('spotify: Instant synchronized lyrics')
source=("https://download-app.musixmatch.com/download/${_pkgname}_${pkgver/_/-}_amd64.deb")
b2sums=('85272ec57171512476f293b0b411427118bb75aa536703faf337f4d516006ed23a386f62f0fa83fdd040ecda7d77ceb38f89801da8dba84ddb0ba50a0d187094')

prepare() {
	tar \
		--extract \
		--file data.tar.xz
	sed --in-place 's/;x-scheme-handler\/mxm//' "usr/share/mime/packages/${_pkgname}.xml"
	sed --in-place 's/\/opt\/Musixmatch\///' "usr/share/applications/${_pkgname}.desktop"
}

package() {
	mv 'usr' "${pkgdir}"
	install -D 'opt/Musixmatch/resources/app.asar' --target-directory "${pkgdir}/usr/lib/${_pkgname}"
	echo -e '# Musixmatch EULA\n<https://about.musixmatch.com/eula>' | install -D /dev/stdin "${pkgdir}/usr/share/licenses/${_pkgname}/eula.md"
	echo -e "#!/bin/sh\n\nexec electron9 /usr/lib/${_pkgname}/app.asar \"\$@\"" | install -D --mode 755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}"
}
