# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ooniprobe-desktop
pkgver=6.2.1
pkgrel=1
pkgdesc="Free and open source app to measure internet censorship and network interference"
arch=('x86_64')
url="https://ooni.org"
license=('GPL-3.0-or-later')
depends=(
  'alsa-lib'
  'fontconfig'
  'freetype2'
  'giflib'
  'glibc'
  'harfbuzz'
  'hicolor-icon-theme'
  'java-runtime'
  'lcms2'
  'libgcc'
  'libpng'
  'libx11'
  'libxext'
  'libxi'
  'libglvnd'
  'libjpeg-turbo'
  'libxrender'
  'libxtst'
  'zlib'
)
makedepends=(
  'clang'
  'java-environment=25'
)
conflicts=("${pkgname%-desktop}")
source=("$pkgname-$pkgver.tar.gz::https://github.com/ooni/probe-multiplatform/archive/refs/tags/v$pkgver.tar.gz"
        'ooniprobe.desktop')
sha256sums=('7b9cb0872fe51073e1b04e7835c24238ca145a46f2801b79ebde7664b3656b4b'
            '26be1fc84ed6b63b06b7409d0c1795d8ea3df60a27863b7385b0d9dd4f73f255')

build() {
  cd "probe-multiplatform-$pkgver"
  export GRADLE_OPTS="-Dorg.gradle.daemon=false"
  ./gradlew desktopApp:makeLibrary
  ./gradlew createDistributable
}

package() {
  cd "probe-multiplatform-$pkgver"
  install -Dm644 icons/app.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/ooniprobe.svg"

  cd "desktopApp/build/compose/binaries/main/app/OONI Probe"
  install -Dm755 "bin/OONI Probe" -t \
    "$pkgdir/usr/share/java/ooniprobe/bin/"
  install -Dm755 lib/libapplauncher.so -t "$pkgdir/usr/share/java/ooniprobe/lib/"
  cp -a lib/{app,runtime} "$pkgdir/usr/share/java/ooniprobe/lib/"

  install -d "$pkgdir/usr/bin"
  ln -sf "/usr/share/java/ooniprobe/bin/OONI Probe" "$pkgdir/usr/bin/ooniprobe"

  install -Dm644 "$srcdir/ooniprobe.desktop" -t "$pkgdir/usr/share/applications/"
}
