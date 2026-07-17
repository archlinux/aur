# Maintainer: AndroidHyperOfficial
pkgname=vpngfetch
pkgver=1.0.0
pkgrel=1
pkgdesc="A hyper-fast, lightweight system fetch utility written in pure C with native image rendering"
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h' 'i686' 'i486' 'i586')
url="https://github.com/AndroidHyperOfficial/vpngfetch"
license=('GPL3') 
depends=('glibc')
makedepends=('gcc')
source=("git+${url}.git")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  
  # Patches the global system asset storage path dynamically
  sed 's|#define ASSET_PATH "assets/"|#define ASSET_PATH "/usr/share/vpngfetch/assets/"|' main.c > main_patched.c
  
  gcc -O3 main_patched.c lodepng.c -o vpngfetch -lm
}

package() {
  cd "${srcdir}/${pkgname}"
  
  # Install binary to standard execution path
  install -Dm755 vpngfetch "${pkgdir}/usr/bin/vpngfetch"
  
  # Install assets globally
  mkdir -p "${pkgdir}/usr/share/vpngfetch/assets"
  cp -r assets/* "${pkgdir}/usr/share/vpngfetch/assets/"
}