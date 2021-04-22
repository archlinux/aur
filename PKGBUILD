# Maintainer: Marvin König <dev@mkqavi.com>
pkgname=commit-email-git
pkgver=v0.1.0.r.0.2da9ad6
pkgrel=1
pkgdesc="A tool that reminds you to commit with the correct email address"
arch=('x86_64')
url="https://github.com/mkqavi/commit-email"
license=('MIT')
provides=("commit-email")
makedepends=('cargo' 'git')
source=("$pkgname::git+https://github.com/mkqavi/commit-email")
sha1sums=('SKIP')

build() {
  cd "$pkgname"
  cargo build --release
}

pkgver() {
  cd "$pkgname"
  local tag=$(git tag --sort=-v:refname | grep '^v[0-9]' | head -1)
  local commits_since=$(git rev-list $tag..HEAD --count)
  echo "$tag.r.$commits_since.$(git log --pretty=format:'%h' -n 1)"
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/commit-email" "$pkgdir/usr/bin/commit-email"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
