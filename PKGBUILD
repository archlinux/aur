# Maintainer: Senya <senya at riseup.net>
pkgname=crowdin-cli
pkgver=3.1.13.r3.g0911157
pkgrel=2
pkgdesc="Command line tool that allows you to manage and synchronize localization resources with your Crowdin project"
url="https://support.crowdin.com/cli-tool/"
license=('MIT')
depends=('java-runtime>=8')
makedepends=('git' 'java-environment>=8' 'gradle' 'grep' 'awk')
conflicts=('crowdin-cli-bin')
arch=('any')
md5sums=('SKIP')

source=(
  'git+https://github.com/crowdin/crowdin-cli.git#branch=cli3'
)

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  gradle buildCrowdinCliJar
  gradle properties --no-daemon --console=plain -q | grep "^version:" | awk '{printf $2}' > _pkgBuildVersion
  java -cp "build/libs/crowdin-cli-$(cat _pkgBuildVersion).jar" picocli.AutoComplete --force com.crowdin.cli.commands.picocli.RootCommand
}

package()
{
  cd "$srcdir"
  install -Dm 0644 "$srcdir/$pkgname"/build/libs/crowdin-cli-$(cat "$srcdir/$pkgname"/_pkgBuildVersion).jar "$pkgdir"/usr/share/java/$pkgname/crowdin-cli.jar
  install -Dm 0755 "$startdir"/crowdin "$pkgdir"/usr/bin/crowdin
  install -Dm 0644 "$srcdir/$pkgname"/crowdin_completion "$pkgdir"/usr/share/bash-completion/completions/crowdin
}

