pkgname=ziggy-git
pkgver=0
pkgrel=1
pkgdesc=" A data serialization language for expressing clear API messages, config files, etc. "
arch=("any")
license=('MIT')
url="https://github.com/kristoff-it/ziggy/tree/main"

source=("git+https://github.com/kristoff-it/ziggy.git")
sha256sums=('SKIP')

prepare() {
  if ! command -v zig >/dev/null; then
    echo "please install zig first!"
    exit 1
  fi

  zig_version=$(zig version)
  required_prefix="0.14"

  version=$(echo "$zig_version" | awk -F'[-+]' '{print $1}')

  if ! echo "$version" | grep -q "^$required_prefix\."; then
    echo -e "\033[31merror: Zig version $zig_version does not match $required_prefix.*"
    exit 1
  fi
}

build() {
  cd "$srcdir/ziggy"
  echo "Building..."
  zig build --release=safe
}

package() {
  install -Dm755 $srcdir/ziggy/zig-out/bin/ziggy $pkgdir/usr/bin/ziggy
}
