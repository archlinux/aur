# Maintainer: Michael Darr <michael.e.darr@gmail.com>

_pkgname='insomnia'
pkgname="$_pkgname-git"
pkgver="2021.1.1"
pkgrel=2
pkgdesc='HTTP and GraphQL client for developers'
url="https://github.com/Kong/insomnia"
arch=('x86_64' 'i686')
license=('MIT')
depends=(
    'electron'
    'jq'
    'npm'
)
makedepends=(
    'git'
    'nvm'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    jq -r .version "$srcdir/$_pkgname/packages/insomnia-app/config/config.json" | tr '-' '_'
}

build() {
    # Use node version from insomnia nvm config
    local node_version=$(cat "$srcdir/$_pkgname/.nvmrc")
    export npm_config_cache="$srcdir/npm_cache"
    local npm_prefix=$(npm config get prefix)
    npm config delete prefix
    source /usr/share/nvm/init-nvm.sh
    nvm install "$node_version" && nvm use "$node_version"

    # Run the build
    cd "$srcdir/$_pkgname"
    npm run bootstrap
    GITHUB_REF=core@$(jq -r .version "$srcdir/$_pkgname/packages/insomnia-app/config/config.json") npm run app-package

    # Restore node config
    npm config set prefix "$npm_prefix"
    nvm unalias default
}

package() {
    # Set up package directories
    install -d ${pkgdir}/{opt,usr/bin}

    # Copy built files into the package
    cd $srcdir/$_pkgname/packages/insomnia-app/dist/linux-unpacked
    find . -type f -exec install -Dm 755 "{}" "$pkgdir/opt/$_pkgname/{}" \;

    # Symlink the executable path into the package
    ln -s /opt/$_pkgname/$_pkgname $pkgdir/usr/bin/$_pkgname
}
