pkgname="spicetify-theme-nord-git"
pkgver=r535.gcca99f3
pkgrel=2
pkgdesc="Nord Themed Spotify (JoshuaWierenga's fork)"
arch=("any")
url="https://github.com/JoshuaWierenga/Nord-Spotify"
license=("MIT")
makedepends=("git" "npm")
provides=("spicetify-theme-nord")
conflicts=("spicetify-theme-nord")
source=(
    "git+https://github.com/JoshuaWierenga/Nord-Spotify#branch=fixes"
    "0001-Remove-broken-sp-desktop-v1-version.patch"
    "0002-Remove-broken-sp-product-state-v1-values.patch"
    "0003-Rename-color_scheme-from-Dynamic-to-Nord.patch"
)
sha256sums=('SKIP'
            '48e7eb239fe6e04c6cc6ae270e279e1f41282daec7e6d415a8850593f36b3abe'
            'e68ff3c3a4439478c7684a613b09128fbea99e0112b5fcd6329ea4f010fe4a83'
            '1b4555b22284ae978576dd2ac6977a6901b19df6307d552fec76c52f69c3483d')

prepare() {
    cd "${srcdir}/Nord-Spotify"
    git apply ../0001-Remove-broken-sp-desktop-v1-version.patch
    git apply ../0002-Remove-broken-sp-product-state-v1-values.patch
    git apply ../0003-Rename-color_scheme-from-Dynamic-to-Nord.patch
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
    depends=("spicetify-cli")

    cd "${srcdir}/Nord-Spotify"
    mkdir -p "${pkgdir}/opt/spicetify-cli/Themes"
    cp -a --no-preserve=ownership dist/Nord "${pkgdir}/opt/spicetify-cli/Themes"
}
