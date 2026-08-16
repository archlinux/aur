# Maintainer: Aria Quinlan <hello@aria.coffee>
pkgname=linuwux-runtime-git
pkgver=26.08.15.2.r148.g650bd34
pkgrel=1
pkgdesc="LD_PRELOAD runtime that supplies Linux/Wine-side interpositions for Windows software"
arch=('x86_64')
url="https://github.com/brcly/linuwux-runtime"
license=('AGPL-3.0-or-later')
depends=('glibc')
makedepends=('git' 'gcc')
provides=("linuwux-runtime")
conflicts=("linuwux-runtime")
source=("git+https://github.com/brcly/linuwux-runtime.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  
  _ver=$(grep -Po 'VERSION="\$\{LINUWUX_VERSION_OVERRIDE:-\K[^}]+(?=\}")' build.sh)
  printf "%s.r%s.g%s" "$_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  
  ./build.sh
}

package() {
  cd "${pkgname%-git}"
  
  # Install the shared library
  install -Dm755 dist/liblinuwux.so "$pkgdir/usr/lib/liblinuwux.so"
  
  # Install the launch wrapper
  install -Dm755 src/linuwux.sh "$pkgdir/usr/bin/linuwux"
  
  # Patch the launch wrapper to point to the system-wide library instead of ~/.local
  sed -i 's|\${HOME}/.local/lib/liblinuwux.so|/usr/lib/liblinuwux.so|g' "$pkgdir/usr/bin/linuwux"
  
  # Update the launch instructions in the wrapper's error messages
  sed -i 's|~/.local/bin/linuwux|linuwux|g' "$pkgdir/usr/bin/linuwux"
  
  # Install the license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
