# Maintainer: Travis Chen <travis.chen@everchanging.dev>
pkgname=symfs-git
pkgver=master
pkgrel=2
epoch=
pkgdesc="A filesystem- and application- agnostic program that generates a collection of views to a collection of directories with associated metadata in the form of symlinks, grouping them based on a set of criteria against the metadata in those directories."
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

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  bazel build -c opt :${pkgname%-git}_zip
}

check() {
  cd "${srcdir}/${pkgname}"
  bazel test -c opt :all
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE.md"
  install -Dm644 "install/systemd/${pkgname%-git}@.service" "${pkgdir}/usr/lib/systemd/user/${pkgname%-git}@.service"
  install -Dm644 "install/systemd/${pkgname%-git}@.timer" "${pkgdir}/usr/lib/systemd/user/${pkgname%-git}@.timer"
  install -Dm755 "bazel-bin/${pkgname%-git}.zip" "${pkgdir}/usr/bin/${pkgname%-git}.zip"
}
