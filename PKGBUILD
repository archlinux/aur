# Maintainer: Tulpenkiste <tulpenkiste at the amogus email domain which is .cloud>
# Maintainer: Aryan Ghasemi <aryangh1379@gmail.com>
_pkgname=supertux-advance
pkgname=supertux-advance-bin
pkgver=0.2.0
pkgrel=8
pkgdesc="A SuperTux game made in Brux GDK with 16bit-style graphics."

arch=('x86_64')

url="https://github.com/KelvinShadewing/supertux-advance"
license=('AGPL-3.0-only')

conflicts=("supertux-advance")
makedepends=(coreutils findutils file grep unzip)

source=("${_pkgname}-${pkgver}.zip::$url/releases/download/v${pkgver}/sta-${pkgver}.zip" "$_pkgname.desktop" "$_pkgname-exec")
sha256sums=('781cf8012fa4b79bdbd135b9d6b9244a287dcbcabcef2e6c451e8f00520aba72' 'SKIP' 'SKIP')
noextract=("${_pkgname}-${pkgver}.zip")

prepare() {
	if [ -d "${_pkgname}-${pkgver}/" ]; then
		rm -r "${_pkgname}-${pkgver}/"
	fi

	unzip "${_pkgname}-${pkgver}.zip" -d "${_pkgname}-${pkgver}/"
}

package() {
	# Executable and Desktop file
	install -Dm755 "$_pkgname-exec" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

	cd "$_pkgname-$pkgver"

	# Copy folder structure with good permissions
	/usr/bin/find . \
	-type d \
	-exec \
	/usr/bin/install -dm755 "${pkgdir}/opt/${_pkgname}/{}" \;

	# Populate with game-data, except the Windows bits and the executable
	/usr/bin/find . \
	-type f \
	! -name "*.dll" \
	! -name "*.exe" \
	-exec \
	/usr/bin/install -m644 "{}" "${pkgdir}/opt/${_pkgname}/{}" \;

	cd ..

	# Remove on next release
	rm -rf "${pkgdir}/opt/${_pkgname}/contrib/azzy"

	install -Dm644 "$_pkgname-$pkgver/icon.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/$_pkgname.png"
}
