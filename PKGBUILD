# Maintainer: Jah Way603 <jahway603 at protonmail dot com>

pkgname=iamb-git
_pkg=iamb
pkgver=r271.b10c985
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
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd $_pkg
  VERGEN_GIT_SHA="Arch Linux" cargo build --release
}

check() {
  cd $_pkg
  cargo test
}

package() {
  install -Dm755 "$srcdir/$_pkg/target/release/iamb"  "$pkgdir/usr/bin/iamb"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkg/"  "$srcdir/$_pkg/LICENSE"
  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkg/"  "$srcdir/$_pkg/README.md"
  install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"  "$srcdir/$_pkg/docs/$_pkg.svg"
  install -Dm644 -t "${pkgdir}/usr/share/metainfo/"  "$srcdir/$_pkg/docs/$_pkg.metainfo.xml"
  install -Dm644 -t "${pkgdir}/usr/share/applications/"  "$srcdir/$_pkg/$_pkg.desktop"

  install -Dm644 -t "$pkgdir/usr/share/man/man1/"  "$srcdir/$_pkg/docs/$_pkg.1"
  install -Dm644 -t "$pkgdir/usr/share/man/man5/"  "$srcdir/$_pkg/docs/$_pkg.5"

  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkg/"  "$srcdir/$_pkg/config.example.toml"
}
