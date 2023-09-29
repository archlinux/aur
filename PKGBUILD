# Maintainer: Kyle Laker <kyle+aur@laker.email>

pkgname=oscal-cli
pkgver=1.0.2
pkgrel=1
pkgdesc="A simple open source command line tool to support common operations over OSCAL content."
arch=('any')
url="https://github.com/usnistgov/oscal-cli"
license=('custom')
depends=('java-environment>=11')
makedepends=('maven' 'java-environment>=11' 'git')
# The source has to be the git repository because it uses `git-commit-id-maven-plugin` which
# must be able to describe a git repository.
source=("$pkgname::git+$url#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/$pkgname"
  mvn clean package -DskipTests=true -Denforcer.skip
}

check() {
  cd "$srcdir/$pkgname"
  mvn test -Denforcer.skip
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d "$pkgdir/opt"
  cp -r "target/cli-core-$pkgver-oscal-cli/" "$pkgdir/opt/oscal-cli"

  install -d "$pkgdir/usr/bin"
  ln -s /opt/oscal-cli/bin/oscal-cli "$pkgdir/usr/bin/oscal-cli"
}
