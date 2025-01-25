# Maintainer: Craig Almstrom <craig.almstrom@protonmail.com>
pkgname='linux-profile-manager-git'
_pkgname='linux-profile-manager'
pkgver=r10.65d507a
pkgrel=1
pkgdesc='A user-friendly tool for creating and restoring backups of user profiles on Linux systems.'
arch=('any')
url='https://gitlab.com/CraigAlmstrom/linux-profile-manager'
license=('GPL3')
depends=('python' 'python-gobject' 'gtk3')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://gitlab.com/CraigAlmstrom/${_pkgname}")
sha256sums=('SKIP')
          
pkgver() {
    (   
        # Create a pkgver version from git commit tracking (git commit count + latest commit tag)
        cd "${srcdir}/${_pkgname}" 
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    (
        # Install the main Python script
        install -D -m 755 "${srcdir}/${_pkgname}/linux-profile-manager.py" "${pkgdir}/usr/bin/linux-profile-manager"

        # Install the application icon
        install -D -m 644 "${srcdir}/${_pkgname}/linux-profile-manager.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/linux-profile-manager.svg"

        # Install the desktop entry for GUI integration
        install -D -m 644 "${srcdir}/${_pkgname}/linux-profile-manager.desktop" "${pkgdir}/usr/share/applications/linux-profile-manager.desktop"

        # Copy License
        install -D -m 644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/linux-profile-manager/LICENSE"        
    )
}
