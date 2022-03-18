# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jiuyang Liu <liujiuyang1994@gmail.com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# Contributor: Guillaume Raffin ("theelectronwill") <theelectronwill@gmail.com>

pkgname=mill
pkgver=0.10.2
pkgrel=1
pkgdesc="Your shiny new Java/Scala build tool"
arch=(any)
url="https://www.lihaoyi.com/mill/index.html"
license=('MIT')
depends=('bash' 'java-environment')
makedepends=('mill')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lihaoyi/mill/archive/$pkgver.tar.gz")
sha512sums=('852193fbb96116ce2f414b9fd1cb344add1b8c49034611ca47aa573a4d455d79f4db4a89c4243908b060fffc19ccdbca15dbcee36e3fd0b6449efbba0253ff1a')

prepare() {
  cd mill-$pkgver
  # workaround non-git build
  sed -e "s/VcsVersion.vcsState().format()/\"$pkgver\"/" \
      -e 's/VcsVersion.vcsState().lastTag.getOrElse//' \
      -e "s/sys.error(\"No (last) git tag found. Your git history seems incomplete!\")/\"$pkgver\"/" \
      -i build.sc
}

build() {
  cd mill-$pkgver
  mill -i all __.publishLocal assembly
}

package() {
  cd mill-$pkgver
  install -Dm755 out/assembly.dest/mill "$pkgdir"/usr/bin/mill
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/mill/LICENSE
}
