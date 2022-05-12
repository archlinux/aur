# https://aur.archlinux.org/packages/tau-editor-git
groups=('modified')

pkgname=tau-editor-git
pkgver=0.12.0.r2.g6215e469
pkgrel=1
pkgdesc="GTK frontend for the Xi text editor, written in Rust"
arch=('x86_64')
url="https://gitlab.gnome.org/World/tau"
license=('MIT')
depends=('libhandy0' 'vte3')
makedepends=('cargo' 'git' 'meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!lto')
source=('git+https://gitlab.gnome.org/World/tau.git'
        'git+https://github.com/Cogitri/xi-editor.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/tau"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/tau"
  git submodule init
  git config submodule.vendor/xi-editor.url "$srcdir/xi-editor"
  git submodule update

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"

  # Workaround 'Function does not take positional arguments' error
  sed -i "s/i18n.merge_file ('desktop-file',/i18n.merge_file (/g" data/meson.build
  sed -i "s/i18n.merge_file ('appdata-file',/i18n.merge_file (/g" data/meson.build

  # Fails to download syntect plugin if --frozen is used
  sed -i 's/--frozen//g' scripts/cargo.sh
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  arch-meson tau build
  meson compile -C build
}

check() {
  meson test 'validate-desktop' 'Validate schema file' -C build --print-errorlogs
#  meson test 'cargo test --all' -C tau --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  cd "$srcdir/tau"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}/"
}
