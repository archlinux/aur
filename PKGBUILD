# Maintainer: Voxel <voxel.aur@gmail.com>
pkgname=panelcleaner
_module='PanelCleaner'
_pkgname_pypi='pcleaner'
pkgver='2.6.1'
# Sometimes I need to issue a hotfix to the pypi package without updating other releases, so pkgver is the official version.
_pypiver='2.6.1'
pkgrel=1
pkgdesc="An AI-powered tool to clean manga panels. Provides both a CLI (pcleaner) and GUI (Qt-based)"
url="https://github.com/VoxelCubes/PanelCleaner"
depends=('python>=3.10.0' 'python-pipx' 'python-pillow' 'python-opencv' 'pyside6' 'python-pytorch' 'python-torchvision' 'python-numpy' 'python-scipy' 'python-pyxdg' 'python-attrs' 'python-tqdm' 'python-pyclipper' 'python-shapely' 'python-natsort' 'python-magic' 'python-docopt' 'python-configupdater' 'python-loguru' 'python-prettytable' 'python-colorama' 'python-requests' 'python-dictdiffer' 'python-humanfriendly' 'python-psutil')
makedepends=('python-setuptools' 'python-pip' 'desktop-file-utils')
optdepends=('python-pytorch-opt: Faster, but requires a newer CPU with AVX2 support'
            'python-pytorch-cuda: Even faster, but requires a CUDA-compatible GPU'
            'python-pytorch-opt-cuda: Fastest, but requires a newer CPU with AVX2 support and a CUDA-compatible GPU'
            'python-torchvision-cuda: Faster, but requires a CUDA-compatible GPU')
license=('GPL')
arch=('any')
source=("https://github.com/VoxelCubes/PanelCleaner/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')
provides=('pcleaner' 'pcleaner-gui')


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
    rm $pipx_bin_dir/${_pkgname_pypi}-gui
    ln -s /opt/pipx-${pkgname}/venvs/${_pkgname_pypi}/bin/${_pkgname_pypi} $pipx_bin_dir/$_pkgname_pypi
    ln -s /opt/pipx-${pkgname}/venvs/${_pkgname_pypi}/bin/${_pkgname_pypi}-gui $pipx_bin_dir/${_pkgname_pypi}-gui
    # Fix the shebang line in the script to use the correct python installation.
    sed -i "1s/.*/#!\/opt\/pipx-${pkgname}\/venvs\/${_pkgname_pypi}\/bin\/python/" $pipx_home/venvs/${_pkgname_pypi}/bin/${_pkgname_pypi}
    sed -i "1s/.*/#!\/opt\/pipx-${pkgname}\/venvs\/${_pkgname_pypi}\/bin\/python/" $pipx_home/venvs/${_pkgname_pypi}/bin/${_pkgname_pypi}-gui

    # Install the desktop file and icon.
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"

    # Point the desktop file to the correct location, so it doens't rely on the user's PATH choosing the correct package if multiple are installed.
    desktop-file-edit --set-key=Exec --set-value="/opt/pipx-${pkgname}/venvs/${_pkgname_pypi}/bin/${_pkgname_pypi}-gui" "PanelCleaner.desktop"

    mkdir -p "$pkgdir/usr/share/applications"
    install --mode=644 --owner=root --group=root "PanelCleaner.desktop" "$pkgdir/usr/share/applications/"

    mkdir -p "$pkgdir/usr/share/pixmaps"
    install --mode=644 --owner=root --group=root "icons/logo-big.png" "$pkgdir/usr/share/pixmaps/panelcleaner.png"
}

