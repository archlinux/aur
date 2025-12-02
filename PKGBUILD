# Maintainer: Senya <senya at riseup.net>
pkgname=crowdin-cli
pkgver=4.12.0
pkgrel=1
pkgdesc="Command line tool that allows you to manage and synchronize localization resources with your Crowdin project"
url="https://support.crowdin.com/cli-tool/"
license=('MIT')
depends=('java-runtime>=17')
_jdkver=17
makedepends=('git' "java-environment=$_jdkver" 'grep' 'awk')
arch=('any')
md5sums=('SKIP' 'b018bcf51df64a8e68450cd7ac0e3838')

source=(
  "git+https://github.com/crowdin/crowdin-cli.git#tag=$pkgver"
  'crowdin'
)

build() {
  cd "$srcdir/$pkgname"
  # archlinux-java status doesn’t show whether it is a jdk or jre
  # the user could have installed a jdk17 and a jre17 at the same time
  # (eg. jdk17-openjdk and jre17 from AUR)
  PATH=$(find /usr/lib/jvm/ -wholename "*$_jdkver*/javac" -print -quit | sed 's/javac//'):$PATH
  ./gradlew shadowJar
  java -cp "build/libs/crowdin-cli-$pkgver.jar" picocli.AutoComplete --force com.crowdin.cli.commands.picocli.RootCommand
}

package() {
  install -Dm 0755 crowdin "$pkgdir"/usr/bin/crowdin
  cd "$srcdir/$pkgname"
  install -Dm 0644 build/libs/crowdin-cli-$pkgver.jar "$pkgdir"/usr/share/java/$pkgname/crowdin-cli.jar
  install -Dm 0644 crowdin_completion "$pkgdir"/usr/share/bash-completion/completions/crowdin
  install -Dm 0644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
