# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_reponame=XDarkTerror.lv2
_pkgname=xdarkterror.lv2
_lv2uri="http://guitarix.sourceforge.net/plugins/${_reponame//.lv2}_#_darkterror_"
pkgname="$_pkgname-git"
pkgver=r13.864e7ef
pkgrel=1
pkgdesc='An amp simulation LV2 plugin modelled after a small high-gain british valve amp (git version)'
arch=(x86_64)
url='https://github.com/brummer10/XDarkTerror.lv2'
license=(custom:0BSD)
depends=(gcc-libs glibc libx11)
makedepends=(cairo git lv2 lv2lint xxd)
groups=(pro-audio lv2-plugins)
provides=($_pkgname)
conflicts=($_pkgname)
source=(
  "$_pkgname::git+https://github.com/brummer10/$_reponame.git"
  'xputty::git+https://github.com/brummer10/Xputty.git'
)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd $_pkgname

  # no release yet and no version number anywhere in the sources
  #local ver="$(grep '^\s*VER =' Xmonk/Makefile | cut -d ' ' -f 3)"
  #echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname

  git submodule init
  git config submodule.Xputty.url "$srcdir"/xputty
  git -c protocol.file.allow=always  submodule update
}

build() {
  cd $_pkgname
  make
}

check() {
  cd $_pkgname

  mkdir -p lv2
  ln -sf ../${_reponame//.lv2}/${_reponame} lv2/${_reponame}
  # expected to produce errors
  #sord_validate -l "${PWD}/lv2/${_reponame}"/*.ttl || :
  LV2_PATH="$PWD/lv2:/usr/lib/lv2" lv2lint -M pack "$_lv2uri"
}

package() {
  depends+=(libcairo.so)
  cd $_pkgname

  make DESTDIR="${pkgdir}" PREFIX=/usr install
  # documentation
  install -vDm 644 README.md "${_reponame//.lv2}.png" -t "$pkgdir"/usr/share/doc/$pkgname
  # license
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
