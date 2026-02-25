# Maintainer: Semirose <AppdullahMohammed@gmail.com>.
# lightly edited copy of PKGBUILD from vscodium.

pkgname=vscodium-translucent
# pkgver is set dynamically by pkgver() below; this is a placeholder for mksrcinfo.
pkgver=1.109.51242
pkgrel=1
pkgdesc="Free/Libre Open Source Software Binaries of VSCode with the translucent patch applied (git build from latest release)."
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
    '6eef345b65bf2679c928c763529540435ab9c6e1836917319810a7a2d484ae1b'
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

pkgver() {
    cd "${srcdir}/vscodium"
    # Return the latest release tag (e.g. 1.109.51242), stripping a leading 'v' if present.
    git tag --sort=-v:refname | grep -E '^v?[0-9]+\.[0-9]+\.[0-9]+' | head -1 | sed 's/^v//'
}

prepare() {
    cd "${srcdir}/vscodium"

    # Check out the latest release tag so the working tree matches what we're building.
    local _tag
    _tag="$(git tag --sort=-v:refname | grep -E '^v?[0-9]+\.[0-9]+\.[0-9]+' | head -1)"
    git checkout "${_tag}"

    # Drop the three transparency patches into VSCodium's patches/ directory.
    # VSCodium's build system (get_repo.sh) applies every *.patch in that directory
    # automatically, so no manual patch -p1 step is needed.
    cp "${srcdir}/transparency.patch" patches/
    cp "${srcdir}/transparent-titlebar.patch" patches/
    cp "${srcdir}/transparent-workbench.patch" patches/
}

build() {
    cd "${srcdir}/vscodium"

    # -------------------------------------------------------------------------
    # Node.js via NVM (isolated to srcdir)
    # -------------------------------------------------------------------------
    # Deactivate any pre-loaded nvm and point NVM_DIR at our own srcdir copy.
    command -v nvm >/dev/null && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]

    # Install the correct version of NodeJS (read from .nvmrc)
    nvm install $(cat .nvmrc)
    nvm use

    # Check if the correct version of node is being used
    nvmrc_version="$(cat .nvmrc)"
    if [[ "$nvmrc_version" != "v"* ]]; then
        # Add the v prefix, because it seems to be missing in .nvmrc
        echo "Configured .nvmrc version is [$nvmrc_version], adding the v prefix before checking if it matches with the node command."
        nvmrc_version="v$nvmrc_version"
    fi

    # Now check if the version matches exactly, or at least starts with the same prefix
    if [[ "$(node --version)" != "$nvmrc_version"* ]]; then
        echo "Using the wrong version of NodeJS! Expected ["$nvmrc_version"] but using ["$(node --version)"]."
        exit 1
    fi
    echo "Installed version of node ["$(node --version)"] matches required version ["$nvmrc_version"], continuing."

    # -------------------------------------------------------------------------
    # Rust via rustup (isolated to srcdir, similar to NVM)
    # -------------------------------------------------------------------------
    # Setting RUSTUP_HOME and CARGO_HOME under srcdir keeps this build's Rust
    # toolchain entirely separate from the user's ~/.rustup and ~/.cargo.
    export RUSTUP_HOME="${srcdir}/.rustup"
    export CARGO_HOME="${srcdir}/.cargo"
    export PATH="${CARGO_HOME}/bin:${PATH}"
    rustup default stable

    # -------------------------------------------------------------------------
    # Compiler flags
    # -------------------------------------------------------------------------
    # GCC 15 with -O3 -march=native (common in Arch/CachyOS makepkg.conf) can
    # trigger internal compiler errors (ICEs) in RTL passes when building native
    # Node.js addons (e.g. kerberos_unix.cc). node-gyp respects CXXFLAGS, so
    # capping at -O2 here prevents those crashes without affecting the
    # TypeScript/JS compilation (which doesn't use CXXFLAGS).
    export CXXFLAGS="${CXXFLAGS/-O3/-O2}"

    # -------------------------------------------------------------------------
    # Build
    # -------------------------------------------------------------------------
    # Remove old build artifacts if present
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
    export RELEASE_VERSION="$(git describe --tags --abbrev=0 | sed 's/^v//')"
    # the app will be updated with pacman
    export DISABLE_UPDATE="yes"

    # Disabling this patch, since it is for win32 and does not apply here
    rm -rf patches/cleanup-archive.patch
    # Same for ppc64le-support.patch since that is not a supported architecture
    rm -rf patches/ppc64le-support.patch

    # get_repo.sh fetches the VSCode source and applies all patches in patches/
    # (including the three transparency patches copied in prepare())
    . get_repo.sh

    . build.sh
}

package() {
    install -d -m755 ${pkgdir}/usr/bin
    install -d -m755 ${pkgdir}/usr/share/{${pkgname},applications,pixmaps}
    install -d -m755 ${pkgdir}/usr/share/licenses/${pkgname}

    cp -r ${srcdir}/vscodium/VSCode-linux-${_vscode_arch}/* ${pkgdir}/usr/share/${pkgname}
    cp -r ${srcdir}/vscodium/VSCode-linux-${_vscode_arch}/resources/app/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}

    ln -s /usr/share/${pkgname}/bin/codium ${pkgdir}/usr/bin/codium
    ln -s /usr/share/${pkgname}/bin/codium ${pkgdir}/usr/bin/vscodium

    install -D -m644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -D -m644 ${pkgname}-wayland.desktop ${pkgdir}/usr/share/applications/${pkgname}-wayland.desktop
    install -D -m644 ${pkgname}-uri-handler.desktop ${pkgdir}/usr/share/applications/${pkgname}-uri-handler.desktop
    install -D -m644 ${srcdir}/vscodium/VSCode-linux-${_vscode_arch}/resources/app/resources/linux/code.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png

    # Symlink shell completions
    install -d -m755 ${pkgdir}/usr/share/zsh/site-functions
    install -d -m755 ${pkgdir}/usr/share/bash-completion/completions
    ln -s /usr/share/${pkgname}/resources/completions/zsh/_codium ${pkgdir}/usr/share/zsh/site-functions
    ln -s /usr/share/${pkgname}/resources/completions/bash/codium ${pkgdir}/usr/share/bash-completion/completions
}
