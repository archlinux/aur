# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Aburady <accounts@aburady.com>
pkgname=plezy
pkgver=2.10.0
pkgrel=1
_flutter_ver=3.44.0
pkgdesc="A modern Plex and Jellyfin client"
arch=('x86_64' 'aarch64')
url="https://plezy.app"
license=('GPL-3.0-or-later')
depends=(
  'alsa-lib'
  'gtk3'
  'libepoxy'
  'libevdev'
  'mpv'
)
makedepends=(
  'chrpath'
  'clang'
  'cmake'
  'fvm'
  'git'
  'java-environment=17'
  'imagemagick'
  'ninja'
  'unzip'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/edde746/plezy/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f695d86b225c6b775dc0351c7d3b387f43b82c6f2e45d3aae9ae5ea90f3aa1a0')

prepare() {
  cd "$pkgname-$pkgver"
  export FVM_CACHE_PATH="$srcdir/fvm"
  fvm install "${_flutter_ver}"
  fvm global "${_flutter_ver}"

  fvm flutter --disable-analytics
  fvm flutter pub get
}

build() {
  cd "$pkgname-$pkgver"
  export FVM_CACHE_PATH="$srcdir/fvm"
  fvm flutter build linux --release --dart-define=ENABLE_UPDATE_CHECK=false

  # Generate icons
  for i in 16 32 48 64 128 256 512; do
    magick "assets/$pkgname.png" -resize "${i}x${i}" "assets/${pkgname}_${i}x${i}.png"
  done
}

package() {
  cd "$pkgname-$pkgver"

  if [ $CARCH == "aarch64" ]; then
    FLUTTER_ARCH=arm64
  else
    FLUTTER_ARCH=x64
  fi

  # Not required at runtime as it's only used on Android
  rm -fv "build/linux/${FLUTTER_ARCH}/release/bundle/lib/libdartjni.so"

  install -Dm755 "build/linux/${FLUTTER_ARCH}/release/bundle/$pkgname" -t \
    "$pkgdir/opt/$pkgname/"
  cp -a build/linux/${FLUTTER_ARCH}/release/bundle/{data,lib} "$pkgdir/opt/$pkgname/"
  chmod 0755 "$pkgdir/opt/$pkgname/lib/crashpad_handler"

  install -Dm755 "linux/packaging/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "linux/packaging/com.edde746.$pkgname.desktop" -t \
    "$pkgdir/usr/share/applications/"
  install -Dm644 "assets/$pkgname.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 "assets/$pkgname.png" -t \
    "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/"
  for i in 16 32 48 64 128 256 512; do
    install -Dm644 "assets/${pkgname}_${i}x${i}.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done

  # Remove insecure RUNPATH pointing to build dir
  chrpath --delete "$pkgdir/opt/$pkgname"/lib/*
}
