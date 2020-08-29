# Maintainer: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=rime-putonghua
pkgver=0.0.0.20200829
_commit=4991b3489683533ca500469cb3996387ac76a8a7
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
sha512sums=('c6120e3e830765318ad8357a2ef3847053d5001ab43b1b51ef3230099428da0a38159d29b2163785450e56c7d55188576805a65408f68c596118a0609b6eaa02')

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
