# Maintainer: root <root@feds.farm>
pkgname=drwrap
pkgver=0.1.0
pkgrel=1
pkgdesc="Drag any video into DaVinci Resolve on Linux and it just works (codec fix + drop shim + auto-import)"
arch=('any')
url="https://github.com/fedsfarm/drwrap"
license=('GPL-3.0-or-later')
depends=('python' 'python-xlib' 'ffmpeg')
optdepends=(
  'davinci-resolve: the editor this wraps'
  'davinci-resolve-studio: unlocks automatic import + in-place healing'
  'libnotify: desktop notifications'
  'inotify-tools: lower-latency watch folder'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
install=drwrap.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8b27e6817454feaeb1a865c7ed56bf27549bcb4c7a2095a9ce537f08672b3177')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # App-menu launcher: "DaVinci Resolve (wrapped)"
  install -Dm644 packaging/drwrap.desktop \
    "$pkgdir/usr/share/applications/drwrap.desktop"

  # Optional always-on converter as a systemd --user service, pointed at the
  # system-wide binary this package installs.
  install -Dm644 packaging/drwrap.service \
    "$pkgdir/usr/lib/systemd/user/drwrap.service"
  sed -i 's|%h/.local/bin/drwrap|/usr/bin/drwrap|' \
    "$pkgdir/usr/lib/systemd/user/drwrap.service"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
