# Maintainer: Avi Tretiak <avi (at) babi (dot) uy>.
# lightly edited copy of PKGBUILD from vscodium, originally created by Semirose.

pkgname=vscodium-translucent
# Placeholder for mksrcinfo; actual version is set by pkgver()
pkgver=1.109.51242
pkgrel=1
pkgdesc="Free/Libre Open Source Software Binaries of VSCode with the translucent patch applied (git build from latest release)."
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/VSCodium/vscodium'
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
    'rustup'
    'gulp'
    'jq'
    'libxdmcp'
    'git'
    'git-lfs'
    'patch'
    'python'
    'python-distutils-extra'
    'pkg-config'
)
source=(
    "${pkgname}.desktop"
    "${pkgname}-wayland.desktop"
    "${pkgname}-uri-handler.desktop"
    "vscodium::git+https://github.com/VSCodium/vscodium.git"
    "transparency.patch::https://raw.githubusercontent.com/Eir-nya/vscodium-transparent/2ee57481adc075a4dd255bfc64e4f44cf0252b01/transparency.patch"
    "transparent-titlebar.patch::https://raw.githubusercontent.com/Eir-nya/vscodium-transparent/2ee57481adc075a4dd255bfc64e4f44cf0252b01/transparent-titlebar.patch"
    "transparent-workbench.patch::https://raw.githubusercontent.com/Eir-nya/vscodium-transparent/2ee57481adc075a4dd255bfc64e4f44cf0252b01/transparent-workbench.patch"
)
sha256sums=(
    '3a5bc109974fcf408855c13965f6d6be0997655c5b359de0bfd19a678c00844e'
    'ef5759114cb0bada639bf89b778679bc7cf4d829151dc5fbf95eb33df4addcd6'
    '121f2db8a65cfc74c10d3e7c3135b62b66297cf27f8f7f00c3ad29d412e968b7'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)
provides=(
    'codium'
    'vscodium'
)
conflicts=(
    'codium'
    'vscodium'
    'vscodium-bin'
    'vscodium-git'
)

###############################################################################

# Returns the latest VSCodium release tag from the cloned repo
_latest_tag() {
    git -C "${srcdir}/vscodium" tag --sort=-v:refname | grep -E '^v?[0-9]+\.[0-9]+\.[0-9]+' | head -1
}

# Map CARCH to the VSCode arch identifier
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

pkgver() {
    # Return the latest release tag (e.g. 1.109.51242), stripping any leading 'v'
    _latest_tag | sed 's/^v//'
}

prepare() {
    cd "${srcdir}/vscodium"

    # Check out the latest release tag
    git checkout "$(_latest_tag)"

    cp "${srcdir}/transparency.patch" patches/
    cp "${srcdir}/transparent-titlebar.patch" patches/
    cp "${srcdir}/transparent-workbench.patch" patches/
}

build() {
    cd "${srcdir}/vscodium"

    # -------------------------------------------------------------------------
    # Node.js via NVM
    # -------------------------------------------------------------------------
    command -v nvm >/dev/null && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]

    # Install the correct version of NodeJS (read from .nvmrc)
    nvm install $(cat .nvmrc)
    nvm use

    # -------------------------------------------------------------------------
    # Rust via rustup
    # -------------------------------------------------------------------------
    export RUSTUP_HOME="${srcdir}/.rustup"
    export CARGO_HOME="${srcdir}/.cargo"
    export PATH="${CARGO_HOME}/bin:${PATH}"
    rustup default stable

    # -------------------------------------------------------------------------
    # Build
    # -------------------------------------------------------------------------
    # Clean old build artifacts if present
    if [ -d "vscode" ]; then
        rm -rf vscode* VSCode*
    fi

    # Export necessary environment variables
    export SHOULD_BUILD="yes"
    export SHOULD_BUILD_REH="no"
    export CI_BUILD="no"
    export OS_NAME="linux"
    export VSCODE_ARCH="${_vscode_arch}"
    export VSCODE_QUALITY="stable"
    export RELEASE_VERSION="$(_latest_tag | sed 's/^v//')"
    # Updates are handled by pacman
    export DISABLE_UPDATE="yes"

    # Remove patches that don't apply to this platform
    rm -f patches/cleanup-archive.patch
    rm -f patches/ppc64le-support.patch

    # Fetch VSCode source and apply all patches
    . get_repo.sh

    . build.sh
}

package() {
    install -d -m755 "${pkgdir}/usr/bin"
    install -d -m755 "${pkgdir}/usr/share/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/applications"
    install -d -m755 "${pkgdir}/usr/share/pixmaps"
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"

    cp -r "${srcdir}/vscodium/VSCode-linux-${_vscode_arch}"/* "${pkgdir}/usr/share/${pkgname}"
    cp -r "${srcdir}/vscodium/VSCode-linux-${_vscode_arch}/resources/app/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}"

    ln -s /usr/share/${pkgname}/bin/codium "${pkgdir}/usr/bin/codium"
    ln -s /usr/share/${pkgname}/bin/codium "${pkgdir}/usr/bin/vscodium"

    install -D -m644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -D -m644 ${pkgname}-wayland.desktop "${pkgdir}/usr/share/applications/${pkgname}-wayland.desktop"
    install -D -m644 ${pkgname}-uri-handler.desktop "${pkgdir}/usr/share/applications/${pkgname}-uri-handler.desktop"
    install -D -m644 "${srcdir}/vscodium/VSCode-linux-${_vscode_arch}/resources/app/resources/linux/code.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    # Symlink shell completions
    install -d -m755 "${pkgdir}/usr/share/zsh/site-functions"
    install -d -m755 "${pkgdir}/usr/share/bash-completion/completions"
    ln -s /usr/share/${pkgname}/resources/completions/zsh/_codium "${pkgdir}/usr/share/zsh/site-functions"
    ln -s /usr/share/${pkgname}/resources/completions/bash/codium "${pkgdir}/usr/share/bash-completion/completions"
}
