# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : Gabriel Guldner <gabriel at guldner dot eu>


pkgname=git-interactive-rebase-tool-git
pkgver() {
  cd "${pkgname%-git}"
  printf '%s.r%s.%s' \
    "$(git tag -l | grep -P '.+\..+\.\d+' | sed -r 's/([0-9\.]+)(-.+)?/\1/g' | sort -Vr | sed 1q)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgver=1.1.0.r244.0074a99
pkgrel=1

pkgdesc='An improved sequence editor for interactive git-rebase'
arch=('x86_64')
url=https://gitrebasetool.mitmaro.ca/
license=('GPL3')

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

depends=('git')
makedepends=('rust')

options=('zipman')

install="${pkgname%-git}.install"
changelog=CHANGELOG.md
source=("git+https://github.com/MitMaro/${pkgname%-git}.git")
sha256sums=('SKIP')

build() {
  cd "${pkgname%-git}"
  if type -P rustup; then
    if ! rustup default &>/dev/null; then
      rustup default stable
    fi
  fi
  cargo build --release
}

package() {
  cd "${pkgname%-git}"
  install -dm755 "$pkgdir"/usr/{bin,share/{doc,man/man1,licenses/"${pkgname%-git}"}}
  install -m755 target/release/interactive-rebase-tool -t"$pkgdir/usr/bin/"
  install -m644 {README,CHANGELOG,CODE_OF_CONDUCT}.md  -t"$pkgdir/usr/share/doc/"
  install -m644 src/interactive-rebase-tool.1          -t"$pkgdir/usr/share/man/man1/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
