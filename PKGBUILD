# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

## options
: ${_install_path:=opt}

_pkgname="qtscrcpy"
pkgname="$_pkgname"
pkgver=3.3.3
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
)
sha256sums=(
  'c453e712d1ddd252e859306f62646e7f2b9b0fb78907b41eb886b82a647f16c5'
  'SKIP'
)

prepare() {
  cd "$_pkgsrc"
  git submodule init
  git config submodule.QtScrcpy/QtScrcpyCore.url "$srcdir/qtscrcpycore"
  git -c protocol.file.allow=always submodule update

  # fix for Qt 6.10
  sed -E -e 's&(COMPONENTS)&\1 GuiPrivate&' -i QtScrcpy/CMakeLists.txt

  # fix paths
  sed -E -e '/qputenv\("QTSCRCPY_ADB_PATH"/c qputenv("QTSCRCPY_ADB_PATH", "/usr/bin/adb");' \
    -e '/qputenv\("QTSCRCPY_SERVER_PATH"/c qputenv("QTSCRCPY_SERVER_PATH", "/opt/qtscrcpy/scrcpy-server");' \
    -e '/qputenv\("QTSCRCPY_KEYMAP_PATH"/c qputenv("QTSCRCPY_KEYMAP_PATH", "/opt/qtscrcpy/keymap");' \
    -e '/qputenv\("QTSCRCPY_CONFIG_PATH"/c qputenv("QTSCRCPY_CONFIG_PATH", "/etc/qtscrcpy");' \
    -i QtScrcpy/main.cpp
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_SKIP_RPATH=ON
    -DQT_DESIRED_VERSION=6
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
