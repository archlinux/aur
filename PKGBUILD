# Maintainer: Chris Arndt <aur -at- chrisarndt -dot -de>
# Contributor: uint2048_t
# Contributor: Adam Hill

_pkgname=cannonball
pkgname=$_pkgname-git
pkgver=0.34.r19.g27493eb
pkgrel=2
pkgdesc='The Enhanced OutRun Engine (git version)'
arch=(x86_64)
url="https://github.com/djyt/cannonball/"
license=(custom)
depends=(sdl2-compat gcc-libs)
makedepends=(git cmake boost imagemagick)
provides=($_pkgname)
conflicts=($_pkgname)
install=$_pkgname.install
source=(
  "$_pkgname::git+https://github.com/djyt/cannonball.git"
  "git+https://github.com/jacktang/outrun-roms.git"
  "cannonball-no-force-alsa.patch"
  "$_pkgname.sh"
  "$_pkgname.desktop")
sha256sums=('SKIP'
            'SKIP'
            '113e57193058a69df9485fe1b58fa0c6794e6f42c76e428b01a3eda840262e31'
            'e890f18a2d117bf380276a2af1c25d8a9e43b2fc34ebcda657eed78ec52cabaf'
            'c2f445e177a725561ac7307234351c97b18d500ef317cbafafe584c1fba2d114')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  cd $_pkgname
  patch -p1 -N -r - -i "$srcdir"/cannonball-no-force-alsa.patch
}

build() {
  cmake \
    -Wno-dev \
    -DTARGET=linux.cmake \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -B $_pkgname-build -S $_pkgname/cmake
  cmake --build $_pkgname-build
}

package() {
  install -Dm 755 $_pkgname-build/$_pkgname -t "$pkgdir"/opt/$_pkgname
  install -Dm 644 $_pkgname-build/config.xml -t "$pkgdir"/opt/$_pkgname

  cd $_pkgname

  for _size in "256x256" "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
  do
    install -dm 755 "$pkgdir"/usr/share/icons/hicolor/$_size/apps
    magick res/icon.png -resize "$_size" "$pkgdir"/usr/share/icons/hicolor/$_size/apps/$_pkgname.png
  done

  sed -i s/hires\>0/hires\>1/g "$pkgdir"/opt/$_pkgname/config.xml

  install -Dm 644 res/*.bin -t "$pkgdir"/opt/$_pkgname/res
  install -Dm 644 $srcdir/outrun-roms/* -t "$pkgdir"/opt/$_pkgname/roms

  # Desktop integration
  install -Dm755 "$srcdir"/$_pkgname.sh "$pkgdir"/usr/bin/$_pkgname
  install -Dm755 "$srcdir"/$_pkgname.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop

  # License
  install -Dm 644 docs/license.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
