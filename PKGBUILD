# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ecode
pkgver=0.6.3
pkgrel=1
pkgdesc="Lightweight multi-platform code editor designed for modern hardware with a focus on responsiveness and performance."
arch=('x86_64' 'aarch64')
url="https://github.com/SpartanJ/ecode"
license=('MIT')
depends=('hicolor-icon-theme' 'libglvnd' 'sdl2')
makedepends=('git' 'premake')
provides=('libeepp.so')
source=("git+https://github.com/SpartanJ/eepp.git#tag=$pkgname-$pkgver"
        'git+https://github.com/SpartanJ/efsw.git'
        'git+https://github.com/SpartanJ/soil2.git')
sha256sums=('ca63eb057e172b24fc79ea9c9e3722fe4f0731e287712477267577fef40e2988'
            'SKIP'
            'SKIP')

prepare() {
  cd eepp
  git submodule init
  git config submodule.src/thirdparty/efsw.url "$srcdir/efsw"
  git config submodule.src/thirdparty/SOIL2.url "$srcdir/soil2"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd eepp
  premake5 gmake
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
