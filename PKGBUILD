# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Maintainer: Dee.H.Y <dongfengweixiao at hotmail dot com>
# This repository is a fork of musicpod-git.
# Before executing makepkg, you can set FVM_CACHE_PATH to $HOME/fvm or the path specified by the cachePath field in the $HOME/.config/fvm.fvmrc file.
pkgname=musicpod
_app_id=org.feichtmeier.Musicpod
pkgver=1.4.5
pkgrel=1
_flutterver=3.19.5
pkgdesc="Music, radio, television and podcast player"
arch=('x86_64' 'aarch64')
url="https://github.com/ubuntu-flutter-community/musicpod"
license=('GPL-3.0-or-later')
depends=('gstreamer' 'gtk3' 'mpv')
makedepends=('clang' 'cmake' 'fvm' 'ninja')
provides=("${pkgname}")
conflicts=('musicpod-git' 'musicpod-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ubuntu-flutter-community/musicpod/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1e5ffa5ff2f42fec14d2572d87efad4d6c2ae8034ac665770cbcc50bdfca4ae1')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export FVM_CACHE_PATH="$src/fvm"
  fvm install "${_flutterver}"
  fvm global "${_flutterver}"

  # Disable analytics
  fvm flutter --disable-analytics

  # Download dependencies
  fvm flutter pub get

  desktop-file-edit  --set-icon="${pkgname}" "snap/gui/$pkgname.desktop"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export FVM_CACHE_PATH="$src/fvm"
  fvm flutter build linux --release
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  desktop-file-validate "snap/gui/$pkgname.desktop"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  if [ $CARCH == "aarch64" ]; then
    FLUTTER_ARCH=arm64
  else
    FLUTTER_ARCH=x64
  fi

  install -Dm755 "build/linux/${FLUTTER_ARCH}/release/bundle/$pkgname" -t \
    "$pkgdir/opt/$pkgname/"
  cp -r build/linux/${FLUTTER_ARCH}/release/bundle/{data,lib} "$pkgdir/opt/$pkgname"

  install -Dm644 "snap/gui/$pkgname.png" -t "$pkgdir/usr/share/pixmaps/"
  install -Dm644 "snap/gui/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/"
}
