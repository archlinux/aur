# Maintainer: Alfredo Ramos <alfredo.ramos@tutanota.com>
# Contributor: Muflone http://www.muflone.com/contacts/english/
# Contributor: Arne Hoch <arne@derhoch.de

_pkgname=dbeaver
pkgname=${_pkgname}-git
pkgver=22.3.3.219.g8a22c75f1f
pkgrel=1
pkgdesc='Free universal SQL Client for developers and database administrators. Community Edition. Git version.'
arch=('x86_64')
url='https://dbeaver.io'
license=('Apache')

depends=('java-runtime>=17' 'gtk3' 'gtk-update-icon-cache' 'libsecret')
makedepends=('maven')
optdepends=(
	'dbeaver-plugin-office: To export data in Microsoft Office Excel format'
	'dbeaver-plugin-svg-format: To save diagrams in SVG format'
	'webkit2gtk: To preview spatial data'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

source=(
	"git+https://github.com/${_pkgname}/${_pkgname}.git"
	"io.${_pkgname}.DBeaver.desktop"
	"${_pkgname}.sh"
	"${_pkgname}.profile.gz"
	"${_pkgname}.hook"
	"${_pkgname}.install"
)
sha512sums=(
	'SKIP'
	'a215488a96ad55bdee6dd98fdcf6d36f1c5966e82c66a3006dc1a54a976bfd4b888f61f42ebb788e124ea6c0c8736539ddd5b2b67e0324aaafa8d5c0d4bc438c'
	'1d4e0947baa5d9c663f7afcef2e6938d1a2f768de4002beb38b79bfc93748d6a0acd88dae765bfe5b4cc01897946e9b6a712f1f061e7896dfc07fc7274c88a30'
	'e6898d9324a6df2ae8aff910d86431c63694bee0a8d257a217dab08ffddbf138ed5fb191c22e44eb7bffaffc87fa83e321b1fd0ff3029ed1fbe8a5d6d15376d4'
	'855fd0a6236d00bb70c2a33273c077ecccaf5645e231d7364d78a626349e0746caa9fd4e522281a4d7f6cc1db1b2afdbc996df54780be5edcc462ce6814381a5'
	'6565d17f9f0f75fd8f58df4989cebcf03ecd19a9a8547769e445c0012d380e6c31ae793221307f2386cef81b018e5e7026d5a2a7c4bc52ec98d0aca32c52d94d'
)

install="${_pkgname}.install"

pkgver() {
	cd "${_pkgname}"
	git describe --long --tags 2>/dev/null | sed -r 's/^v//;s/-/./g'
}

prepare() {
	# Fix version number in profile file
	gzip --decompress --keep --stdout "${_pkgname}.profile.gz" |
		sed "s/DBEAVER_VERSION/${pkgver}/g" |
		gzip -9 >"${_pkgname}.profile-${pkgver}.gz"

	export JAVA_HOME="/usr/lib/jvm/$(archlinux-java status | tail -n +2 | sort | cut -d ' ' -f 3 | sort -nr -k 2 -t '-' | grep -E '17-|18-|19-' -m 1)"
	cd "${_pkgname}"

	export MAVEN_OPTS="-Xmx2048m"
	mvn --batch-mode validate
}

build() {
	cd "${_pkgname}"
	mvn --batch-mode package
}

package() {
	cd "${_pkgname}/product/community"

	# Install icons into /usr/share/icons/hicolor
	for _size in 16 32 48 64 128 256 512; do
		install -m 644 -D "icons-sources/icon_${_size}x${_size}.png" "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/dbeaver.png"
	done

	# Move into the target directory
	cd "target/products/org.jkiss.dbeaver.core.product/linux/gtk/${CARCH}"

	# Initially install everything into /usr/lib/dbeaver
	install -m 755 -d "${pkgdir}/usr/lib"
	cp -r "${_pkgname}" "${pkgdir}/usr/lib/"

	# Move shared data to /usr/share/dbeaver
	cd "${pkgdir}/usr/lib/${_pkgname}"
	install -m 755 -d "${pkgdir}/usr/share/${_pkgname}"

	for _file in configuration features p2 .eclipseproduct artifacts.xml dbeaver.ini readme.txt; do
		mv "${_file}" "${pkgdir}/usr/share/${_pkgname}"
		ln -s "/usr/share/${_pkgname}/${_file}" .
	done

	# Install additional licenses
	install -m 755 -d "${pkgdir}/usr/share/licenses"
	mv licenses "${pkgdir}/usr/share/licenses/${_pkgname}"
	ln -s "/usr/share/licenses/${_pkgname}" "${pkgdir}/usr/lib/${_pkgname}/licenses"

	# Install icons
	install -m 755 -d "${pkgdir}/usr/share/pixmaps"
	mv dbeaver.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
	mv icon.xpm "${pkgdir}/usr/share/pixmaps/${_pkgname}.xpm"

	# Install executable script into /usr/bin
	install -m 755 -d "${pkgdir}/usr/bin"
	install -m 755 "${srcdir}/dbeaver.sh" "${pkgdir}/usr/bin/${_pkgname}"

	# Install application launcher into /usr/share/applications
	install -m 755 -d "${pkgdir}/usr/share/applications"
	install -m 755 -t "${pkgdir}/usr/share/applications" "${srcdir}/io.${_pkgname}.DBeaver.desktop"

	# Clean up and install new profile
	rm -rf "${pkgdir}/usr/share/${_pkgname}/p2/org.eclipse.equinox.p2.core"
	cd "${pkgdir}/usr/share/${_pkgname}/p2/org.eclipse.equinox.p2.engine/profileRegistry/DefaultProfile.profile"
	find . -name "*.profile.gz" -delete
	install -m 644 "${srcdir}/${_pkgname}.profile-${pkgver}.gz" "1502633007017.profile.gz"
	cd "${pkgdir}/usr/share/${_pkgname}/p2/org.eclipse.equinox.p2.engine"
	rm -f ".settings/org.eclipse.equinox.p2.artifact.repository.prefs"
	rm ".settings/org.eclipse.equinox.p2.metadata.repository.prefs"
	rmdir ".settings"

	# Install system hook
	install -m 755 -d "${pkgdir}/usr/share/libalpm/hooks"
	install -m 644 "${srcdir}/${_pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks"

	# Create configuration file (handled by the hook)
	cd "${pkgdir}/usr/share/dbeaver/configuration/org.eclipse.equinox.simpleconfigurator"
	install -m 755 -d "${pkgdir}/etc/${_pkgname}/bundles.d"
	mv "bundles.info" "${pkgdir}/etc/${_pkgname}/bundles.d/00-${_pkgname}.info"
	ln -s "/etc/${_pkgname}/bundles.info" .
}
