# Maintainer: Coki91 <coki91 at proton dot me>
_pkgname='rustlock'
pkgname="${_pkgname}-git"
pkgver=r60.7603975
pkgrel=1
pkgdesc="A high-performance Wayland screen locker written in Rust, inspired by swaylock-effects"
arch=('x86_64')
url="https://github.com/JorySeverijnse/$_pkgname"
license=('GPL-3.0-or-later')
depends=('dbus' 'cairo' 'pam' 'gdk-pixbuf2' 'libxkbcommon')
makedepends=('clang' 'llvm' 'rust' 'cargo' 'pkg-config')
provides=('rustlock')
conflicts=('rustlock')
source=("${_pkgname}::git+https://github.com/JorySeverijnse/rustlock.git")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  export RUSTFLAGS="-C linker=gcc"
  export CFLAGS=""
  export LDFLAGS=""
  cargo build --release --no-default-features
}

package() {
  cd "${_pkgname}"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  # Install PAM configuration
  install -Dm644 "pam.d/$_pkgname" "$pkgdir/etc/pam.d/$_pkgname"

  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
