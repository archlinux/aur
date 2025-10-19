# Maintainer: Mahor Foruzesh <mahor1221 at gmail dot com>

pkgname=tachidesk-sorayomi-git
_pkgname="${pkgname%-git}"
_PkgName="$(echo "$_pkgname" | sed -e "s/\b./\u\0/g")"
_binname="$(echo "$_pkgname" | tr - _)"
pkgver=0.6.3.r540.df37f4ce
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
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_PkgName"
  printf "%s.r%s.%s" "$(git describe --tags | cut -d"-" -f1)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_PkgName}"
    fvm use 3.27.1 --force
    fvm flutter config --enable-linux-desktop
}

build() {
    cd "${srcdir}/${_PkgName}"
    fvm flutter pub get
    fvm flutter gen-l10n
    fvm dart run build_runner build --delete-conflicting-outputs
    fvm flutter build linux --release
}


package() {
    cd ${pkgdir}

    mkdir -p usr/share/applications usr/share/icons/hicolor/1024x1024/apps usr/bin opt/$_PkgName
    install -Dm644 "${srcdir}/${_PkgName}/scripts/${pkgname}.desktop" -t "usr/share/applications/"
    install -Dm644 "${srcdir}/${_PkgName}/assets/icons/launcher/sorayomi_icon.png" "usr/share/icons/hicolor/1024x1024/apps/${pkgname}.png"
    cp -a "${srcdir}/${_PkgName}/build/linux/x64/release/bundle/" -T "opt/$_PkgName/"
    ln -sr "opt/$_PkgName/$_binname" "$pkgdir/usr/bin/${pkgname}"
}
