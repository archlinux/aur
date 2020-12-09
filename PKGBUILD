pkgname=nautilus-columns-git
pkgver=0.12
pkgrel=1
_pkgname=nautilus-columns
pkgdesc="Nautilus extension to display music/EXIF and PDF metadata info in the Nautilus List View."
url="https://github.com/atareao/nautilus-columns"
packager="Carlos Solís"
arch=(any)
license=("GPL3")
depends=(bash-completion gobject-introspection-runtime mediainfo python-gobject python-mutagen python-nautilus python-pillow python-plumbum python-pypdf2)
makedepends=(git)
source=("git+https://github.com/atareao/nautilus-columns.git")
md5sums=('SKIP')
pkgdir=
pkgver() {
	cd "$_pkgname"
	printf "0.%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build(){
	cd "$_pkgname"
	while IFS= read -r lang
	do
		mkdir "${srcdir}/${_pkgname}/po/${lang}/"
		msgfmt -o "${srcdir}/${_pkgname}/po/${lang}/${_pkgname}.mo" "${srcdir}/${_pkgname}/po/${lang}.po"
	done < "${srcdir}/${_pkgname}/po/languages.txt"
}
package(){
	cd "$_pkgname"
	mkdir -p "${pkgdir}/usr"
	mkdir -p "${pkgdir}/usr/share"
	mkdir -p "${pkgdir}/usr/share/"
	mkdir -p "${pkgdir}/usr/share/doc/"
	mkdir -p "${pkgdir}/usr/share/doc/${_pkgname}/"
	install -m 755 -t "${pkgdir}/usr/share/doc/${_pkgname}" "${srcdir}/${_pkgname}/README.md"
	install -m 755 -t "${pkgdir}/usr/share/doc/${_pkgname}" "${srcdir}/${_pkgname}/LICENSE"
	install -m 755 -t "${pkgdir}/usr/share/doc/${_pkgname}" "${srcdir}/${_pkgname}/AUTHORS"
	mkdir -p "${pkgdir}/usr/share/nautilus-python/"
	mkdir -p "${pkgdir}/usr/share/nautilus-python/extensions/"
	install -m 755 -t "${pkgdir}/usr/share/nautilus-python/extensions" "${srcdir}/${_pkgname}/src/bsc-v2.py"
	mkdir -p "${pkgdir}/usr/share/locale-langpack"
	while IFS= read -r lang
	do
		mkdir -p "${pkgdir}/usr/share/locale-langpack/${lang}"
		mkdir -p "${pkgdir}/usr/share/locale-langpack/${lang}/LC_MESSAGES"
		install -m 755 -t "${pkgdir}/usr/share/locale-langpack/${lang}/LC_MESSAGES" "${srcdir}/${_pkgname}/po/${lang}/${_pkgname}.mo"
	done < "${srcdir}/${_pkgname}/po/languages.txt"
}
