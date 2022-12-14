# Maintainer: Baptiste Augrain <daiyam@zokugun.org>.
# Inspired from the PKGBUILD for vscodium.

pkgname=vscodium-insiders
pkgver=1.75.0.22347
pkgrel=1
pkgdesc="Binary releases of Code Insiders without branding/telemetry/licensing (git build from latest release)"
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/VSCodium/vscodium.git'
license=('MIT')

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
    'pkg-config'
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
sha256sums=('9d17eb0074bcd7b75ffd8c56718254c96108c01f857570f951d1e9a109269405'
            'ca34047d62b5b433c2039151b9d55674a8aacdd1af57041d54387b76e44cd442'
            '5465ad9cd9edb31dfeb1b3dd8b3af42dbe62fcb522dfcd45ab68ae7675a05eba')

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
    if [[ "$(node --version)" != "$(cat .nvmrc)" ]]
    then
    	echo "Using the wrong version of NodeJS! Expected ["$(cat .nvmrc)"] but using ["$(node --version)"]."
    	exit 1
    fi
}

build() {
    install_node

    # Remove old build
    if [ -d "vscode" ]; then
        rm -rf vscode* VSCode*
    fi
    
    # Export necessary environment variables
    export SHOULD_BUILD="yes"
    export SHOULD_BUILD_REH="no"
    export CI_BUILD="no"
    export OS_NAME="linux"
    export VSCODE_ARCH="${_vscode_arch}"
    export VSCODE_QUALITY="insider"
    export RELEASE_VERSION="${pkgver}-insider"
    export BUILD_SOURCEVERSION=$( cat /dev/urandom | env LC_ALL=C tr -dc 'a-z0-9' | fold -w 40 | head -n 1 )
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
    
    # Symlink shell completions
    install -d -m755 ${pkgdir}/usr/share/zsh/site-functions
    install -d -m755 ${pkgdir}/usr/share/bash-completion/completions
    ln -s /usr/share/${pkgname}/resources/completions/zsh/_codium-insiders ${pkgdir}/usr/share/zsh/site-functions
    ln -s /usr/share/${pkgname}/resources/completions/bash/codium-insiders ${pkgdir}/usr/share/bash-completion/completions
}
