# Maintainer: Isaac Mills <rooster0055@protonmail.com>

pkgname=dogehouse
pkgver=1.0.19
pkgrel=1
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
    'dbus-x11'
    'nss'
    'gtk3'
)
source=("${pkgname%-git}::git+https://github.com/benawad/dogehouse.git")

prepare() {
    sudo yarn global add electron-builder
}

build() {
    cd "${srcdir}/dogehouse/baklava"
    yarn install
    yarn compile
    electron-builder --linux --dir
}

package() {
    cd "${srcdir}/dogehouse/baklava/builds/linux-unpacked"
    install -d -m755 ${pkgdir}/usr/share/{${pkgname},applications,pixmaps}
    cp -r . ${pkgdir}/usr/share/${pkgname}
    install -D -m644 ${srcdir}/../dogehouse.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -D -m644 ${srcdir}/dogehouse/baklava/icons/icon.png \
          ${pkgdir}/usr/share/pixmaps/dogehouse.png
}

md5sums=('SKIP')
