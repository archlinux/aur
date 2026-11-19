# Maintainer: Aidan Heeney <aidan.heeney@proton.me>
# Built from the repo's desktop-vX.Y.Z tags (the phone app's are v1.0.<n>).
# Carries Squelch's dictation engine and replaces the squelch package. After a
# Squelch release, bump _squelch and keep depends and the whisper.cpp commit in
# step with Squelch's PKGBUILD.
pkgname=nullspace
pkgver=1.1.3
pkgrel=1
_squelch=0.12.1
pkgdesc='Tasks, notes, screen captures, voice notes and dictation from one key'
arch=('x86_64')
url='https://github.com/ieatfood314/nullspace'
license=('MIT')
depends=('python' 'python-pyqt6' 'python-pyqt6-webengine' 'qt6-svg'
         'qt6-imageformats' 'spectacle' 'libnotify' 'python-gobject'
         'at-spi2-core' 'layer-shell-qt'
         # the dictation engine (Squelch's)
         'python-evdev' 'python-numpy' 'ydotool' 'wl-clipboard' 'pipewire'
         'vulkan-icd-loader' 'playerctl' 'polkit' 'qt6-tools' 'wireplumber'
         'libxkbcommon' 'glib2')
makedepends=('git' 'cmake' 'vulkan-headers' 'spirv-headers')
optdepends=('aspell-en: learn your vocabulary and mishearings'
            'kanata: stop the trigger key doing its own job too')
provides=("squelch=$_squelch")
conflicts=('squelch')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/desktop-v$pkgver.tar.gz"
        "squelch-$_squelch.tar.gz::https://github.com/ieatfood314/squelch/archive/refs/tags/v$_squelch.tar.gz"
        "whisper.cpp::git+https://github.com/ggml-org/whisper.cpp.git#commit=0c7be696371069e0baa2515ed7aa08d5a5473aa6")
sha256sums=('fa229649ac0acc52c23fe60cc59cc380c99d6f7de954b23b5cc808b0d3a4c5a8'
            'dd1a363307251026cf528c8e5e90fb62c6b4ef103997e76e6778b49228568980'
            'SKIP')
options=('!debug')

build() {
  cmake -S "$srcdir/whisper.cpp" -B "$srcdir/build" \
    -DGGML_VULKAN=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_SKIP_RPATH=ON
  cmake --build "$srcdir/build" --config Release -j"$(nproc)" \
    --target whisper-server whisper-cli parakeet-cli
}

package() {
  cd "$srcdir/squelch-$_squelch"
  packaging/install-engine "$pkgdir" "$srcdir/build" --no-launcher
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.squelch"

  cd "$srcdir/$pkgname-desktop-v$pkgver"
  install -Dm755 desktop/nullspace-desktop -t "$pkgdir/usr/bin/"
  install -Dm644 desktop/settings.html -t "$pkgdir/usr/lib/nullspace/desktop/"
  install -Dm755 server/nullspace.py -t "$pkgdir/usr/lib/nullspace/server/"
  install -d "$pkgdir/usr/lib/nullspace/web"
  cp -r web/. "$pkgdir/usr/lib/nullspace/web/"
  install -Dm644 desktop/nullspace-desktop.service desktop/nullspace-hub.service \
    -t "$pkgdir/usr/lib/systemd/user/"
  install -Dm644 desktop/nullspace.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 web/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/nullspace.svg"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
