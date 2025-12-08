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
	cd "$srcdir/${pkgname%-*}"
	printf "%s" "$(git describe --tags --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    # it might be good to use the users cache
    # yarn config set cache-folder "${srcdir}/.yarn-cache" 

    # contain global packages somewhere else
    yarn config set prefix "${srcdir}/.yarn"
}

build() {
    cd ${srcdir}/${pkgname%-git}
    # See https://github.com/Dashlane/dashlane-cli/blob/8d37e32ebba9e95404f25236b659db692d1bdb4d/.github/workflows/release.yml
    export CI=true
    yarn
    YARN_ENABLE_INLINE_BUILDS=1 yarn run build
    yarn workspaces focus --all --production
}

package() {
    export CI=true
    cd ${srcdir}/${pkgname%-git}
    yarn dlx @yao-pkg/pkg@6.1.1 ./dist -t node22-linux-x64 -o "${pkgdir}/usr/bin/${pkgname%-git}" -C Brotli "--public" "--public-packages" "tslib,thirty-two,node-hkdf-sync,vows" "--no-bytecode"
}

