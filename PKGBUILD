# Maintainer: Voxel <voxel.aur@gmail.com>
pkgname=deepqt
_module='DeepQt'
pkgver='1.1.7'
pkgrel=6
pkgdesc="Harness the power of the DeepL API with this friendly user interface. Translate plain text and epub files."
url="https://github.com/VoxelCubes/DeepQt"
depends=('python>=3.10.0' 'python-pipx' 'pyside6' 'python-beautifulsoup4' 'python-pyxdg')
makedepends=('python-setuptools' 'python-pip')
license=('GPL')
arch=('any')
source=("https://github.com/VoxelCubes/DeepQt/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
    # Clean up old installation (a few GB) that otherwise would need manual cleanup. This will be removed in the next version.
    # This is necessary because old installations in the home directory could not be properly cleaned up
    # the package system.
    # The new way is to install it in the /opt/ directory, where pacman can properly track files.
    echo "Cleaning up old installation that was improperly placed in the home directory..."
    pipx uninstall deepqt || true
}


package() {
    # Perform the installation in the package() function so that these packages are installed in the package directory.
    # Otherwise, they would end up being installed directly on the user's system during package creation
    # (because prepare() isn't placed in the fakeroot environment), which would go against the purpose of a package manager.

    # Use a directory within $srcdir for PIPX_HOME
    local pipx_home="${pkgdir}/opt/pipx-${pkgname}"
    local pipx_bin_dir="${pkgdir}/usr/bin"
    mkdir -p "${pipx_home}"
    mkdir -p "${pipx_bin_dir}"

    # Most python packages, including the heavy ones like PySide6, are provided by pacman.
    # Remaining packages that aren't in the official repositories and or have broken AUR packages are installed with pipx.
    # This should provide a slim, but robust installation.
    PIPX_HOME=${pipx_home} PIPX_BIN_DIR=${pipx_bin_dir} pipx install --system-site-packages ${pkgname}==${pkgver}
    # A few references to the pkgdir remain in the pipx installation, fixing only the ones that are important.
    # The rest are merely an artifact from the setup process, since pipx isn't designed to be used with pacman.

    # Fix symlink to the correct location.
    rm $pipx_bin_dir/$pkgname
    ln -s /opt/pipx-${pkgname}/venvs/${pkgname}/bin/${pkgname} $pipx_bin_dir/deepqt
    # Fix the shebang line in the script to use the correct python installation.
    sed -i "1s/.*/#!\/opt\/pipx-${pkgname}\/venvs\/${pkgname}\/bin\/python/" $pipx_home/venvs/${pkgname}/bin/${pkgname}

    # Install the desktop file and icon.
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"

    mkdir -p "$pkgdir/usr/share/applications"
    install --mode=644 --owner=root --group=root "DeepQt.desktop" "$pkgdir/usr/share/applications/"

    mkdir -p "$pkgdir/usr/share/pixmaps"
    install --mode=644 --owner=root --group=root "media/deepqt.png" "$pkgdir/usr/share/pixmaps/deepqt.png"
}

