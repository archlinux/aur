# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=decompose-git
pkgver=r95.c3950ba
pkgrel=1
pkgdesc="Development Environment Compose - templating framework to help \
  developers easily create and switch environments"
arch=('i686' 'x86_64')
url="https://github.com/dmp1ce/decompose"
license=('custom')
depends=('bash' 'bash-completion')
makedepends=('txt2man' 'git')
source=("${pkgname}::git+https://github.com/dmp1ce/decompose.git"
        "${pkgname}-mo::git+https://github.com/tests-always-included/mo.git")
sha256sums=("SKIP" "SKIP")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # Put 'mo' submodule into the correct location
  cd "$pkgname"
  git submodule init
  git config submodule.libs/mo.url "$srcdir/${pkgname}-mo"
  git -c protocol.file.allow=always submodule update
}

build() {
  # Build man page
  cd "$pkgname/man"
  ./build_man_page
}

package() {
  # Install License
  install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Put code files into '/usr/share/decompose'
  install -Dm755 "$pkgname/decompose" "$pkgdir/usr/share/decompose/decompose"
  install -Dm644 "$pkgname/decompose-functions" \
    "$pkgdir/usr/share/decompose/decompose-functions"
  install -Dm644 "$pkgname/completion/decompose-bash-completion" \
    "$pkgdir/usr/share/decompose/completion/decompose-bash-completion"
  install -Dm644 "$pkgname/completion/decompose-bash-completion-functions" \
    "$pkgdir/usr/share/decompose/completion/decompose-bash-completion-functions"
  install -Dm755 "$pkgname/mo/mo" "$pkgdir/usr/share/decompose/mo/mo"

  # Install binary
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/decompose/decompose" "${pkgdir}/usr/bin"

  # Install tab completion
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  ln -s "/usr/share/decompose/completion/decompose-bash-completion" \
    "${pkgdir}/usr/share/bash-completion/completions/decompose"

  # Install man page
  install -Dm644 "$pkgname/man/decompose.1.gz" \
    "$pkgdir/usr/share/man/man1/decompose.1.gz"
}
