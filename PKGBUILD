# Maintainer: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=rime-putonghua
pkgver=0.0.0.20200916
_commit=efd8729d089d7255ef8596bf56679ec6eaa9e0f8
pkgrel=1
pkgdesc="rime 有声调普通话拼音方案"
arch=('any')
url="https://github.com/ayaka14732/rime-putonghua"
license=('custom:CC-BY' 'custom:CC-BY-SA')
# dependency for reverse lookup
depends=(   'rime-stroke'
            'rime-essay-simp'
            'rime-liangfen'
            'rime-symbolic-simp'
            'rime-emoji'
			)

optdepends=('rime-lua-cloud'
			)
makedepends=('librime' 'rime-prelude')
source=("https://github.com/ayaka14732/rime-putonghua/archive/$_commit/rime-putonghua-$_commit.tar.gz")
sha512sums=('ba2cebf9fec3c784d8931ccdbcab0028b640025b44b55f1ef15ed79c194428c4cb7a8011b57fbde3279a9a8aa2dc8a2097400d58c7e487715463ca645c74978e')

prepare() {
  cd $pkgname-$_commit
  # Link essentials
  for _f in $(pacman -Qql rime-prelude rime-essay-simp rime-symbolic-simp | grep -v "/$"); do ln -sf $_f; done
}

build(){
  cd $pkgname-$_commit
  for _s in $(ls *.schema.yaml); do rime_deployer --compile $_s; done
}

package() {
  cd $pkgname-$_commit
  find . -type l -delete
  rm build/*.txt
  install -Dm644 *.yaml -t "$pkgdir"/usr/share/rime-data/
  install -Dm644 build/* -t "$pkgdir"/usr/share/rime-data/build/

  install -Dm644 LICENSE-CC-BY -t "$pkgdir"/usr/share/licenses/
  install -Dm644 LICENSE-CC-BY-SA -t "$pkgdir"/usr/share/licenses/
}
