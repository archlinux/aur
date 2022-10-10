# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jiuyang Liu <liujiuyang1994@gmail.com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# Contributor: Guillaume Raffin ("theelectronwill") <theelectronwill@gmail.com>

pkgname=mill
pkgver=0.10.7
pkgrel=1
pkgdesc="Your shiny new Java/Scala build tool"
arch=(any)
url="https://com-lihaoyi.github.io/mill/"
license=('MIT')
depends=('bash' 'java-environment')
makedepends=('mill')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lihaoyi/mill/archive/$pkgver.tar.gz")
sha512sums=('321463a2bd98261efd91e2e954ecd6b372e1027e06806b0aaa8380accd773ca926589e1adb94d495cde0d92276abddf64474e24d6856c662c86b5a96e0cf6585')

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
