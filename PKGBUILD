# Maintainer: Desmond Kabus <desmond.kabus@protonmail.com>

pkgbase=bigjubeldesktop-git
pkgname=bigjubeldesktop-git
_module='bigjubeldesktop'
pkgver=0.1.0.r1.g2b8b27b
pkgrel=1
pkgdesc="Desktop client for BigJubel: calculate current jubilees"
url="https://www.kabus.eu/git/bigjubeldesktop"
depends=('bigjubelweb' 'electron')
makedepends=('npm' 'git' 'imagemagick')
provides=('bigjubeldesktop')
conflicts=('bigjubeldesktop')
license=('GPL')
arch=('any')
source=(
	"bigjubeldesktop::git://www.kabus.eu/git/bigjubeldesktop"
	"logo.png::https://www.kabus.eu/bigjubel/static/logo32.png"
	"exec.sh"
	"bigjubel.desktop"
)
md5sums=('SKIP' '67bbdfd42a1436d5e49ed394a0027524' '2b8d2457541968447f28de29a319aac1' '22d907a051651f77f014544a7a015440')

pkgver() {
    cd "${srcdir}/${_module}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

package() {
    npm install -g --user root --prefix "${pkgdir}/usr" $(npm pack "${srcdir}/${_module}" | tail -1)

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

	# Some extras
	install -Dm755 "${srcdir}/exec.sh" "${pkgdir}/usr/local/bin/${_module}"
	install -Dm644 "${srcdir}/bigjubel.desktop" -t "${pkgdir}"/usr/share/applications/
	install -Dm644 "${srcdir}/${_module}/LICENSE" -t "${pkgdir}/usr/share/licenses/${_module}"

	# Icons
	cd "${srcdir}"
	for i in 16 24 32 48 64 96 128 256 512; do
		convert logo.png -filter point -resize ${i}x${i} i.png
		install -Dm644 i.png "${pkgdir}"/usr/share/icons/hicolor/${i}x${i}/apps/${_module}.png
	done

	# npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
