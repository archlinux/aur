# Maintainer: Chris Nixon <chris.nixon@sigma.me.uk>
_pkgname=rewrite
pkgname=$_pkgname-git
pkgver=0.1.r6.40477cd
pkgrel=1
pkgdesc="Utility that allows for the in-place rewrite of a file's contents"
arch=('x86' 'x86_64')
url="https://github.com/neosmart/rewrite"
makedepends=('git' 'cargo')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+${url}.git")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  local tag=$(git tag --sort=-v:refname | grep '^[0-9]' | head -1)
  local commits_since=$(git rev-list $tag..HEAD --count)
  echo "$tag.r$commits_since.$(git log --pretty=format:'%h' -n 1)"
}

build() {
  cd "$srcdir/$_pkgname"
  cargo build --release
}

check() {
  cd "$srcdir/$_pkgname"
  cargo test --release
}

package() {
  cd "$srcdir/$_pkgname"
  install -D "target/release/rewrite" "$pkgdir/usr/bin/rewrite"
}
