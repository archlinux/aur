# Maintainer: Jah Way603 <jahway603 at protonmail dot com>

pkgname=iamb-git
_pkg=iamb
pkgver=r188.3355eb2
pkgrel=1
pkgdesc='A Matrix client for Vim addicts'
url='https://github.com/ulyssa/iamb'
arch=('x86_64')
license=('Apache-2.0')
makedepends=('git' 'rust' 'cargo')
conflicts=("${pkgname%-git}" "iamb-bin")
provides=("${pkgname%-git}")
source=("git+$url.git")
sha512sums=('SKIP')
options=('!lto')

# https://wiki.archlinux.org/title/VCS_package_guidelines
pkgver() {
  cd "$srcdir/${pkgname%-git}"
#  git describe --long --tags --abbrev=7 | sed 's/-/.r/;s/-/./'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd $_pkg
  cargo build --release
}

package() {
  install -Dm644 "$srcdir/$_pkg/LICENSE" "$pkgdir/usr/share/licenses/$_pkg/LICENSE"
  install -Dm755 "$srcdir/$_pkg/target/release/iamb" "$pkgdir/usr/bin/iamb"
  install -Dm755 "$srcdir/$_pkg/README.md" "$pkgdir/usr/share/doc/$_pkg/README.md"
  # Manpages
  install -Dm644 "$srcdir/$_pkg/docs/${_pkg}.1" "$pkgdir/usr/share/man/man1/${_pkg}.1"
  install -Dm644 "$srcdir/$_pkg/docs/${_pkg}.5" "$pkgdir/usr/share/man/man5/${_pkg}.5"
  # Config example
  install -Dm644 "$srcdir/$_pkg/config.example.toml" "$pkgdir/usr/share/doc/$_pkg/config.example.toml"
}
