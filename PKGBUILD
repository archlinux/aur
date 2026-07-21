# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ecode
pkgver=0.8.1
pkgrel=1
pkgdesc="Lightweight multi-platform code editor designed for modern hardware with a focus on responsiveness and performance."
arch=('x86_64' 'aarch64')
url="https://github.com/SpartanJ/ecode"
license=('MIT')
depends=(
  'glibc'
  'hicolor-icon-theme'
  'libelf'
  'libglvnd'
  'sdl3'
)
makedepends=(
  'git'
  'premake'
)
provides=('libeepp.so')
source=("git+https://github.com/SpartanJ/eepp.git#tag=$pkgname-$pkgver"
        'git+https://github.com/SpartanJ/efsw.git'
        'git+https://github.com/SpartanJ/soil2.git'
        'git+https://github.com/jimon/premake-ninja.git'
        'git+https://github.com/Jarod42/premake-cmake.git')
sha256sums=('f667765450b84c9dbd11e8d76f9c311432246431f418619bfe832a03b814f5e7'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd eepp
  git submodule init
  git config submodule.src/thirdparty/efsw.url "$srcdir/efsw"
  git config submodule.src/thirdparty/SOIL2.url "$srcdir/soil2"
  git config submodule.premake/premake-ninja.url "$srcdir/premake-ninja"
  git config submodule.src/premake/premake-cmake.url "$srcdir/premake-cmake"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd eepp
  premake5 --with-backend=SDL3 gmake
  make config=release_${CARCH} "$pkgname" -C make/linux
}

package() {
  cd eepp
  install -Dm755 "bin/$pkgname" -t "$pkgdir/opt/$pkgname/"
  cp -r bin/assets "$pkgdir/opt/$pkgname/"
  install -Dm755 libs/linux/${CARCH}/libeepp.so -t "$pkgdir/usr/lib/"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/"

  install -d "$pkgdir/usr/share/pixmaps"
  ln -s "/opt/$pkgname/assets/icon/ee.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

  install -d "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  ln -s "/opt/$pkgname/assets/icon/$pkgname-icon.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"

  install -Dm644 "projects/linux/$pkgname/$pkgname.desktop" -t \
    "$pkgdir/usr/share/applications/"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
