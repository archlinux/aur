# Maintainer: Louis Dalibard <ontake@ontake.dev>
_pkgbase="anubis"
pkgname="$_pkgbase-git"
pkgver=r102.g878b371
pkgrel=1
pkgdesc="Anubis weighs the soul of your connection using a sha256 proof-of-work challenge in order to protect upstream resources from scraper bots."
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/TecharoHQ/anubis"
license=('GPL3')
groups=()
depends=()
makedepends=('go>=1.18' 'git' 'esbuild' 'nodejs' 'npm' 'zstd' 'brotli' 'gzip' 'nodejs-postcss')
optdepends=()
provides=("$_pkgbase")
conflicts=("$_pkgbase")
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/TecharoHQ/anubis")
noextract=()
md5sums=("SKIP") #autofill using updpkgsums

pkgver() {
        cd ${srcdir}/anubis
        echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
        cd "${srcdir}/anubis"
        npm install postcss postcss-cli
        make deps
        make assets
        npm run assets
        cd var
        go build -v ../cmd/anubis
}

package() {
        install -Dm755 "${srcdir}/anubis/var/anubis" "${pkgdir}"/usr/bin/anubis
        install -Dm644 "${srcdir}/anubis/run/anubis@.service" "${pkgdir}"/usr/lib/systemd/system/anubis@.service
        # install -Dm644 "${srcdir}/anubis/run/default.env" "${pkgdir}"/etc/anubis/default.env
}
