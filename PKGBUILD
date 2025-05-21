# Maintainer: Voxel <voxel.aur@gmail.com>
pkgname=handtex
_module='Hand-TeX'
_pkgname_pypi='handtex'
pkgver='1.0.4'
# Sometimes I need to issue a hotfix to the pypi package without updating other releases, so pkgver is the official version.
_pypiver='1.0.4'
pkgrel=1
pkgdesc="Handwritten LaTeX symbol classifier for the desktop"
url="https://github.com/VoxelCubes/Hand-TeX"
depends=('python>=3.10.0' 'python-pipx' 'python-pillow' 'pyside6' 'python-pytorch' 'python-torchvision' 'python-numpy' 'python-pyxdg' 'python-attrs' 'python-natsort' 'python-loguru' 'python-psutil' 'python-networkx')
makedepends=('python-setuptools' 'python-pip' 'desktop-file-utils')
license=('GPL')
arch=('any')
source=("https://github.com/VoxelCubes/Hand-TeX/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9d1c8b959093e84c8b57837ada83588fa1ee44b3707542d045e5fa5f92f3a26d')
provides=('handtex')


package() {
    # Use a directory within $pkgdir for PIPX_HOME
    local pipx_home="${pkgdir}/opt/pipx-${pkgname}"
    local pipx_bin_dir="${pkgdir}/usr/bin"
    mkdir -p "${pipx_home}"
    mkdir -p "${pipx_bin_dir}"

    # Most python packages, including the heavy ones like PySide6, torch etc. are provided by pacman.
    # Remaining packages that aren't in the official repositories and or have broken AUR packages are installed with pipx.
    # This should provide a slim, but robust installation.
    PIPX_HOME=${pipx_home} PIPX_BIN_DIR=${pipx_bin_dir} pipx install --system-site-packages ${_pkgname_pypi}==${_pypiver}
    # A few references to the pkgdir remain in the pipx installation, fixing only the ones that are important.
    # The rest are merely an artifact from the setup process, since pipx isn't designed to be used with pacman.

    # Fix symlink to the correct location.
    rm $pipx_bin_dir/$_pkgname_pypi
    ln -s /opt/pipx-${pkgname}/venvs/${_pkgname_pypi}/bin/${_pkgname_pypi} $pipx_bin_dir/$_pkgname_pypi
    # Fix the shebang line in the script to use the correct python installation.
    sed -i "1s/.*/#!\/opt\/pipx-${pkgname}\/venvs\/${_pkgname_pypi}\/bin\/python/" $pipx_home/venvs/${_pkgname_pypi}/bin/${_pkgname_pypi}

    # Install the desktop file and icon.
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"

    # Point the desktop file to the correct location, so it doens't rely on the user's PATH choosing the correct package if multiple are installed.
    desktop-file-edit --set-key=Exec --set-value="/opt/pipx-${pkgname}/venvs/${_pkgname_pypi}/bin/${_pkgname_pypi}" "Hand-TeX.desktop"

    mkdir -p "$pkgdir/usr/share/applications"
    install --mode=644 --owner=root --group=root "Hand-TeX.desktop" "$pkgdir/usr/share/applications/"

    mkdir -p "$pkgdir/usr/share/pixmaps"
    install --mode=644 --owner=root --group=root "media/handtex.png" "$pkgdir/usr/share/pixmaps/handtex.png"
}

