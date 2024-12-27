pkgname="spicetify-theme-nord-git"
pkgver=r535.gcca99f3
pkgrel=1
pkgdesc="Nord Themed Spotify (JoshuaWierenga's fork)"
arch=("any")
url="https://tetrax-10.github.io/Nord-Spotify/"
license=("MIT")
depends=("spicetify-cli")
makedepends=("git" "npm")
provides=("spicetify-theme-nord")
conflicts=("spicetify-theme-nord")
source=(
    "git+https://github.com/JoshuaWierenga/Nord-Spotify#branch=fixes"
    "0001-Remove-broken-sp-desktop-v1-version.patch"
    "0002-Remove-broken-sp-product-state-v1-values.patch"
)
sha256sums=('SKIP'
            '92621b7c2f74682fba932d32b09cf58b3266f98216025da51400eb5ad5ef45b1'
            '9c2304016f3c8aa7ebd146936dc1621ff70ec8884f6e7497a7b8874ac418d922')

prepare() {
    cd "${srcdir}/Nord-Spotify"
    git apply ../0001-Remove-broken-sp-desktop-v1-version.patch
    git apply ../0002-Remove-broken-sp-product-state-v1-values.patch
}
pkgver() {
    cd "${srcdir}/Nord-Spotify"
    echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}
build() {
    cd "${srcdir}/Nord-Spotify"
    npm ci
    npm run build-local
}
package() {
    cd "${srcdir}/Nord-Spotify"
    mkdir -p "${pkgdir}/opt/spicetify-cli/Themes"
    cp -a --no-preserve=ownership dist/Nord "${pkgdir}/opt/spicetify-cli/Themes"
}
