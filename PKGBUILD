# Maintainer: w568w <w568w at outlook dot com>

pkgname=qqtui
pkgver=0.1.4
pkgrel=1
pkgdesc='Terminal frontend using the native Linux QQ service'
arch=('x86_64')
url='https://github.com/w568w/qqtui'
license=('MPL-2.0')
depends=('glibc' 'gcc-libs' 'sqlite>=3.51.2' 'systemd' 'dbus' 'xorg-server-xvfb'
         'xorg-xauth' 'xorg-xkbcomp' 'tigervnc' 'novnc'
         'linuxqq=5:3.2.34_53644')
options=('!lto')
makedepends=('cargo')
checkdepends=('nodejs' 'python')
optdepends=('kitty: inline images and animations'
            'noto-fonts-cjk: Chinese text in the terminal and QQ login page'
            'firefox: browser for first login (other graphical browsers also work)'
            'wl-clipboard: Wayland clipboard'
            'xclip: X11 clipboard'
            'xdg-utils: open files and links in external applications')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('27f981dc7d1f5a416efc4ccbc8375600e1c04802004ad04385b27757d788911f')

prepare() {
  cd "qqtui-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "qqtui-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release --frozen
}

check() {
  cd "qqtui-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --release --frozen
  node --test tests/native.test.cjs tests/journal.test.cjs tests/desktop.test.cjs
  python tests/loader.test.py
}

package() {
  cd "qqtui-$pkgver"
  install -Dm755 target/release/qqtui "$pkgdir/usr/bin/qqtui"
  install -Dm644 packaging/systemd/qqtui-host.service \
    "$pkgdir/usr/lib/systemd/user/qqtui-host.service"
  install -Dm644 packaging/systemd/qqtui-host@.service \
    "$pkgdir/usr/lib/systemd/user/qqtui-host@.service"
  local doc
  for doc in README.md CONTRIBUTING.md docs/*.md bridge/compatibility.json; do
    install -Dm644 "$doc" "$pkgdir/usr/share/doc/qqtui/$doc"
  done
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/qqtui/LICENSE"
  ln -s ../../licenses/qqtui/LICENSE "$pkgdir/usr/share/doc/qqtui/LICENSE"
}
