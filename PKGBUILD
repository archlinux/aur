# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=xcursor-pro-cursor-theme
pkgver=2.0.2
pkgrel=1
pkgdesc="Modern X11 Cursor Theme"
arch=('any')
url="https://github.com/ful1e5/XCursor-pro"
license=('GPL-3.0-or-later')
makedepends=('python-clickgen>=2.0.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname-$pkgver-bitmaps.zip::$url/releases/download/v$pkgver/bitmaps.zip")
noextract=("$pkgname-$pkgver-bitmaps.zip")
sha256sums=('5baf8557e6cd0504540c258ada32898358e9aaa77d95e0e0f460bad494078445'
            'b6549857dfe5062f42551efccaeded9aee8703a9c41510ba59c20414c38ac84b')

prepare() {
  bsdtar xvf "$pkgname-$pkgver-bitmaps.zip" -C "XCursor-pro-$pkgver"

  cd "XCursor-pro-$pkgver"
  rm -rf themes bin
}

build() {
  cd "XCursor-pro-$pkgver"

  _version="v$pkgver"

  _get_config_file() {
    local key="${1}"
    local cfg_file="build.toml"

    if [[ $key == *"Right"* ]]; then
      cfg_file="build.right.toml"
    fi

    echo ${cfg_file}
  }

  _with_version() {
    local comment="${1}"
    echo "${comment} (${_version})"
  }

  declare -A names
  names["XCursor-Pro-Dark"]=$(_with_version "Modern, Professional Dark")
  names["XCursor-Pro-Light"]=$(_with_version "Modern, Professional Light")
  names["XCursor-Pro-Red"]=$(_with_version "Modern, Professional Red")

  for key in "${!names[@]}"; do
    comment="${names[$key]}"
    cfg=$(_get_config_file key)

    ctgen "configs/x.${cfg}" -p x11 -d "bitmaps/${key}" -n "${key}" -c "${comment} XCursors" &
    PID=$!
    wait $PID
  done
}

package() {
  cd "XCursor-pro-$pkgver"
  install -d "$pkgdir/usr/share/icons"
  cp -r themes/XCursor-Pro* "$pkgdir/usr/share/icons/"
}
