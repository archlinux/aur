# Maintainer: Senya <senya at riseup.net>
pkgname=crowdin-cli
pkgver=3.13.0
pkgrel=1
pkgdesc="Command line tool that allows you to manage and synchronize localization resources with your Crowdin project"
url="https://support.crowdin.com/cli-tool/"
license=('MIT')
depends=('java-runtime>=8')
makedepends=('git' 'java-environment>=8' 'grep' 'awk')
conflicts=('crowdin-cli-bin')
arch=('any')
md5sums=('SKIP' 'b018bcf51df64a8e68450cd7ac0e3838')

source=(
  "git+https://github.com/crowdin/crowdin-cli.git#tag=$pkgver"
  'crowdin'
)

build() {
  cd "$srcdir/$pkgname"
  ./gradlew shadowJar
  ./gradlew properties --no-daemon --console=plain -q | grep "^version:" | awk '{printf $2}' > _pkgBuildVersion
  java -cp "build/libs/crowdin-cli-$(cat _pkgBuildVersion).jar" picocli.AutoComplete --force com.crowdin.cli.commands.picocli.RootCommand
}

package()
{
  cd "$srcdir"
  install -Dm 0644 "$srcdir/$pkgname"/build/libs/crowdin-cli-$(cat "$srcdir/$pkgname"/_pkgBuildVersion).jar "$pkgdir"/usr/share/java/$pkgname/crowdin-cli.jar
  install -Dm 0755 "$startdir"/crowdin "$pkgdir"/usr/bin/crowdin
  install -Dm 0644 "$srcdir/$pkgname"/crowdin_completion "$pkgdir"/usr/share/bash-completion/completions/crowdin
}
