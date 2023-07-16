# Merged with official ABS scrcpy PKGBUILD by João, 2023/05/14 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: skydrome -at- protonmail

pkgname=scrcpy-git
pkgver=2.1.1_r2217.gfcdf847d
pkgrel=1
pkgdesc='Display and control your Android device'
arch=($CARCH)
url='https://github.com/Genymobile/scrcpy'
license=(Apache)
depends=(android-tools ffmpeg sdl2)
makedepends=(git meson)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/Genymobile/${pkgname%-git}.git"
        "$url/releases/download/v${pkgver%_*}/${pkgname%-git}-server-v${pkgver%_*}")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(git describe | sed 's/^v//;s/-.*//')"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p build
  arch-meson build ${pkgname%-git} \
    -D b_lto=true \
    -D b_ndebug=true \
    -D prebuilt_server=../${pkgname%-git}-server-v${pkgver%_*} \
    --buildtype release
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 ${pkgname%-git}/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
