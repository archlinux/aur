# Maintainer: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=rime-putonghua
pkgver=0.0.0.20200821
_commit=2e0e8bd4d6bdede29daac7ff2cfd369795d528bf
pkgrel=1
pkgdesc="rime 有声调普通话拼音方案"
arch=('any')
url="https://github.com/ayaka14732/rime-putonghua"
license=('custom:CC-BY' 'custom:CC-BY-SA')
# TODO: librime-cloud
# Maybe we need a hook?
# dependency for reverse lookup
depends=(   'rime-stroke'
            'rime-essay-simp'
            'rime-liangfen'
            'rime-symbolic-simp'
            'rime-emoji'
            )
makedepends=('librime' 'rime-prelude')
source=("https://github.com/ayaka14732/rime-putonghua/archive/$_commit/rime-putonghua-$_commit.tar.gz")
sha512sums=('bd17a0b0950d8640f19b4bdf2d896c0f4e0b96fb2b92cb80bb4fe50cac9ab2320cdb458c8128ed786e6794d932047514e4950cec3b1c7f39e765862a7a805d10')

prepare() {
  cd $pkgname-$_commit
  # Link essentials
  for _f in $(pacman -Qql rime-prelude rime-essay-simp rime-liangfen rime-symbolic-simp | grep -v "/$"); do ln -sf $_f; done
}

build(){
  cd $pkgname-$_commit
  for _s in $(ls *.schema.yaml); do rime_deployer --compile $_s; done
}

package() {
  cd $pkgname-$_commit
  find . -type l -delete
  rm build/*.txt
  rm build/liangfen.*
  install -Dm644 *.yaml -t "$pkgdir"/usr/share/rime-data/
  install -Dm644 build/* -t "$pkgdir"/usr/share/rime-data/build/
  
  install -Dm644 LICENSE-CC-BY -t "$pkgdir"/usr/share/licenses/
  install -Dm644 LICENSE-CC-BY-SA -t "$pkgdir"/usr/share/licenses/
}
