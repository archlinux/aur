pkgname=crypticroute
pkgver=1.3
pkgrel=1
pkgdesc="Network steganography tool designed to transmit data covertly by embedding it within crafted TCP packets."
arch=('any')
url="https://github.com/Sri-dhar/CrypticRoute" 
license=('custom')
# Add git for cloning the source
makedepends=('git')
depends=(
    'python'
    'python-pyqt6'
    'python-psutil'
    'python-netifaces'
    'python-cryptography'
    'python-scapy'
)
provides=('crypticroute_cli' 'crypticroute_gui')
conflicts=()
# Clone the repository into a specific directory to avoid conflict with the local package dir
# This will clone the main branch by default. Add #tag=vX.Y or #commit=... for specific versions
_sourcedir="${pkgname}-git"
source=("${_sourcedir}::git+${url}.git")
sha256sums=('SKIP') # Skip checksum for VCS sources

# prepare() function is often used with VCS sources for tasks like submodule updates
# but isn't strictly necessary here if we just need the main repo content.
# prepare() {
#   cd "${srcdir}/${pkgname}"
#   # Example: git submodule update --init --recursive
# }

build() {
    # Git sources are cloned into the directory specified in source=()
    cd "${srcdir}/${_sourcedir}"
    # Ensure the main scripts are executable
    chmod +x crypticroute_cli.py crypticroute_gui.py
}

package() {
    local install_dir="${pkgdir}/usr/share/${pkgname}"
    # Git sources are cloned into the directory specified in source=()
    local source_root="${srcdir}/${_sourcedir}"

    # Install main scripts
    install -Dm755 "${source_root}/crypticroute_cli.py" "${install_dir}/crypticroute_cli.py"
    install -Dm755 "${source_root}/crypticroute_gui.py" "${install_dir}/crypticroute_gui.py"

    # Install the crypticroute library directory
    cp -r "${source_root}/crypticroute" "${install_dir}/crypticroute"
    # Install the gui library directory
    cp -r "${source_root}/gui" "${install_dir}/gui"

    # Install config.toml (from the cloned repository)
    install -Dm644 "${source_root}/config.toml" "${install_dir}/config.toml"

    # Ensure the target directory for symlinks exists
    install -d "${pkgdir}/usr/bin"

    # Create symbolic links in /usr/bin pointing to the installed scripts
    # These links will allow running 'crypticroute_cli' and 'crypticroute_gui' directly
    ln -sf "/usr/share/${pkgname}/crypticroute_cli.py" "${pkgdir}/usr/bin/crypticroute_cli"
    ln -sf "/usr/share/${pkgname}/crypticroute_gui.py" "${pkgdir}/usr/bin/crypticroute_gui"
}
