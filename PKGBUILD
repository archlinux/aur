# Contributor: David Birks <david@tellus.space>
# Contributor: Simon Doppler (dopsi) <dop.simon@gmail.com>
# Contributor: dpeukert
_gitname=marktext
pkgname=marktext-git
pkgver=r1380.65f1bef3
pkgrel=1
pkgdesc='Next generation markdown editor'
arch=('x86_64')
url='https://marktext.app/'
license=('MIT')
depends=('electron')
makedepends=('python' 'nodejs>=12' 'npm' 'yarn')
conflicts=('marktext')
provides=('marktext')
source=("git+https://github.com/${_gitname}/${_gitname}"
        'marktext.sh')
sha512sums=('SKIP'
            '8927cea6815420206982263d80fa54bbcfcc37623008b6a2f25d16782cfdff70ef44c3dbc142e2c45b474df52f216e7d58cf556a525df0683bc447481ab7b27d')

pkgver() {
    cd "${srcdir}/${_gitname}"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_gitname}"
    yarn install
}

build() {
    cd "${srcdir}/${_gitname}"
    yarn run build:bin
}

package() {
    cd "${srcdir}/${_gitname}"

    # Install app.asar and launcher script
    install -D build/linux-unpacked/resources/app.asar "${pkgdir}/usr/share/marktext/app.asar"
    cp -r build/linux-unpacked/resources/app.asar.unpacked "${pkgdir}/usr/share/marktext/app.asar.unpacked"
    install -D "${srcdir}/marktext.sh" "${pkgdir}/usr/bin/marktext"

    # Install desktop file and icon
    install -D resources/linux/marktext.desktop "${pkgdir}/usr/share/applications/marktext.desktop"
    install -D resources/icons/icon.png "${pkgdir}/usr/share/pixmaps/marktext.png"

    # Install license file
    install -D LICENSE "${pkgdir}/usr/share/licenses/marktext/LICENSE"
    install -D build/linux-unpacked/LICENSE.electron.txt "${pkgdir}/usr/share/licenses/marktext/LICENSE.electron.txt"
    install -D build/linux-unpacked/LICENSES.chromium.html "${pkgdir}/usr/share/licenses/marktext/LICENSES.chromium.html"
}
