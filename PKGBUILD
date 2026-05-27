# Maintainer: AuthenDesk Project
pkgname=authendesk
pkgver=1.0.0.r4.g9e11dc7
pkgrel=1
pkgdesc="Desktop Two-Factor Authentication Token Manager (TOTP/HOTP)"
arch=('x86_64')
url="https://gitee.com/AscendLiu/AuthenDesk"
license=('MIT')
depends=(
    'qt6-base'
    'qt6-declarative'
    'qt6-widgets'
    'qt6-quickcontrols2'
    'qt6-svg'
    'openssl'
    'zbar'
    'hicolor-icon-theme'
)
makedepends=(
    'cmake'
    'gcc'
    'git'
    'ninja'
    'pkgconf'
)
source=("${pkgname}::git+https://gitee.com/AscendLiu/AuthenDesk.git")
sha256sums=('SKIP')
install=authendesk.install

pkgver() {
    cd "${pkgname}"
    printf "1.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
    cmake -B build -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_DATADIR=share
    cmake --build build --parallel $(nproc)
}

package() {
    cd "${pkgname}"

    install -Dm755 build/AuthenDesk "${pkgdir}/usr/bin/AuthenDesk"
    install -Dm644 assets/app_icon.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/authendesk.png"
    install -Dm644 assets/authendesk.desktop "${pkgdir}/usr/share/applications/authendesk.desktop"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" || true
}
