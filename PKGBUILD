# Maintainer: Voxel <voxel.aur@gmail.com>
pkgname=panelcleaner
_module='PanelCleaner'
pkgver='2.1.2'
_pypi_pkgver='2.1.0'
pkgrel=2
pkgdesc="An AI-powered tool to clean manga panels. Provides both a CLI (pcleaner) and GUI (Qt-based)"
url="https://github.com/VoxelCubes/PanelCleaner"
depends=('python>=3.10.0' 'python-pipx')
makedepends=('python-setuptools' 'python-pip')
license=('GPL')
arch=('any')
source=("https://github.com/VoxelCubes/PanelCleaner/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')
provides=('pcleaner' 'pcleaner-gui')


package() {

    # Clean up old installation (a few GB) that otherwise would need manual cleanup. This will be removed in the next version.
    # This is necessary because old installations in the home directory could not be properly cleaned up
    # the package system.
    # The new way is to install it in the /opt/ directory, where pacman can properly track files.
    echo "Cleaning up old installation that was improperly placed in the home directory..."
    pipx uninstall pcleaner || true
    

    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"

    # Use a directory within $srcdir for PIPX_HOME
    local pipx_home="${pkgdir}/opt/pipx-${pkgname}"
    local pipx_bin_dir="${pkgdir}/usr/bin"
    mkdir -p "${pipx_home}"
    mkdir -p "${pipx_bin_dir}"

    # Once pipx 1.3.0+ is supported in the official repos (probably January), I can let pipx use heavier dependencies from
    # the system site-packages that are installed with pacman/from the AUR.

    PIPX_HOME=${pipx_home} PIPX_BIN_DIR=${pipx_bin_dir} pipx install pcleaner==${_pypi_pkgver}

    mkdir -p "$pkgdir/usr/share/applications"
    install --mode=644 --owner=root --group=root "PanelCleaner.desktop" "$pkgdir/usr/share/applications/"

    mkdir -p "$pkgdir/usr/share/pixmaps"
    install --mode=644 --owner=root --group=root "icons/logo.png" "$pkgdir/usr/share/pixmaps/panelcleaner.png"
}

