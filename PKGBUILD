# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

## options
: ${_install_path:=opt}

# basic info
_pkgname=qtscrcpy
pkgname="$_pkgname"
pkgver=2.2.1
pkgrel=2
pkgdesc="Android real-time screencast control tool"
url="https://github.com/barry-ran/QtScrcpy"
license=('Apache-2.0')
arch=('x86_64' 'aarch64')

depends=(
  'android-tools'
  'qt5-multimedia'
  'qt5-x11extras'
)
makedepends=(
  'chrpath'
  'cmake'
  'git'
  'qt5-tools'
)

conflicts=('qtscrcpy-docs')

backup=("etc/$_pkgname/config.ini")

_pkgsrc="$_pkgname"
source=(
  "$_pkgname"::"git+$url.git#tag=v$pkgver"
  "qtscrcpycore"::"git+https://github.com/barry-ran/QtScrcpyCore.git"
  "path-fix.patch"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'a80a69c96361e671db319be612dc08f26142886875a35c9cd5df57c100ddae3a'
)

# common functions
prepare() {
  cd "$_pkgsrc"
  git submodule init
  git config submodule.QtScrcpy/QtScrcpyCore.url "$srcdir/qtscrcpycore"
  git -c protocol.file.allow=always submodule update

  patch --strip=1 QtScrcpy/main.cpp < "$srcdir/path-fix.patch"
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build

  cd "$_pkgsrc"

  # Remove insecure RPATH
  chrpath --delete output/x64/None/QtScrcpy
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

  # fix permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/usr/bin/env sh

export QTSCRCPY_CONFIG_PATH="/etc/qtscrcpy"
exec /$_install_path/qtscrcpy/QtScrcpy "\$@"
END

  install -Dm644 /dev/stdin -t "$pkgdir/usr/share/applications/" << END
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
}
