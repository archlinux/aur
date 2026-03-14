# Maintainer: Dee.H.Y <dongfengweixiao at hotmail dot com>
# This PKGBUILD tracks the latest development version of nebuchadnezzar.
# Before executing makepkg, you can set FVM_CACHE_PATH to $HOME/fvm or the path specified by the cachePath field in the $HOME/.config/fvm/.fvmrc file.

## options
: ${_install_path:=opt}

_pkgname="nebuchadnezzar"
pkgname="$_pkgname-git"
pkgver=r156.5794abd
pkgrel=1
pkgdesc="Matrix Client written in Dart & Flutter for Linux"
url="https://github.com/ubuntu-flutter-community/nebuchadnezzar"
license=('AGPL-3.0-or-later')
arch=('x86_64' 'aarch64')
depends=(
  glibc
  glib2
  mpv
  cairo
  gdk-pixbuf2
  pango
  libepoxy
  fontconfig
  at-spi2-core
  gtk3
  gcc-libs
  alsa-lib
  libnotify
)
makedepends=(
  'clang'
  'cmake'
  'fvm' #AUR
  'git'
  'lld'
  'llvm'
  'ninja'
  'patchelf'
  'rustup'
)
options=('!lto')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
  "$_pkgname"::"git+$url.git"
  "0001-Use-dynamic-OpenSSL.patch"
)
sha256sums=(
  'SKIP'
  'd5dd1fc8e65dc81fc2f1292ea93d8843c45922e2b988679126b55f171d083882'
)

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  patch -p1 -i "$srcdir/0001-Use-dynamic-OpenSSL.patch"
}

build() {
  export FVM_CACHE_PATH="$SRCDEST/fvm-cache"

  cd "$srcdir/$_pkgname"
  fvm install
  fvm use -f

  fvm flutter --disable-analytics
  fvm flutter --no-version-check pub get
  fvm flutter clean && fvm flutter build linux --release
}

package() {
  if [ $CARCH == "aarch64" ]; then
    FLUTTER_ARCH=arm64
  else
    FLUTTER_ARCH=x64
  fi

  cd "$srcdir/$_pkgname/build/linux/$FLUTTER_ARCH/release/bundle"

  install -Dm755 "$_pkgname" "$pkgdir/$_install_path/$_pkgname/$_pkgname"
  cp --reflink=auto -r lib/ "$pkgdir/$_install_path/$_pkgname/"
  cp --reflink=auto -r data/ "$pkgdir/$_install_path/$_pkgname/"

  # runpath
  patchelf --set-rpath '$ORIGIN/lib' "$pkgdir/$_install_path/$_pkgname/$_pkgname"
  for i in "$pkgdir/$_install_path/$_pkgname/lib"/*.so; do
    [ -z "$(patchelf --print-rpath "$i")" ] && continue
    patchelf --set-rpath '$ORIGIN' "$i"
  done

  # symlink
  install -dm755 "${pkgdir}/usr/bin"
  ln -sfr "$pkgdir/$_install_path/$_pkgname/$_pkgname" "$pkgdir/usr/bin/${_pkgname}"

  # icon
  install -Dm644 "$srcdir/$_pkgname/snap/gui/$_pkgname.png" \
    "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  # .desktop file
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=Nebuchadnezzar
Comment=$pkgdesc
Exec=$_pkgname %U
Icon=$_pkgname
Terminal=false
Categories=Network;InstantMessaging;Chat;
StartupWMClass=nebuchadnezzar
END

  # license
  install -Dm644 "$srcdir/$_pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
