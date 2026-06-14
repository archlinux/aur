# Maintainer: ZXY <3303057136@qq.com>

_pkgname="roland"
pkgname="$_pkgname-git"
_pkgver=0.1.0
pkgver=0.1.0.r14.g78351b9
pkgrel=2
pkgdesc="A simple touch gesture recognizer for Linux, built on top of the input crate."
url="https://github.com/oknozor/roland"
arch=("x86_64" "aarch64")

depends=(
  "libinput"
  "niri"
)
makedepends=("cargo")
conflicts=("$_pkgname")

source=(
	"git+$url.git"
	"${_pkgname}.service"
)
sha256sums=('SKIP'
            '1ef0f968ca5ff706ffc0c834b33b3d826f52e37d828d57b4254686e1c930d744')

options+=(!lto)

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "${_pkgver}.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build () {
  cd "$srcdir/$_pkgname"
  cargo build --frozen --release --target-dir target
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/${_pkgname}.service" -t "$pkgdir/usr/lib/systemd/user"
}

post_install() {
  echo ":: To allow access to input devices, please add your user to the 'input' group:"
  echo "   sudo usermod -a -G input <username>"
  echo ":: You may need to log out and back in for the group changes to take effect."
}
