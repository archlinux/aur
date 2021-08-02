# Maintainer: Hunter Wittenborn: <hunter@hunterwittenborn.com>
_release_type=alpha

pkgname=makedeb-alpha
pkgver=5.14.2
pkgrel=1
pkgdesc="Create Debian archives from PKGBUILDs (${_release_type} release)"
arch=('any')
license=('GPL3')
depends=('tar' 'binutils' 'makedeb-makepkg-alpha')
conflicts=('makedeb' 'makedeb-beta')
url="https://github.com/makedeb/makedeb"

source=("${url}/archive/refs/tags/v${pkgver}-${_release_type}.tar.gz")
sha256sums=('SKIP')

package() {
    # Create single file for makedeb
    mkdir -p "${pkgdir}/usr/bin"
    cd "makedeb-${pkgver}-${_release_type}"

    # Add bash shebang
    echo '#!/usr/bin/env bash' > "${pkgdir}/usr/bin/makedeb"

    # Copy functions
    for i in $(find "src/functions/"); do
        if ! [[ -d "${i}" ]]; then
            cat "${i}" >> "${pkgdir}/usr/bin/makedeb"
        fi
    done
    cat "src/makedeb.sh" >> "${pkgdir}/usr/bin/makedeb"

    chmod 555 "${pkgdir}/usr/bin/makedeb"

	# Set package version, release type, and target OS
	sed -i "s|makedeb_package_version=.*|makedeb_package_version=${pkgver}|" "${pkgdir}/usr/bin/makedeb"
	sed -i "s|makedeb_release_type=.*|makedeb_release_type=${_release_type}|" "${pkgdir}/usr/bin/makedeb"
	sed -i 's|target_os="debian"|target_os="arch"|' "${pkgdir}/usr/bin/makedeb"

	# Remove testing commands
	sed -i 's|.*# REMOVE AT PACKAGING||g' "${pkgdir}/usr/bin/makedeb"
}
