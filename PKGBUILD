# Maintainer: Dheeraj Vittal Shenoy <dheerajshenoy22@gmail.com>

pkgname=navifm-git
pkgver=r379.3e1012b
pkgrel=1
pkgdesc="Highly customizable and extensible modern file manager"
arch=('x86_64')
url="https://github.com/dheerajshenoy/navifm"
license=('GPL3')
depends=('qt6-base' 'qt6-svg' 'poppler-qt6' 'libarchive' 'lua' 'imagemagick' 'gcc-libs' 'glibc' 'base-devel' 'ffmpegthumbnailer')
makedepends=('cmake' 'ninja' 'git' 'pkgconf' 'sccache' 'ccache')
source=("${pkgname%-git}::git+$url")
provides=("${pkgname%-git}")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    sh "build.sh"
}

package() {
    cd "$srcdir/${pkgname%-git}/bin"

  # Install binary
  install -Dm755 "navifm" "$pkgdir/usr/bin/navifm"

  # Install shared resources
  install -d "$pkgdir/usr/share/navifm"
  cp -r "../data/_lua/" "$pkgdir/usr/share/navifm/"

  # Install icons (if available)
  # install -d "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  # install -Dm644 "$srcdir/$pkgname-$pkgver/resources/images/menu.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/navi.svg"

  # Install .desktop entry (if available)
  install -Dm644 "../resources/navifm.desktop" "$pkgdir/usr/share/applications/navifm.desktop"

  # Install man pages (if available)
  # install -d "$pkgdir/usr/share/man/man1"
  # if [[ -f "$srcdir/$pkgname/docs/navi.1" ]]; then
  #     install -Dm644 "$srcdir/$pkgname/docs/navi.1" "$pkgdir/usr/share/man/man1/navi.1"
  # fi
}
