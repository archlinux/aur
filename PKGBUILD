# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : Gabriel Guldner <gabriel at guldner dot eu>


pkgname=git-interactive-rebase-tool-git
_pkgname="${pkgname%-git}"
_name="${_pkgname#git-}"

pkgver() {
  cd "$_pkgname"
  printf %s.r%s.%s \
    "$(git tag -l | grep -P '.+\..+\.\d+' | sed -r 's/([0-9\.]+)(-.+)?/\1/g' | sort -Vr | sed 1q)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgver=2.1.0.r583.a179df6
pkgrel=1

pkgdesc='An improved sequence editor for interactive git-rebase'
arch=('x86_64')
url=https://gitrebasetool.mitmaro.ca
license=('GPL3')

provides=("$_pkgname")
conflicts=("$_pkgname")

makedepends=('git' 'rust')
depends=('libgit2')

options=('zipman')

install="$_pkgname.install"
changelog=CHANGELOG.md
source=("git+https://github.com/MitMaro/$_pkgname.git")
sha256sums=('SKIP')


prepare() {
  cd "$_pkgname"
  sed -i 's|/docs/assets/||' README.md
}

build() {
  cd "$_pkgname"
  if type -P rustup && ! rustup default &>/dev/null; then
    rustup default stable
  fi
  cargo build --release --locked
}

check() {
  cd "$_pkgname"
  cargo test --release --locked
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/$_name" -t"$pkgdir/usr/bin/"
  install -Dm644 {,readme/}*.md          -t"$pkgdir/usr/share/doc/$_pkgname/"
  install -Dm644 docs/assets/images/*    -t"$pkgdir/usr/share/doc/$_pkgname/images/"
  install -Dm644 LICENSE                 -t"$pkgdir/usr/share/licenses/$_pkgname/"
  install -Dm644 "src/$_name.1"          -t"$pkgdir/usr/share/man/man1/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
