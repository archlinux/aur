# Maintainer: Vasiliy Stelmachenok <ventureo@yandex.ru>
# Contributor: mfcmquintela <mfcmquintela@gmail.com>
# Contributor: lazerl0rd <lazerl0rd@thezest.dev>

_gitname=nvlax
pkgname=$_gitname-git
pkgver=r11.b3699ad
pkgrel=5
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
            '347ba347a37f70c008be340c40cd55fff8588ce7aa3dd1dd7ef0241bd2f5e09a'
            '120488c0831ae4b347432c46add9f56f146f69580ebedfece4bb4ed947fb12df')

prepare() {
  cd $_gitname

  # Fixes: https://github.com/illnyang/nvlax/issues/11
  sed -i 's|CPMAddPackage("gh:zyantific/zydis#master")|CPMAddPackage("gh:zyantific/zydis#55dd08c210722aed81b38132f5fd4a04ec1943b5")|g' CMakeLists.txt
  sed -i '23s/GIT_TAG\smaster/GIT_TAG b65e7cca03ec4cd91f1d7125e717d01635ea81ba/' CMakeLists.txt
  sed -i '62s/GIT_TAG\smaster/GIT_TAG 833b8b7ea49aea540a49f07ad08bf0bae1faac32/' CMakeLists.txt
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
