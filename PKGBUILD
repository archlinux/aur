# Maintainer: Lukas Westholt <support(at)lukaswestholt(dot)de>

pkgname=dcli-git
pkgver=6.2544.2.r3.8d37e32
pkgrel=1
pkgdesc="Dashlane CLI - Access your secrets in your terminal, servers and CI/CD"
url="https://github.com/Dashlane/dashlane-cli"
arch=("x86_64")
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
makedepends=('nvm' 'yarn' 'git')
checkdepends=()
optdepends=()
provides=("${pkgname%-*}=$pkgver")
conflicts=("${pkgname%-*}")
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname%-*}::git+${url}.git")
noextract=()
sha256sums=('SKIP')

# See https://wiki.archlinux.org/title/Node.js_package_guidelines#Using_nvm
_ensure_local_nvm() {
    # Let's be sure we are starting clean
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"

    # The init script returns 3 if version specified
    # in ./.nvmrc is not (yet) installed in $NVM_DIR
    # but nvm itself still gets loaded ok
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

pkgver() {
	cd "${srcdir}/${pkgname%-*}"
	printf "%s" "$(git describe --tags --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "${srcdir}/${pkgname%-*}"

    # contain global packages somewhere else
    yarn config set globalFolder "${srcdir}/.yarn"
}

build() {
    # We don't want to depend on nodejs-lts-jod on runtime
    # So we build the dcli as a self-contained binary
    # See: https://github.com/Dashlane/dashlane-cli/issues/52#issuecomment-1447918815

    cd "${srcdir}/${pkgname%-*}"

    # Ensure correct NodeJS version for building
    _ensure_local_nvm
    nvm install 22

    # See https://github.com/Dashlane/dashlane-cli/blob/8d37e32ebba9e95404f25236b659db692d1bdb4d/.github/workflows/release.yml
    export CI=true
    yarn install 
    YARN_ENABLE_INLINE_BUILDS=1 yarn run build
    yarn workspaces focus --all --production
    yarn dlx @yao-pkg/pkg@6.1.1 ./dist -t node22-linux-x64 -o bundle/dcli-linux-x64 -C Brotli "--public" "--public-packages" "tslib,thirty-two,node-hkdf-sync,vows" "--no-bytecode"
}

check() {
    cd "$srcdir/${pkgname%-*}"
    chmod +x bundle/dcli-linux-x64

    # Basic smoke test
    bundle/dcli-linux-x64 --help >/dev/null
}


package() {
    cd "${srcdir}/${pkgname%-*}"
    install -Dm755 bundle/dcli-linux-x64 "${pkgdir}/usr/bin/${pkgname%-*}"
}

