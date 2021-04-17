# Maintainer: Isaac Mills <rooster0055@protonmail.com>

pkgname=dogehouse
pkgver=1.0.58
pkgrel=1
pkgdesc="Taking voice conversations to the moon"
url="https://dogehouse.tv"
license=('MIT')
arch=('x86_64')
makedepends=(
    'git'
    'yarn'
    'nodejs'
    'rustup'
)
depends=(
    'gtk3'
    'nss'
    'libnotify'
    'libappindicator-gtk3'
)
source=("${pkgname}.tar.gz::https://github.com/benawad/dogehouse/archive/refs/tags/v${pkgver}.tar.gz")
conflicts=("${pkgname}" "${pkgname}-bin" "${pkgname}-git")

build() {
    rustup update stable
    cd "${srcdir}/dogehouse-${pkgver}/baklava"
    yarn install
    cargo install nj-cli
    yarn compile
    yarn build:globkey
    rm -rf ./node_modules/globkey/src
    rm -rf ./node_modules/globkey/target
    ./node_modules/.bin/electron-builder --linux --x64 --dir
}

package() {
    cd "${srcdir}/dogehouse-${pkgver}/baklava/builds/linux-unpacked"
    install -d -m755 ${pkgdir}/usr/bin
    install -d -m755 ${pkgdir}/usr/share/{${pkgname},applications,pixmaps}
    cp -r . ${pkgdir}/usr/share/${pkgname}
    ln -s /usr/share/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
    install -D -m644 ${srcdir}/../dogehouse.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -D -m644 ${srcdir}/dogehouse-${pkgver}/baklava/icons/icon.png \
          ${pkgdir}/usr/share/pixmaps/dogehouse.png
}

md5sums=('SKIP')
