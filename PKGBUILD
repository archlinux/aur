# Maintainer: Guillaume Gauvrit <guillaume@gauvr.it>
pkgname=rustaman-git
pkgver=0.2.5.r0.9eca6a0
# DO NOT FORGET TO RUN / makepkg --printsrcinfo > .SRCINFO
pkgrel=1
pkgdesc="Template based HTTP client"
arch=('i686' 'x86_64')
url="https://github.com/mardiros/rustaman"
license=('BSD')
makedepends=('cargo' 'git')
depends=('gtk4' 'gtksourceview5' 'openssl')
options=('!emptydirs' '!strip')
source=("$pkgname::git+https://github.com/mardiros/rustaman.git")
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
  install -Dm755 "target/release/rustaman" "$pkgdir/usr/bin/rustaman"

  install -Dm644 "assets/rustaman-dark.xml" "$pkgdir/usr/share/rustaman/rustaman-dark.xml"
  install -Dm644 "assets/rustaman-request.lang" "$pkgdir/usr/share/rustaman/rustaman-request.lang"
  install -Dm644 "assets/rustaman-response.lang" "$pkgdir/usr/share/rustaman/rustaman-response.lang"
}
