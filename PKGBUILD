# Mantainer: Hownioni <honeyhownihoni at gmail dot com>
# Contributor: Yigit Sever <yigit at yigitsever dot com>

pkgname=ouch-git
_pkgname=${pkgname%-git}
pkgver=r1357.ecc05cd
pkgrel=1
pkgdesc="Painless compression and decompression in the terminal (git version)"
arch=('x86_64')
url="https://github.com/ouch-org/ouch/"
license=('MIT')
makedepends=('git' 'cargo')
depends=('xz' 'bzip2' 'zlib')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname"-bin)
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')
options=("!lto")

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir/${_pkgname}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/${_pkgname}"
  OUCH_ARTIFACTS_FOLDER=artifacts cargo build --frozen --release --all-features
}

check() {
  cd "$srcdir/${_pkgname}"
  cargo test --frozen --all-features
}

package() {
  cd "$srcdir/${_pkgname}"

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${_pkgname}"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/${_pkgname}/README.md"

  cd "$srcdir/${_pkgname}/artifacts"

  # install manpages
  install -Dm0644 "${_pkgname}.1" -t "${pkgdir}/usr/share/man/man1"
  install -Dm0644 "${_pkgname}-compress.1" -t "${pkgdir}/usr/share/man/man1"
  install -Dm0644 "${_pkgname}-decompress.1" -t "${pkgdir}/usr/share/man/man1"
  install -Dm0644 "${_pkgname}-list.1" -t "${pkgdir}/usr/share/man/man1"

  # install shell completions
  install -Dm0644 "${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm0644 "${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -Dm0644 "_${_pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
