# Maintainer: Baptiste Augrain <daiyam@zokugun.org>.
# Inspired from the PKGBUILD for vscodium.

pkgname=mrcode
pkgver=1.82.0.23253
pkgrel=1
pkgdesc="A custom build of VSCodium / VSCode (git build from latest release)"
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/zokugun/MrCode.git'
license=('MIT')

depends=(
    'fontconfig'
    'libxtst'
    'gtk3'
    'cairo'
    'alsa-lib'
    'nss'
    'gcc-libs'
    'libnotify'
    'libxss'
    'glibc>=2.28-4'
    'libxkbfile'
)
optdepends=(
    'gvfs: For move to trash functionality'
    'libdbusmenu-glib: For KDE global menu'
)
makedepends=(
   'bash'
    'git'
    'git-lfs'
    'gulp'
    'jq'
    'libxdmcp'
    'nvm'
    'python'
    'yarn'
)
source=(
    "git+${url}#tag=${pkgver}"
    'mrcode.desktop'
)
sha256sums=('SKIP'
            '362ef9b395929a66442f60be0e238ac69afbbda07728e4121c352fdea236af92')
provides=('mrcode')
conflicts=(
    'mrcode-git'
    'mrcode-bin'
)

case "$CARCH" in
  x86_64)
    _vscode_arch=x64
    ;;
  aarch64)
    _vscode_arch=arm64
    ;;
  armv7h)
    _vscode_arch=arm
    ;;
  *)
    # Needed for mksrcinfo
    _vscode_arch=DUMMY
    ;;
esac

version() {
    echo "$@" | tr 'v' ' ' | awk -F. '{ printf("%03d%03d%03d%03d\n", $1,$2,$3,$4); }'
}

build() {
    cd "MrCode"
    
     # Deactivate any pre-loaded nvm, and make sure we use our own in the current source directory
    command -v nvm >/dev/null && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]

    # Install the correct version of NodeJS (read from .nvmrc)
	nvm install $(cat .nvmrc)
    nvm use

    # Check if the correct version of node is being used
    nvmrc_version="$(cat .nvmrc)"
    if [[ "$nvmrc_version" != "v"* ]]
    then
        # Add the v prefix, because it seems to be missing in .nvmrc
        echo "Configured .nvmrc version is [$nvmrc_version], adding the v prefix before checking if it matches with the node command."
        nvmrc_version="v$nvmrc_version"
    fi

    # Now check if the version matches exactly, or at least starts with the same prefix
    if [[ "$(node --version)" != "$nvmrc_version"* ]]
    then
    	echo "Using the wrong version of NodeJS! Expected ["$nvmrc_version"] but using ["$(node --version)"]."
    	exit 1
    fi
    echo "Installed version of node ["$(node --version)"] matches required version ["$nvmrc_version"], continuing."

    # Remove old build
    if [ -d "vscodium" ]; then
        rm -rf vscodium
    fi

     # Export necessary environment variables
    export SHOULD_BUILD="yes"
    export SHOULD_BUILD_REH="no"
    export CI_BUILD="no"
    export OS_NAME="linux"
    export VSCODE_ARCH="${_vscode_arch}"
    export VSCODE_QUALITY="stable"
    export RELEASE_VERSION="${pkgver}"
    # the app will be updated with pacman
    export DISABLE_UPDATE="yes"
    
    . get_repo.sh

    . prepare.sh
    
    cd vscodium
    
    . build.sh
}

package() {
    install -d -m755 ${pkgdir}/usr/bin
    install -d -m755 ${pkgdir}/usr/share/{mrcode,applications,pixmaps}
    install -d -m755 ${pkgdir}/usr/share/licenses/mrcode
    
    cp -r ${srcdir}/MrCode/vscodium/vscode/LICENSE.txt ${pkgdir}/usr/share/licenses/mrcode
    cp -r ${srcdir}/MrCode/vscodium/VSCode-linux-${_vscode_arch}/* ${pkgdir}/usr/share/mrcode
    
    ln -s /usr/share/mrcode/bin/mrcode ${pkgdir}/usr/bin/mrcode
    install -D -m644 mrcode.desktop ${pkgdir}/usr/share/applications/mrcode.desktop
    install -D -m644 ${srcdir}/MrCode/vscodium/VSCode-linux-${_vscode_arch}/resources/app/resources/linux/code.png ${pkgdir}/usr/share/pixmaps/mrcode.png
}
