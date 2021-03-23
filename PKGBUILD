# Maintainer: Isaac Mills <rooster0055@protonmail.com>

pkgname=dogehouse
pkgver=1.0.19
pkgrel=10
pkgdesc="Taking voice conversations to the moon"
url="https://dogehouse.tv"
license=('MIT')
arch=('x86_64')
makedepends=(
    'git'
    'yarn'
    'nodejs'
)
depends=(
    'c-ares'
    'ffmpeg'
    'gtk3'
    'http-parser'
    'libevent'
    'libvpx'
    'libxslt'
    'libxss'
    'minizip'
    'nss'
    're2'
    'snappy'
    'libnotify'
    'libappindicator-gtk3'
)
source=("${pkgname}::https://github.com/benawad/dogehouse/archive/refs/tags/v${pkgver}.tar.gz")
conflicts=("${pkgname}" "${pkgname}-bin" "${pkgname}-git")

prepare() {
    cd "${srcdir}/dogehouse"
    git reset --hard $(git describe --abbrev=0 --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
}

build() {
    cd "${srcdir}/dogehouse/baklava"
    yarn install
    yarn compile
    ./node_modules/.bin/electron-builder --linux --x64 --dir
}

package() {
    cd "${srcdir}/dogehouse/baklava/builds/linux-unpacked"
    install -d -m755 ${pkgdir}/usr/bin
    install -d -m755 ${pkgdir}/usr/share/{${pkgname},applications,pixmaps}
    cp -r . ${pkgdir}/usr/share/${pkgname}
    ln -s /usr/share/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
    install -D -m644 ${srcdir}/../dogehouse.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -D -m644 ${srcdir}/dogehouse/baklava/icons/icon.png \
          ${pkgdir}/usr/share/pixmaps/dogehouse.png
}

md5sums=('SKIP')
