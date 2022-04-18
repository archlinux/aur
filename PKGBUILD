# Maintainer: Travis Chen <travis.chen@everchanging.dev>
pkgname=loop-archive-git
pkgver=master
pkgrel=1
epoch=
pkgdesc="A program that archives items from a source location to a destination location while maintaining a fixed size on the destination by deleting oldest items first."
arch=("x86_64")
url="https://github.com/directed-graph/${pkgname%-git}"
license=("MIT")
groups=()
depends=()
makedepends=("bazel" "git" "protobuf" "python-protobuf")
checkdepends=("bazel" "protobuf" "python-protobuf")
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+https://github.com/directed-graph/${pkgname%-git}.git")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

_binary_name() {
  local binary_name
  binary_name="${pkgname%-git}.par"
  binary_name="${binary_name//-/_}"
  echo "${binary_name}"
}

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  bazel build -c opt :$(_binary_name)
}

check() {
  cd "${srcdir}/${pkgname}"
  bazel test -c opt :all
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE.md"
  install -Dm644 "systemd/${pkgname%-git}@.service" "${pkgdir}/usr/lib/systemd/user/${pkgname%-git}@.service"
  install -Dm644 "systemd/${pkgname%-git}@.timer" "${pkgdir}/usr/lib/systemd/user/${pkgname%-git}@.timer"
  install -Dm755 "bazel-bin/$(_binary_name)" "${pkgdir}/usr/bin/$(_binary_name)"
}
