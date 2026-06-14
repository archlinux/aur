# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Aburady <accounts@aburady.com>
pkgname=plezy
pkgver=2.7.0
pkgrel=1
pkgdesc="A modern Plex and Jellyfin client"
arch=('x86_64' 'aarch64')
url="https://plezy.app"
license=('GPL-3.0-or-later')
depends=(
  'alsa-lib'
  'gtk3'
  'libepoxy'
  'libevdev'
  'libkeybinder3'
  'mpv'
)
makedepends=(
  'chrpath'
  'clang'
  'cmake'
  'fvm'
  'git'
  'java-environment'
  'imagemagick'
  'ninja'
  'unzip'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/edde746/plezy/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ad0b50f4858e21997fd8fe4631ed2512fdb05beb67416f1940f385a5dff6c8d6')

prepare() {
  cd "$pkgname-$pkgver"
  export FVM_CACHE_PATH="$srcdir/fvm"
  fvm install stable
  fvm global stable

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
  if [ $CARCH == "aarch64" ]; then
    FLUTTER_ARCH=arm64
  else
    FLUTTER_ARCH=x64
  fi

  cd "$pkgname-$pkgver"
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
