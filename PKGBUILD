# Maintainer: Hunter Wittenborn <hunter@hunterwittenborn.com>
_release_type=alpha

pkgname=makedeb-makepkg-alpha
pkgver=8.7.1
pkgrel=1
pkgdesc="Arch Linux build utility, modified for use with makedeb (alpha release)"
arch=(any)
depends=('awk' 'libarchive' 'bzip2' 'coreutils' 'fakeroot' 'file' 'findutils' 'gettext' 'gnupg' 'grep' 'gzip' 'sed' 'ncurses' 'xz')
conflicts=('makedeb-makepkg' 'makedeb-makepkg-beta')
license=('GPL2')
url="https://github.com/makedeb/makepkg"

source=("${url}/archive/refs/tags/v${pkgver}-${_release_type}.tar.gz")
sha256sums=('SKIP')

prepare() {
  # Remove prebuild commands, and set package version.
  sed -i 's|.*# REMOVE AT PACKAGING||g' "makepkg-${pkgver}-${_release_type}/src/makepkg.sh"
  sed -i "s|makepkg_version='git'|makepkg_version='${pkgver}-${pkgrel}'|" "makepkg-${pkgver}-${_release_type}/src/makepkg.sh"

  # Set target OS
  sed -i 's|target_os="[^"]*"|target_os="arch"|' "makepkg-${pkgver}-${_release_type}/src/makepkg.sh"
}

package() {
	cd "makepkg-${pkgver}-${_release_type}"

	# Copy makepkg
	install -Dm 555 "src/makepkg.sh" "${pkgdir}/usr/bin/makedeb-makepkg"

	# Copy functions
	mkdir -p "${pkgdir}/usr/share/"
	cp -R "src/functions" "${pkgdir}/usr/share/makedeb-makepkg"
	chmod 555 "${pkgdir}/usr/share/makedeb-makepkg"
}
