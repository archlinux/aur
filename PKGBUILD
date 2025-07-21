# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

## options
: ${_install_path:=opt}

_pkgname="qtscrcpy"
pkgname="$_pkgname"
pkgver=3.3.1
pkgrel=1
pkgdesc="Android real-time screencast control tool"
url="https://github.com/barry-ran/QtScrcpy"
license=('Apache-2.0')
arch=('x86_64' 'aarch64')

depends=(
  'android-tools'
  'qt6-multimedia'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
  'qt6-tools'
)

backup=("etc/$_pkgname/config.ini")

_pkgsrc="$_pkgname"
_pkgsrc_core="qtscrcpycore"
source=(
  "$_pkgname"::"git+$url.git#tag=v$pkgver"
  "$_pkgsrc_core"::"git+https://github.com/barry-ran/QtScrcpyCore.git"
  "path-fix.patch"
)
sha256sums=(
  'SKIP'
  'SKIP'
  '16c9470136d4ab84af22b9689e5767b38e7be4eaa41b069546480a44a2776c36'
)

prepare() {
  cd "$_pkgsrc"
  git submodule init
  git config submodule.QtScrcpy/QtScrcpyCore.url "$srcdir/qtscrcpycore"
  git -c protocol.file.allow=always submodule update

  patch -Np1 -F100 -i "$srcdir/path-fix.patch"
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_SKIP_RPATH=ON
    -DQT_VERSION_MAJOR=6
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  cd "$_pkgsrc"
  install -Dm755 output/x64/None/QtScrcpy -t "$pkgdir/$_install_path/$_pkgname/"
  install -Dm644 output/x64/None/scrcpy-server -t "$pkgdir/$_install_path/$_pkgname/"
  install -Dm644 output/x64/None/sndcpy.apk "$pkgdir/$_install_path/$_pkgname/"
  install -Dm755 output/x64/None/sndcpy.sh "$pkgdir/$_install_path/$_pkgname/"

  install -Dm644 backup/logo.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm644 config/config.ini -t "$pkgdir/etc/$_pkgname/"

  cp -r keymap "$pkgdir/$_install_path/$_pkgname/"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/$_install_path/$_pkgname/sndcpy.sh" "$pkgdir/usr/bin/"

  install -dm755 "$pkgdir/usr/share/doc/$_pkgname"
  cp -r docs/* "$pkgdir/usr/share/doc/$_pkgname/"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/usr/bin/env sh
exec /$_install_path/$_pkgname/QtScrcpy "\$@"
END

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=QtScrcpy
Comment=Android real-time screencast control tool
Exec=$_pkgname %u
Icon=$_pkgname
Terminal=false
StartupNotify=true
Categories=Development;Utility;
MimeType=application/epub+zip;
END

  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
