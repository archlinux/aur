pkgname=yltra-flat-icons
pkgver=2.5
pkgrel=1
pkgdesc='A simple flat icon theme, derived from Ultra Flat icons'
arch=('any')
url='https://github.com/kimifetch/yltra-flat-icon-theme'
license=('CCPL:cc-by-nc-sa-4.0')
makedepends=('git')
provides=("${pkgname}")
options=(!strip !emptydirs)
source=('git+https://github.com/kimifetch/yltra-flat-icon-theme.git')
md5sums=('SKIP')

package() {
	# Create base directory 
	install -d -m 755 "${pkgdir}"/usr/share/icons

	local _themefolder=$(basename ${url})
	local _themename="Yltra Flat"

	# Copy folders without spaces in the filename
	find "${srcdir}"/$_themefolder -mindepth 1 -prune -type d ! -name .git -print0 | \
		while read -d $'\0' f; do
			f=$(basename "$f")
			cp -r "${srcdir}"/$_themefolder/"$f" "${pkgdir}"/usr/share/icons/${f// /}
		done

	# Fix index.theme with the space-less name main theme
	find "${pkgdir}" -name index.theme -exec sed -i "s/\(Inherits=\)$_themename/\1${_themename// /}/" {} \;

	# Fix files with a space in their filename, it causes gtk-update-icon-cache to fail
	find "${pkgdir}" -name "* *" \( -type f -o -type l \) -print0 | \
		while read -d $'\0' f; do
			if [[ $f == *unity-control-center* ]]; then
				mv "$f" ${f// /-}
			else
				mv "$f" ${f// /}
			fi
		done

	# Volume icons fix
	find "${pkgdir}" -name "audio-volume-*-panel.svg" -print0 | \
		while read -d $'\0' f; do
			ln -fsr  $f ${f/-panel/}
		done

	# Remove non-essential files
	find "${pkgdir}" \( -name CREDITS -o -name "*.txt" \) -exec rm {} \;

	# License
	install -d -m 755 "${pkgdir}"/usr/share/licenses/${pkgname}
	cp "${srcdir}"/$_themefolder/"$_themename"/LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
	cp "${srcdir}"/$_themefolder/"$_themename"/CREDITS "${pkgdir}"/usr/share/licenses/${pkgname}
}
