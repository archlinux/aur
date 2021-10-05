# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Skykey <zcxzxlc@163.com>
pkgname=qtscrcpy-git
_pkgname=QtScrcpy
pkgver=1.7.1.r0.g543e22d
pkgrel=1
pkgdesc="Android real-time screencast control tool"
arch=('x86_64')
url="https://github.com/barry-ran/QtScrcpy"
license=('Apache')
depends=('android-tools' 'ffmpeg' 'qt5-x11extras')
makedepends=('cmake' 'git' 'qt5-tools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'qt-scrcpy')
backup=("etc/${pkgname%-git}/config.ini")
source=('git+https://github.com/barry-ran/QtScrcpy.git'
        'path-fix.patch'
        "${pkgname%-git}.desktop"
        "${pkgname%-git}.sh")
sha256sums=('SKIP'
            '19a9dae14c041715ee96cb6357c9f46ff7a9c5342f7e0d798bb17d6244347bfe'
            '0dc5b08698162c8a0172a9c2e92b18fa7cd9df4b295bd350329b1e4dbd892a6e'
            '26335d1e208c47ddfc4abaabce3f32734788a80a6663577b3ff462346d8dec6f')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"

  # Use system packages instead of static bundled tools
  rm -rf third_party/{adb,ffmpeg}

  cd "$_pkgname"
  patch < "$srcdir/path-fix.patch"
}

build() {
  cmake -B build -S "$_pkgname" \
    -DCMAKE_BUILD_TYPE='None' \
    -Wno-dev
  make -C build
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "output/linux/release/$_pkgname" -t "$pkgdir/opt/${pkgname%-git}"
  install -Dm644 backup/logo.png "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
  install -Dm644 config/config.ini -t "$pkgdir/etc/${pkgname%-git}"
  install -Dm644 third_party/scrcpy-server -t "$pkgdir/opt/${pkgname%-git}"

  cp -r keymap "$pkgdir/opt/${pkgname%-git}"
  chmod 666 "$pkgdir/opt/${pkgname%-git}/keymap"

  install -d "$pkgdir/usr/share/doc/${pkgname%-git}"
  cp -r docs/* "$pkgdir/usr/share/doc/${pkgname%-git}"

  install -Dm755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
  install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
}
