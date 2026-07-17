# Maintainer: AndroidHyper <iuseopensusebtw@gmail.com>
pkgname=vpngfetch
pkgver=1.5.0
pkgrel=1
pkgdesc="A super fast, lightweight system fetch tool written in C that renders PNG logos"
arch=('x86_64' 'aarch64')
url="https://github.com/AndroidHyperOfficial/vpngfetch"
license=('GPL') # Or your preferred open-source license model
depends=('glibc')
makedepends=('git' 'gcc')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP') # Using SKIP since it tracks the locked git tag directly

build() {
    cd "${pkgname}"
    # Match the inline asset path patch used in your local make setup
    sed -i 's|#define ASSET_PATH "assets/"|#define ASSET_PATH "/usr/share/vpngfetch/assets/"|' main.c
    gcc -O3 main.c lodepng.c -o vpngfetch -lm
}

package() {
    cd "${pkgname}"
    install -Dm755 vpngfetch "${pkgdir}/usr/bin/vpngfetch"
    
    # Ensure the target directory exists
    mkdir -p "${pkgdir}/usr/share/vpngfetch/assets"
    
    # Clean fix: Only grab the .png images so it ignores the packaging directory
    install -m644 assets/*.png "${pkgdir}/usr/share/vpngfetch/assets/"
}