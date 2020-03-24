# Maintainer: Salamandar <felix <at> piedallu <dot> me >
# Inspired from the PKGBUILD for vscodium-bin

pkgname=vscodium-git
pkgver=1.43.1
pkgrel=2
pkgdesc="VS Code without MS branding/telemetry/licensing."
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/VSCodium/vscodium'
license=('MIT')

_electron='electron6'
depends=(
    'glibc>=2.28-4'
    'gcc-libs'
    'python'
    "${_electron}"
    'alsa-lib'
    'libnotify'
    'libsecret'
    'libx11'
    'libxkbfile'
    'libxtst'
    'ripgrep'
)
optdepends=(
    'gvfs: For move to trash functionality'
    'libdbusmenu-glib: For KDE global menu'
)
makedepends=(
    'nodejs-lts-erbium'
    'gulp'
    'yarn'
    'jq'
    'libxdmcp'
)

source=(
    "git+${url}"
    'git+https://github.com/Microsoft/vscode.git'
    'vscodium.desktop'
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
)

provides=('code')
conflicts=('code' 'vscodium-bin')

###############################################################################

case "${CARCH}" in
    i686)   _arch=ia32  ;;
    x86_64) _arch=x64   ;;
    armv7h) _arch=arm   ;;
    *)      # Needed for mksrcinfo
            _arch=DUMMY ;;
esac

prepare() {
    cd 'vscodium'
    # vscode should be cloned inside the vscodium repo, but makepkg can't do this
    rm -rf 'vscode'
    mv '../vscode' 'vscode'
}

pkgver() {
    cd "vscodium/vscode"
    LATEST_MS_COMMIT=$(git rev-list --tags --max-count=1)
    LATEST_MS_TAG=$(git describe --tags "${LATEST_MS_COMMIT}")
    echo "${LATEST_MS_TAG}"
}

build() {
    cd "vscodium"

    export SHOULD_BUILD="yes"
    export BUILDARCH="${_arch}"
    export TRAVIS_OS_NAME="linux"

    # Yeah, that's duplicated from pkgver…
    export LATEST_MS_COMMIT=$(git rev-list --tags --max-count=1)
    export LATEST_MS_TAG=$(git describe --tags "${LATEST_MS_COMMIT}")

    ./build.sh
}

package() {
    install -d -m755 ${pkgdir}/usr/bin
    install -d -m755 ${pkgdir}/usr/share/{${pkgname},applications,pixmaps}
    cp -r ${srcdir}/${pkgname} ${pkgdir}/usr/share
    ln -s /usr/share/${pkgname}/bin/codium ${pkgdir}/usr/bin/code
    ln -s /usr/share/${pkgname}/bin/codium ${pkgdir}/usr/bin/codium
    ln -s /usr/share/${pkgname}/bin/codium ${pkgdir}/usr/bin/vscodium
    install -D -m644 vscodium-bin.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -D -m644 ${srcdir}/${pkgname}/resources/app/resources/linux/code.png \
            ${pkgdir}/usr/share/pixmaps/vscodium.png
}
