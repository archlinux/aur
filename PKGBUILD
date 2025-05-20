# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='cfn-guard-git'
pkgver=3.1.12.r27.ge12d831
pkgrel=1
pkgdesc='Guard offers a policy-as-code domain-specific language (DSL) to write rules and validate JSON- and YAML-formatted data such as CloudFormation Templates, K8s configurations, and Terraform JSON plans/configurations against those rules.'
url='https://github.com/aws-cloudformation/cloudformation-guard'
depends=('gcc-libs')
makedepends=('rust')
license=('Apache')
arch=('x86_64')
conflicts=("cfn-guard")
source=('git+https://github.com/aws-cloudformation/cloudformation-guard')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/cloudformation-guard
  git describe --long --tags|sed 's/\([^-]*-g\)/r\1/;s/[-_]/./g;s/^release.//'
}

build() {
  cd "$srcdir"/cloudformation-guard
  cargo build --release
  target/release/cfn-guard completions --shell='zsh' > cfn-guard.zsh
  target/release/cfn-guard completions --shell='bash' > cfn-guard.bash
  target/release/cfn-guard completions --shell='fish' > cfn-guard.fish
}

package() {
  cd "$srcdir"/cloudformation-guard
  install -Dm755 target/release/cfn-guard "$pkgdir/usr/bin/cfn-guard"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname%-*}/README.md"
  install -Dm644 cfn-guard.zsh "$pkgdir/usr/share/zsh/site-functions/_cfn-guard"
  install -Dm644 cfn-guard.bash "$pkgdir/usr/share/bash-completion/completions/cfn-guard"
  install -Dm644 cfn-guard.fish "$pkgdir/usr/share/fish/completions/cfn-guard.fish"
}

check() {
  "$srcdir"/cloudformation-guard/target/release/cfn-guard --version
}
