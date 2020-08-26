# Maintainer: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=rime-putonghua
pkgver=0.0.0.20200825
_commit=efeee372309af32755908ea89f7f1c2e5a794638
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
sha512sums=('8a994adc31f8631a325cb61858c7c9bf68cd46626578a0825db64038f9badb7175f970441917fce8a21c08b4e5c5ffe8daf024bc8f27ba3153719f7bce3744ee')

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
