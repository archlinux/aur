# Maintainer: Techcable <aur at email dot techcable dot net>
# Contributor: Kien Dang <mail at kien dot ai>
# Contributor: Chuah Chee Shian <shian15810@gmail.com>

pkgname=scala-cli
pkgver=1.18.0
pkgrel=1
pkgdesc='A command-line tool to interact with the Scala language'
arch=('x86_64' 'aarch64')
url='https://scala-cli.virtuslab.org'
license=('Apache-2.0')
source_x86_64=("$pkgname-x86_64-$pkgver.gz::https://github.com/VirtusLab/scala-cli/releases/download/v$pkgver/scala-cli-x86_64-pc-linux.gz")
source_aarch64=("$pkgname-aarch64-$pkgver.gz::https://github.com/VirtusLab/scala-cli/releases/download/v$pkgver/scala-cli-aarch64-pc-linux.gz")
sha256sums_x86_64=('eb41442f870bcae75aa5d6622ac96a173dae14fed59f71c97125eb21536bb060')
sha256sums_aarch64=('a9e5d10b4bb623839d1697518102d5b6a81d8f9ed8031b10b97f87f35a63ae68')
# Avoid stripping debug info, which requries a seperate
# debug package and only saves ~200KiB.
#
# Since scala-cli uses GraalVM to AOT compile, I'm not sure
# seperating debug info would work as expected anyways.
options=(!strip !debug)

package() {
  SCALA_CLI="$pkgdir/usr/bin/scala-cli"

  install -Dm755 "$srcdir/$pkgname-$CARCH-$pkgver" "$SCALA_CLI"

  install -Dm644 <("$SCALA_CLI" install completions --format bash --env) "$pkgdir/usr/share/bash-completion/completions/scala-cli"

  "$SCALA_CLI" install completions --format zsh --env --output "$srcdir" > /dev/null
  install -Dm644 "$srcdir/zsh/_scala-cli" "$pkgdir/usr/share/zsh/site-functions/_scala-cli"
}
