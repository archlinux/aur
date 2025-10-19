# Maintainer: Mahor Foruzesh <mahor1221 at gmail dot com>
# Maintainer: Padya1201 <padya1201 at gmail dot com>

pkgname=tachidesk-sorayomi
_PkgName="$(echo "$pkgname" | sed -e "s/\b./\u\0/g")"
_binname="$(echo "$pkgname" | tr - _)"
pkgver=0.6.3
pkgrel=1
pkgdesc='A free and open source manga reader to read manga from a Tachidesk-Server instance'
arch=('x86_64')
url="https://github.com/Suwayomi/$_PkgName"
license=('MPL2')
depends=('zenity'
    'xdg-user-dirs'
    'gtk3'
    'at-spi2-core')
optdepends=('tachidesk-server')
makedepends=('fvm'
    'cmake'
    'clang'
    'ninja'
    'pkg-config'
)
source=("tachidesk-sorayomi-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('232c49b26888eca37e7b8cbd3901ffcda2261be0dc65e6426afaea22ab202426')

prepare() {
    cd "${srcdir}/${_PkgName}-${pkgver}"
    fvm use 3.27.1 --force
    fvm flutter config --enable-linux-desktop
}

build() {
    cd "${srcdir}/${_PkgName}-${pkgver}"
    fvm flutter pub get
    fvm flutter gen-l10n
    fvm dart run build_runner build --delete-conflicting-outputs
    fvm flutter build linux --release
}


package() {
    cd ${pkgdir}

    mkdir -p usr/share/applications usr/share/icons/hicolor/1024x1024/apps usr/bin opt/$_PkgName
    install -Dm644 "${srcdir}/${_PkgName}-${pkgver}/scripts/${pkgname}.desktop" -t "usr/share/applications/"
    install -Dm644 "${srcdir}/${_PkgName}-${pkgver}/assets/icons/launcher/sorayomi_icon.png" "usr/share/icons/hicolor/1024x1024/apps/${pkgname}.png"
    cp -a "${srcdir}/${_PkgName}-${pkgver}/build/linux/x64/release/bundle/" -T "opt/$_PkgName/"
    ln -sr "opt/$_PkgName/$_binname" "$pkgdir/usr/bin/${pkgname}"
}
