# Maintainer: Érico Nogueira <ericonr at disroot dot org>
pkgname=parallel-redox-git
pkgver=.r0.9427863
pkgrel=1
pkgdesc="A Parallel implementation for Redox, based on Ion."
arch=('x86_64')
url="https://gitlab.redox-os.org/redox-os/parallel"
license=('GPL3')
provides=("parallel-redox")
makedepends=('cargo' 'git')
conflicts=('parallel-redox')
source=("$pkgname::git+https://gitlab.redox-os.org/redox-os/parallel")
sha1sums=('SKIP')

build() {
  cd "$pkgname"
  cargo build --release
}

pkgver() {
  cd "$pkgname"
  local tag=$(git tag --sort=-v:refname | grep '^[0-9]' | head -1)
  local commits_since=$(git rev-list $tag..HEAD --count)
  echo "$tag.r$commits_since.$(git log --pretty=format:'%h' -n 1)"
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/parallelion" "$pkgdir/usr/bin/parallelion"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
