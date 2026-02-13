# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jiuyang Liu <liujiuyang1994@gmail.com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# Contributor: Guillaume Raffin ("theelectronwill") <theelectronwill@gmail.com>
# Contributor: Andreas Wendleder <gonsolo@gmail.com>

_bootstrap=1
pkgname=mill
pkgver=1.1.2
pkgrel=1
pkgdesc="Your shiny new Java/Scala build tool"
arch=(any)
url="https://com-lihaoyi.github.io/mill/"
license=('MIT')
depends=('bash' 'java-environment')
makedepends=('git')

if [[ "$_bootstrap" -eq 0 ]]; then
  makedepends+=('mill')
fi

source=("git+https://github.com/com-lihaoyi/mill.git#tag=$pkgver")
sha512sums=('d0bf02795bfe43d7b527aa880e2f874cbe223811e32662ff1735dbbcd64c3dcb8c3d55a12138414fc30d96b6dc3e4969466e7f10ece527f4d2b257a19cf8a875')

build() {
  cd "$pkgname"

  local _mill_exec
  if [[ "$_bootstrap" -eq 1 ]]; then
    echo "Bootstrapping with bundled script..."
    _mill_exec="./mill"
    chmod +x "$_mill_exec"
  else
    echo "Building with system mill..."
    _mill_exec="mill"
  fi

  echo "$pkgver" > .mill-version

  # Strips hardcoded shell headers for cleaner packaging and reproducibility
  sed -i '/object gradle/a \ \ def prependShellScript = ""' libs/init/package.mill
  sed -i '/object hilt/a \ \ def prependShellScript = ""' libs/androidlib/package.mill

  "$_mill_exec" -i dist.assembly
}

package() {
  cd "$pkgname"
  install -Dm644 out/dist/assembly.dest/out.jar "$pkgdir"/usr/share/java/mill/mill.jar
  install -Dm755 mill "$pkgdir"/usr/bin/mill
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/mill/LICENSE
}
