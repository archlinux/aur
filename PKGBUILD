# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Aburady <accounts@aburady.com>
pkgname=plezy
pkgver=1.21.3
pkgrel=1
pkgdesc="A beautiful Plex media server client built with Flutter"
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
  'imagemagick'
  'ninja'
  'unzip'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/edde746/plezy/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6d54b029376b31a65cc456b6d485c8415c2977d905e0cd2d965a59e4a7dc6719')

prepare() {
  cd "$pkgname-$pkgver"
  export FVM_CACHE_PATH="$srcdir/fvm"
  fvm use stable --pin

  fvm flutter --disable-analytics
  fvm flutter pub get

  # Remove -Werror from all CMakeLists.txt (fixes strict clang warnings in plugins)
  find . -name 'CMakeLists.txt' -exec sed -i 's/-Werror//g' {} +
}

build() {
  cd "$pkgname-$pkgver"
  export FVM_CACHE_PATH="$srcdir/fvm"
  fvm flutter build linux --release

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
  cp -a build/linux/${FLUTTER_ARCH}/release/bundle/{data,lib} "$pkgdir/opt/$pkgname"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/"

  install -Dm644 "linux/packaging/com.edde746.$pkgname.desktop" -t \
    "$pkgdir/usr/share/applications/"
  install -Dm644 "assets/$pkgname.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  for i in 16 32 48 64 128 256 512; do
    install -Dm644 "assets/${pkgname}_${i}x${i}.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done

  # Remove insecure RUNPATH pointing to build dir
  chrpath --delete "$pkgdir/opt/$pkgname"/lib/*.so
}
