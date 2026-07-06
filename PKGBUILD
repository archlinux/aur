# Maintainer: Baptiste Augrain <daiyam@zokugun.org>.
# Inspired from the PKGBUILD for vscodium.

pkgname=vscodium-insiders
pkgver=1.126.04505
pkgrel=1
pkgdesc="Binary releases of Code Insiders without branding/telemetry/licensing (git build from latest release)"
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/VSCodium/vscodium.git'
license=('MIT')
options=(!strip !debug)
depends=(
    'fontconfig'
    'libxtst'
    'gtk3'
    'cairo'
    'alsa-lib'
    'nss'
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
    'nvm'
    'gulp'
    'yarn'
    'jq'
    'libxdmcp'
    'git'
    'git-lfs'
    'patch'
    'python'
    'python-distutils-extra'
    'pkg-config'
    'rustup'
)
provides=('codium-insiders')
conflicts=(
    'vscodium-insiders-bin'
    'vscodium-insiders-git'
)
source=(
    "${pkgname}.desktop"
    "${pkgname}-uri-handler.desktop"
    "https://github.com/VSCodium/vscodium-insiders/releases/download/${pkgver}-insider/VSCodium-${pkgver}-insider-src.tar.gz"
)
sha256sums=('c775a9e7733fe5497277f4fe9db3e6c214674bd8d8a9f996f2eb7eec19ae22e6'
            '2213e04254061ebdc4d56d12f58ed1f8ee2f40068d30f2657b93cb0b4714a880'
            'c0491c76080775525a927904aa289e5fd9ef00977b098c0d47da6543f9e8df86')

###############################################################################

# Even though we don't officially support other archs, let's allow the
# user to use this PKGBUILD to compile the package for their architecture.
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

install_node() {
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
}

build() {
    install_node

    rustup default stable

    # Remove old build
    if [ -d "vscode" ]; then
        rm -rf vscode* VSCode*
    fi

    # Export necessary environment variables
    export SHOULD_BUILD="yes"
    export SHOULD_BUILD_REH="no"
    export SHOULD_BUILD_REH_WEB="no"
    export CI_BUILD="no"
    export OS_NAME="linux"
    export VSCODE_ARCH="${_vscode_arch}"
    export VSCODE_QUALITY="insider"
    export RELEASE_VERSION="${pkgver}-insider"
    # the app will be updated with pacman
    export DISABLE_UPDATE="yes"

    . get_repo.sh
    . build.sh
}

package() {
    install -d -m755 ${pkgdir}/usr/bin
    install -d -m755 ${pkgdir}/usr/share/{${pkgname},applications,pixmaps}
    install -d -m755 ${pkgdir}/usr/share/licenses/${pkgname}

    cp -r ${srcdir}/VSCode-linux-${_vscode_arch}/* ${pkgdir}/usr/share/${pkgname}
    cp -r ${srcdir}/VSCode-linux-${_vscode_arch}/resources/app/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}

    ln -s /usr/share/${pkgname}/bin/codium-insiders ${pkgdir}/usr/bin/codium-insiders

    install -D -m644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -D -m644 ${pkgname}-uri-handler.desktop ${pkgdir}/usr/share/applications/${pkgname}-uri-handler.desktop
    install -D -m644 ${srcdir}/VSCode-linux-${_vscode_arch}/resources/app/resources/linux/code.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
    install -D -m644 ${srcdir}/src/insider/resources/linux/code.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg

    # Symlink shell completions
    install -d -m755 ${pkgdir}/usr/share/zsh/site-functions
    install -d -m755 ${pkgdir}/usr/share/bash-completion/completions
    ln -s /usr/share/${pkgname}/resources/completions/zsh/_codium-insiders ${pkgdir}/usr/share/zsh/site-functions
    ln -s /usr/share/${pkgname}/resources/completions/bash/codium-insiders ${pkgdir}/usr/share/bash-completion/completions
}
