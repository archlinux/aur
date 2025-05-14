# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
# Contributor: Gunar C. Gessner <gunar@gunar.uk>
_pkgname="difftastic"
pkgname="${_pkgname}-git"
pkgver=0.63.0.r35.bbe681013
pkgrel=1
pkgdesc="a diff that understands syntax"
arch=("i686" "x86_64")
url="https://github.com/Wilfred/difftastic"
license=('MIT')
groups=()
depends=('glibc' 'gcc-libs' 'shared-mime-info')
makedepends=('git' 'cargo')
optdepends=()
provides=('difft')
conflicts=('difft')
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+https://github.com/Wilfred/${_pkgname}.git"
        remove-makedepends-jq.patch)
noextract=()
md5sums=('SKIP'
         '2f9a02d83bb816de9d261fba8909aaaa')

pkgver() {
  cd "$srcdir/$pkgname"
  local tag=$(git tag --sort=-v:refname | grep '^[0-9]' | head -1)
  local commits_since=$(git rev-list $tag..HEAD --count)
  echo "$tag.r$commits_since.$(git log --pretty=format:'%h' -n 1)"
}

prepare() {
  cd "$pkgname"

  # download dependencies
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  # remove makedepends on jq
  patch -p1 -i "$srcdir/remove-makedepends-jq.patch"
}

build() {
  cd "$pkgname"
  export CFLAGS+=" -ffat-lto-objects -std=gnu17"

  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname"

  # Skip tests that expect to detect interactive terminal
  # Run ignored tests that *are* expected to work if MIME database present
  # c.f. https://github.com/Wilfred/difftastic/commit/34f21c6d
  cargo test --frozen --all-features -- \
    --ignored \
    --skip 'options::tests::test_detect_display_width'
}

package() {
  cd "$pkgname"
  install -D -m 755 "target/release/difft" "${pkgdir}/usr/bin/difft"
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
