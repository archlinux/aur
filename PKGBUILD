# Maintainer: Cedric Roijakkers <cedric [the at sign goes here] roijakkers [the dot sign goes here] be>.
# Inspired from the PKGBUILD for vscodium-bin and code-stable-git.

pkgname=vscodium-git
pkgver=1.70.2.22230.r0.gf21c11d
pkgrel=1
pkgdesc="Free/Libre Open Source Software Binaries of VSCode (git build from latest commit)."
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
source=(
    "git+${url}#branch=master"
    'vscodium.desktop'
)
sha256sums=(
    'SKIP'
    '33ea43092cc895b9e6eea9056d72fbe462a450d41b6a1465da22566912110d69'
)
provides=('codium')

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

version() {
    echo "$@" | tr 'v' ' ' | awk -F. '{ printf("%03d%03d%03d%03d\n", $1,$2,$3,$4); }'
}

prepare() {
    cd "vscodium"
    
    install_node
    
    git checkout $( echo $pkgver | sed 's/\.r\([0-9]\+\)\./-r\1-/' )
    
    current=$( git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' )
    
    if [ ! "$pkgver" == $current ]; then
        echo "current: $current != $pkgver"
        return 1
    fi
}

build() {
    cd "vscodium"

    # Remove old build
    if [ -d "vscode" ]; then
        rm -rf vscode* VSCode*
    fi
    
    # Export necessary environment variables
    export SHOULD_BUILD=yes
    export CI_BUILD=no
    export OS_NAME=linux
    export VSCODE_ARCH="${_vscode_arch}"
    export RELEASE_VERSION=$( echo $pkgver | sed 's/\.r.*$//' )
    
    # Disable building rpm, deb, and AppImage packages which are not needed in an AUR build
    export SKIP_LINUX_PACKAGES="True"
    
    . get_repo.sh
    . build.sh
}

package() {
    install -d -m755 ${pkgdir}/usr/bin
    install -d -m755 ${pkgdir}/usr/share/{${pkgname},applications,pixmaps}
    install -d -m755 ${pkgdir}/usr/share/licenses/${pkgname}
    cp -r ${srcdir}/vscodium/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
    cp -r ${srcdir}/vscodium/VSCode-linux-${_vscode_arch}/* ${pkgdir}/usr/share/${pkgname}
    ln -s /usr/share/${pkgname}/bin/codium ${pkgdir}/usr/bin/codium
    ln -s /usr/share/${pkgname}/bin/codium ${pkgdir}/usr/bin/vscodium
    install -D -m644 vscodium.desktop ${pkgdir}/usr/share/applications/vscodium.desktop
    install -D -m644 ${srcdir}/vscodium/VSCode-linux-${_vscode_arch}/resources/app/resources/linux/code.png \
            ${pkgdir}/usr/share/pixmaps/vscodium.png
}
