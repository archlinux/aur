# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=dusk
pkgver=1.0.1
pkgrel=1
pkgdesc="A reverse-engineered reimplementation of Twilight Princess."
arch=('x86_64')
url="https://twilitrealm.dev"
license=('CC0-1.0')
depends=(
  'freetype2'
  'libjpeg-turbo'
#  'nodtool'  ## AUR
  'sdl3'
)
makedepends=(
  'cmake'
  'git'
  'imagemagick'
  'rocprofiler'
)
install="$pkgname.install"
source=("git+https://github.com/TwilitRealm/dusk.git#tag=v$pkgver"
        'git+https://github.com/encounter/aurora.git'
        "$pkgname.desktop")
sha256sums=('0d76d2fe29a0273aea84f3d71807c09b08911523ebeca8a7db8c8c8fdaae7022'
            'SKIP'
            '085c5e05684fbfb877aeddb73ef2cbc326b6de64bd6cc49d72e454d55a023df7')

prepare() {
  cd "$pkgname"
  git submodule init
  git config submodule.extern/aurora.url "$srcdir/aurora"
  git -c protocol.file.allow=always submodule update
}

build() {
  local cmake_options=(
    -B build
    -S "$pkgname"
    -W no-dev
    -D CMAKE_BUILD_TYPE='RelWithDebInfo'
    -D CMAKE_INSTALL_PREFIX="/opt/$pkgname"
    -D CMAKE_MSVC_RUNTIME_LIBRARY='MultiThreaded'
    -D DUSK_ENABLE_UPDATE_CHECKER='OFF'
    -D AURORA_SDL3_PROVIDER='system'
    -D AURORA_SDL3_LINKAGE='shared'
  #  -D AURORA_NOD_PROVIDER='system'  ## TODO
  #  -D AURORA_NOD_LINKAGE='shared'  ## TODO
  )
  cmake "${cmake_options[@]}"
  cmake --build build

  # Generate icons
  cd "$pkgname"
  mkdir -p icons
  for i in 16 32 48 64 128 256 512; do
    magick res/icon.png -resize "${i}x${i}" "icons/${pkgname}_${i}x${i}.png"
  done
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/"

  for i in 16 32 48 64 128 256 512; do
    install -Dm644 "$pkgname/icons/${pkgname}_${i}x${i}.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname-twilitrealm.png"
  done
  install -d "$pkgdir/usr/share/icons/hicolor/1024x1024/apps"
  ln -s "/opt/$pkgname/res/icon.png" \
    "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/$pkgname-twilitrealm.png"

  install -Dm644 "$pkgname/README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
}
