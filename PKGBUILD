# Maintainer: Ayaka Mikazuki <ayaka@mail.shn.hk>

pkgname=rime-tupa
pkgver=0.0.0.20260212
_commit=dd0a49b36a317444ff58d67244f40f781a4a748c
pkgrel=1
pkgdesc="TUPA input for rime"
arch=('x86_64')
url="https://github.com/nk2028/${pkgname}"
license=('MIT')
# dependency for reverse lookup
depends=('rime-luna-pinyin' 'rime-cantonese')
makedepends=('librime')
source=("$url/archive/$_commit/$pkgname-$_commit.tar.gz")
sha256sums=('ee316bc25918c40860be4670188d42b4ad289e3fcaca0c23acc84e59718d45b7')

prepare() {
  cd $pkgname-$_commit
  # Link essentials
  for _f in $(pacman -Qql rime-prelude rime-essay | grep -v "/$"); do ln -sf $_f; done
}

build(){
  cd $pkgname-$_commit
  for _s in $(ls *.schema.yaml); do rime_deployer --compile $_s; done
}

package() {
  cd $pkgname-$_commit
  find . -type l -delete
  rm build/*.txt
  install -Dm644 *.yaml -t "${pkgdir}/usr/share/rime-data/"
  install -Dm644 build/* -t "${pkgdir}/usr/share/rime-data/build/"
  #install -Dm644 opencc/* -t "${pkgdir}/usr/share/rime-data/opencc/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
