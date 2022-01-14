# Maintainer: Vasiliy Stelmachenok <ventureo@yandex.ru>

_gitname=nvlax
pkgname=$_gitname-git
pkgver=r11.b3699ad
pkgrel=3
pkgdesc='Future-proof NvENC & NvFBC patcher'
arch=('x86_64')
url='https://github.com/illnyang/nvlax'
license=('GPL')
depends=('nvidia-utils')
makedepends=('cmake' 'git')
provides=('nvlax' 'nvlax-git')
conflicts=('nvlax')
options=(!ccache)
source=("$_gitname"::"git+https://github.com/illnyang/$_gitname.git"
        'nvlax-upgrade.hook'
        'nvlax-install.hook')
sha256sums=('SKIP'
            '09c135c0a372f0b0020fea2665301249e73d32919d9b83d37718d402897ba5f7'
            '5d7eae6a93cd66b602a723f615d1c768f131dbb1e14432783f2a452a87e4501e')

prepare() {
  cd $_gitname

  # Fixes: https://github.com/illnyang/nvlax/issues/11
  sed -i 's|CPMAddPackage("gh:zyantific/zydis#master")|CPMAddPackage("gh:zyantific/zydis#55dd08c210722aed81b38132f5fd4a04ec1943b5")|g' CMakeLists.txt
}

pkgver() {	
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_gitname
  cmake -B build
  make -C build
}

package() {
  cd $_gitname
  install -Dm755 build/nvlax_encode -t "$pkgdir/usr/bin"
  install -Dm755 build/nvlax_fbc    -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  # Auto applying hooks
  install -Dm644 "${srcdir}/nvlax-install.hook" -t "$pkgdir/usr/share/libalpm/hooks"
  install -Dm644 "${srcdir}/nvlax-upgrade.hook" -t "$pkgdir/usr/share/libalpm/hooks"
}
