# Maintainer: Techcable <aur at email dot techcable dot net>
# Contributor: Kien Dang <mail at kien dot ai>
# Contributor: Chuah Chee Shian <shian15810@gmail.com>

pkgname=scala-cli
pkgver=1.17.1
pkgrel=1
pkgdesc='A command-line tool to interact with the Scala language'
arch=('x86_64' 'aarch64')
url='https://scala-cli.virtuslab.org'
license=('Apache-2.0')
source_x86_64=("$pkgname-x86_64-$pkgver.gz::https://github.com/VirtusLab/scala-cli/releases/download/v$pkgver/scala-cli-x86_64-pc-linux.gz")
source_aarch64=("$pkgname-aarch64-$pkgver.gz::https://github.com/VirtusLab/scala-cli/releases/download/v$pkgver/scala-cli-aarch64-pc-linux.gz")
sha256sums_x86_64=('4186bfac6552097fbfd3939bdf2ecdec1cb55baafcbf6259bef5c04e08858eb3')
sha256sums_aarch64=('a12ed53f4723f3e9312a2383e47664b4beaccf2be366cff40adf6b054426156f')
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
