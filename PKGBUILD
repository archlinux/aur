# Maintainer: Mikaela Szekely <qyriad@gmail.com>
pkgname=cargo-update-git
pkgver=v1.7.0.r5.8d758b004
pkgrel=1
pkgdesc="A cargo subcommand for checking and applying updates to installed executables"
arch=('i686' 'x86_64')
url="https://github.com/nabijaczleweli/cargo-update"
license=('MIT')
groups=()
depends=()
makedepends=('cargo' 'libgit2' 'libssh2' 'openssl')
optdepends=()
provides=('cargo-update')
conflicts=('cargo-update')
options=()
source=("$pkgname::git+https://github.com/nabijaczleweli/cargo-update")
md5sums=('SKIP')

pkgver()
{
  cd "$srcdir/$pkgname"
  local tag=$(git tag --sort=-v:refname | grep '^v[0-9]' | head -1)
  local commits_since=$(git rev-list $tag..HEAD --count)
  echo "$tag.r$commits_since.$(git log --pretty=format:'%h' -n 1)"
}

build()
{
  cd "$srcdir/$pkgname"
  RUSTFLAGS="-C target-cpu=native" cargo build --release
}

package()
{
  cd "$srcdir/$pkgname"
  install -Dm755 "target/release/cargo-install-update" "$pkgdir/usr/bin/cargo-install-update"
  install -Dm755 "target/release/cargo-install-update-config" "$pkgdir/usr/bin/cargo-install-update-config"

  install -Dm644 "man/cargo-install-update.md" "$pkgdir/usr/share/doc/${pkgname}/cargo-install-update.md"
  install -Dm644 "man/cargo-install-update-config.md" "$pkgdir/usr/share/doc/${pkgname}/cargo-install-update-config.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
