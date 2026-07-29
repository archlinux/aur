# Maintainer: DarshanS26 <https://github.com/DarshanS26>
pkgname=resolve-kit
pkgver=1.0.0
pkgrel=1
pkgdesc="DaVinci Resolve Linux toolkit — transcode, export, diagnose, and optimize"
arch=('any')
url="https://github.com/DarshanS26/davinci-kit"
license=('MIT')
depends=('bash' 'ffmpeg' 'python' 'desktop-file-utils')
optdepends=(
  'python-pyqt6: GUI frontend (recommended)'
  'python-pyside6: GUI frontend alternative'
  'parallel: parallel transcode/export/audio jobs'
  'inotify-tools: davinci-kit-watch folder monitoring'
  'clinfo: OpenCL diagnostics in davinci-kit-info'
  'nvidia-utils: NVIDIA GPU diagnostics in davinci-kit-info'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/DarshanS26/davinci-kit/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f0f8ef668877a41ddd4d21344fdbdb272d170d4686b58b1bf673269cb1212663')
install=resolve-kit.install

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install project layout
  install -dm755 "$pkgdir/usr/share/resolve-kit"
  cp -r bin gui lib config docs "$pkgdir/usr/share/resolve-kit/"
  install -Dm644 README.md "$pkgdir/usr/share/resolve-kit/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Expose binaries in /usr/bin via symlink
  install -dm755 "$pkgdir/usr/bin"
  for tool in bin/resolve-* bin/davinci-kit bin/davinci-kit-update; do
    ln -s "/usr/share/resolve-kit/bin/$(basename "$tool")" "$pkgdir/usr/bin/$(basename "$tool")"
  done

  # Desktop file (patch Icon to davinci-kit)
  sed -i 's|Icon=.*|Icon=davinci-kit|' davinci-kit.desktop
  install -Dm644 davinci-kit.desktop "$pkgdir/usr/share/applications/davinci-kit.desktop"

  # SVG Icon
  install -Dm644 packaging/davinci-kit.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/davinci-kit.svg"
}
