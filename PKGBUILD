# Maintainer: Ayaka Mikazuki <ayaka@mail.shn.hk>

pkgname=rime-nguphing
_repo_name=rime_nguphing
pkgver=0.0.0.20260124
_commit=07d833c3e4d033527d7176e4a9cee8a4f3503bba
pkgrel=1
pkgdesc="A Standardized Shanghainese (Wu Language) Input Method for RIME engine"
arch=('x86_64')
url="https://github.com/saeziae/${_repo_name}"
license=('AGPL-3.0-only')
# dependency for reverse lookup
depends=('rime-luna-pinyin' 'rime-stroke')
makedepends=('librime')
source=("$url/archive/$_commit/${_repo_name}-$_commit.tar.gz")
sha256sums=('38e753d0227ceb0c222dc3ba49448062130fd87b37ad11a9cb8b4eec6ccb49d8')

prepare() {
  cd $_repo_name-$_commit
  # Link essentials
  for _f in $(pacman -Qql rime-prelude rime-essay | grep -v "/$"); do ln -sf $_f; done
}

build(){
  cd $_repo_name-$_commit
  for _s in $(ls *.schema.yaml); do rime_deployer --compile $_s; done
}

package() {
  cd $_repo_name-$_commit
  find . -type l -delete
  rm build/*.txt
  install -Dm644 *.yaml -t "${pkgdir}/usr/share/rime-data/"
  install -Dm644 *.ico -t "${pkgdir}/usr/share/rime-data/"
  install -Dm644 build/* -t "${pkgdir}/usr/share/rime-data/build/"
  #install -Dm644 opencc/* -t "${pkgdir}/usr/share/rime-data/opencc/"
  # install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
