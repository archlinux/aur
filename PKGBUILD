# Maintainer: Sayem Chowdhury <sayem314 at yandex dot com>
pkgname=lunarr
_pkgrepo=lunarr-go
pkgver=0.8.0
pkgrel=1
pkgdesc='Self-hosted media streaming server and Plex alternative for movies and TV'
arch=('x86_64' 'aarch64')
url='https://github.com/lunarr-app/lunarr-go'
license=('Apache-2.0')
depends=('nodejs>=24' 'ffmpeg')
makedepends=('npm')
install=lunarr.install
source=("$url/archive/refs/tags/v$pkgver.tar.gz" "lunarr.service" "lunarr.install")
b2sums=('SKIP'
        '1979431418ee7e291bb3b8a493928d9aa1cee5a113e82dd14985ca92ce882c2b5d167487bb60ee6a7e40af1ac54f91e244a55ead0f91ab91577135ecc08267f8'
        '6e2c538d4abf8601079d2c2d186a677ee72badaee45fa08275f39b0150f00604e43505e2f0660122085222ed69c8e5e505f91ac019b4d826c97b4630fbaecd5d')

prepare() {
  cd "$srcdir/$_pkgrepo-$pkgver"
  npm install
}

build() {
  cd "$srcdir/$_pkgrepo-$pkgver"
  npm run build
  npm prune --omit=dev

  arch_native=$(uname -m)
  [ "$arch_native" = "x86_64" ] && native_suffix="linux-x64-gnu" || native_suffix="linux-arm64-gnu"
  for dir in node_modules/@{libsql,seydx}/*; do
    [ -d "$dir" ] || continue
    base=$(basename "$dir")
    if [[ "$base" != *"$native_suffix"* ]]; then
      rm -rf "$dir"
    fi
  done
}

package() {
  cd "$srcdir/$_pkgrepo-$pkgver"

  install -d "$pkgdir/usr/lib/lunarr"
  cp -r build package.json node_modules scripts "$pkgdir/usr/lib/lunarr/"

  install -Dm644 "$srcdir/lunarr.service" "$pkgdir/usr/lib/systemd/system/lunarr.service"
}
