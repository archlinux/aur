# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Sergey A <murlakatamenka@disroot.org>
pkgname=falcond
pkgver=2.0.10
pkgrel=1
pkgdesc="Advanced Linux gaming performance daemon"
arch=('x86_64')
url="https://git.pika-os.com/general-packages/falcond"
license=('MIT')
depends=(
  'dbus'
  'falcond-profiles'
  'power-profiles-daemon'
  'sudo'
)
makedepends=('zig>=0.16.0')
optdepends=(
  'dmemcg-booster: dmem cgroup profile protection'
  'scx-tools: SCX Scheduler Integration'
)
conflicts=('gamemode')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
sha256sums=('7c6a1565e0ec99c9b4e18c811daf50de21082826863d6b0ef6556b4cb290b421')

prepare() {
  mkdir -p "$pkgname-$pkgver"
  bsdtar xf "$pkgname-$pkgver.tar.gz" --strip-components 1 -C "$pkgname-$pkgver"

  cd "$pkgname-$pkgver/$pkgname"
  export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache"
	zig build --fetch
}

build() {
  cd "$pkgname-$pkgver/$pkgname"
  export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache"
  DESTDIR=build zig build \
    --summary all \
    --prefix /usr \
    -Doptimize=ReleaseFast
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname/build/usr/bin/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "$pkgname/debian/$pkgname.service" -t \
    "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
