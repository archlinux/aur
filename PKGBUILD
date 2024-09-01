# Maintainer: Dee.H.Y <dongfengweixiao at hotmail dot com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# This repository is a fork of musicpod-git.
# Before executing makepkg, you can set FVM_CACHE_PATH to $HOME/fvm or the path specified by the cachePath field in the $HOME/.config/fvm/.fvmrc file.
pkgname=musicpod
_app_id=org.feichtmeier.Musicpod
pkgver=1.10.1
pkgrel=1
_flutterver=3.24.0
pkgdesc="Music, radio, television and podcast player"
arch=('x86_64' 'aarch64')
url="https://github.com/ubuntu-flutter-community/musicpod"
license=('GPL-3.0-or-later')
depends=(glibc glib2 mpv cairo gdk-pixbuf2 pango libepoxy fontconfig at-spi2-core gtk3 gcc-libs)
makedepends=('clang' 'cmake' 'fvm' 'ninja')
provides=("${pkgname}")
conflicts=('musicpod-git' 'musicpod-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ubuntu-flutter-community/musicpod/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3e41e0debd8092d244de64f3082985b7987cec0662f2a09e6c1f045405390494')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export FVM_CACHE_PATH="$srcdir/.fvm"
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
  export FVM_CACHE_PATH="$srcdir/.fvm"
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
