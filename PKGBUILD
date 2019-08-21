# Maintainer: Atnanasi <ys2000pro at gmail.com>
# Contributor: Atnanasi <ys2000pro at gmail.com>

pkgname='editaro'
pkgver='1.5.0'
pkgrel='1'
pkgdesc='Simple text editor for draft'
url='https://github.com/kkosuge/editaro'
arch=('x86_64')
license=('MIT')
depends=('electron2')
makedepends=('yarn' 'nodejs-lts-dubnium')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}")
md5sums=('c26e2f44ab5cf912be9fb5c757b77bc7'
         '1ef1ba8c15bfd1e05784eef4bcbc1fef'
         'b9f9eb8ee4f95edb973a6b18499dd97a')

build() {
    cd "$pkgname-$pkgver"

    npm_config_target="$(cat /usr/lib/electron2/version | tail -c +2)"
    npm_config_arch='x64'
    npm_config_target_arch='x64'
    npm_config_disturl='https://atom.io/download/electron'
    npm_config_runtime='electron'
    npm_config_build_from_source='true'

    HOME="$srcdir/.electron-gyp" yarn install
    yarn run vue-cli-service electron:build --linux
}

package() {
    cd "$pkgname-$pkgver"

    install -dm755 "${pkgdir}/usr/lib"
    install -dm755 "${pkgdir}/usr/share/applications"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    install -dm755 "${pkgdir}/usr/share/pixmaps"

    install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 'icons/png/96x96.png' "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 'dist_electron/linux-unpacked/resources/app.asar' "${pkgdir}/usr/lib/${pkgname}/app.asar"
    install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 "../${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
