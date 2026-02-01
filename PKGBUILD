# Maintainer: Nakildias <nakildiaspro@gmail.com>
pkgname=sc0710-dkms-git
_pkgname=sc0710
pkgver=2026.01.31.1.r66.7973216
pkgrel=1
pkgdesc="DKMS driver for Elgato 4K60 Pro MK.2 (sc0710) capture card"
arch=('x86_64')
url="https://github.com/Nakildias/sc0710"
license=('GPL-2.0-or-later')
depends=('dkms')
makedepends=('git')
provides=("${_pkgname}-dkms" "elgato-4k60pro-mk2-driver" "elgato-4k60pro-mk2-dkms")
conflicts=("${_pkgname}-dkms" "${_pkgname}")
install=${_pkgname}.install
source=("git+https://github.com/Nakildias/sc0710.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    
    # 1. Read the version directly from the 'version' file
    local _ver=$(cat version | tr - . | tr -d '[:alpha:]')
    
    # 2. Append the git commit count and hash
    if [ -z "$_ver" ]; then
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    else
        printf "%s.r%s.%s" "$_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    fi
}

package() {
    cd "${srcdir}/${_pkgname}"
    
    # Use pkgver for DKMS to ensure upgrades trigger a rebuild.
    local _dkms_ver="${pkgver}"
    local dest="${pkgdir}/usr/src/${_pkgname}-${_dkms_ver}"
    
    install -d "${dest}"
    
    # Copy source files
    cp -r ./* "${dest}/"
    
    # Remove git directory, packaging files, and installer scripts
    rm -rf "${dest}/.git" "${dest}/aur" "${dest}/install-sc0710.sh" "${dest}/sc0710.install"
    
    # Ensure dkms.conf is present
    install -Dm644 "dkms.conf" "${dest}/dkms.conf"
    
    # Update dkms.conf version to match the dynamic pkgver
    sed -i "s/^PACKAGE_VERSION=.*/PACKAGE_VERSION=\"${_dkms_ver}\"/" "${dest}/dkms.conf"
    
    # Install License
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
