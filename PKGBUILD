# Maintainer: Lukas Westholt <support(at)lukaswestholt(dot)de>

pkgname=dcli-git
pkgver=6.2544.2.r3.8d37e32
pkgrel=1
pkgdesc="Dashlane CLI - Access your secrets in your terminal, servers and CI/CD"
url="https://github.com/Dashlane/dashlane-cli"
arch=("x86_64")
license=('Apache-2.0')
depends=()
makedepends=('nodejs-lts-jod' 'yarn' 'git')
checkdepends=()
optdepends=()
provides=("${pkgname%-*}=$pkgver")
conflicts=("${pkgname%-*}")
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname%-*}::git+${url}.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-*}"
	printf "%s" "$(git describe --tags --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "${srcdir}/${pkgname%-*}"

    # it might be good to use the users cache
    # yarn config set cache-folder "${srcdir}/.yarn-cache" 

    # contain global packages somewhere else
    yarn config set prefix "${srcdir}/.yarn"
}

build() {
    # We don't want to depend on nodejs-lts-jod on runtime
    # So we build the dcli as a self-contained binary
    # See: https://github.com/Dashlane/dashlane-cli/issues/52#issuecomment-1447918815

    cd "${srcdir}/${pkgname%-*}"
    # See https://github.com/Dashlane/dashlane-cli/blob/8d37e32ebba9e95404f25236b659db692d1bdb4d/.github/workflows/release.yml
    export CI=true
    yarn install 
    YARN_ENABLE_INLINE_BUILDS=1 yarn run build
    # yarn workspaces focus --all --production
    yarn run pkg:linux
}

package() {
    cd "${srcdir}/${pkgname%-*}"
    install -Dm755 bundle/dcli-linux "${pkgdir}/usr/bin/${pkgname%-*}"
}

