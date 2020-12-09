# Maintainer: FirstAirBender <noblechuk5 [at] web [dot] de>

_pkgname='jetbrains-toolbox'
pkgname="${_pkgname}-fix"
pkgver=1.18.7609
pkgrel=2
pkgdesc='Manage your tools the easy way'
arch=('x86_64')
url='https://www.jetbrains.com/toolbox/'
license=(
	'custom:jetbrains'
)
depends=(
	'java-runtime>=8'
	'fuse'
	'glibc>=2.17'
	'libxslt'
	'libxss'
	'xcb-util-keysyms'
	'xdg-utils'
	'nss'
)
optdepends=(
	'libnotify'
)
makedepends=(
	appimagetool
)
provides=(
	"${_pkgname}"
)
options=(
	!strip
)
source=(
	"${_pkgname}.tar.gz::https://download.jetbrains.com/toolbox/${_pkgname}-${pkgver}.tar.gz"
	"${_pkgname}".desktop
	"${_pkgname}".svg
)
sha256sums=(
	'f4eae649a88baec0c4b4f7db84fa290ebcd6151aef8856ab3af42b97add40d10'
	'ade259058b244c8ce6573bc86327ab14b4eddd0095f8d2a8638473334b268200'
	'4a6b4b801954017402e47b40b7246a71b1c128ca352efe459322b3f3699a5813'
)
build() {
	cd "$_pkgname-$pkgver"
	./"$_pkgname" --appimage-extract
	cp --force "$srcdir/jetbrains-toolbox.desktop" ./squashfs-root
	cp --force "$srcdir/jetbrains-toolbox.svg" ./squashfs-root
	env --unset=SOURCE_DATE_EPOCH appimagetool --no-appstream ./squashfs-root
	rm --recursive --force ./squashfs-root
	cp *.AppImage "$srcdir/$_pkgname"
}
package() {
	install --directory --mode=755 "${pkgdir}"/{opt/"$_pkgname",usr/{bin,share/{applications,icons/hicolor/scalable/apps}}}
	install -vm644 "${srcdir}/$_pkgname.desktop" --target "${pkgdir}/usr/share/applications/"
	install -vm644 "${srcdir}/$_pkgname.svg" --target "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
	install -vm755 "${srcdir}/$_pkgname" --target "${pkgdir}/opt/$_pkgname"
	ln --symbolic --relative --verbose \
		"${pkgdir}/opt/$_pkgname/$_pkgname" \
		"${pkgdir}/usr/bin/${_pkgname}"
}
