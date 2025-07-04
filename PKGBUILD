# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: erk <v at erk dot io>

pkgname=vnote
pkgver=3.19.2
pkgrel=1
pkgdesc="A Vim-inspired note-taking application, especially for Markdown."
arch=(x86_64 i686 armv7h aarch64)
url="https://vnotex.github.io/vnote/en_us/"
license=(LGPL3)
depends=(qt6-webengine qt6-svg qt6-webchannel qt6-5compat)
makedepends=(git cmake qt6-tools clang lld)
source=("git+https://github.com/vnotex/vnote.git#tag=v${pkgver}"
        "vnotex-vtextedit::git+https://github.com/vnotex/vtextedit"
        "vnotex-QHotkey::git+https://github.com/vnotex/QHotkey.git"
        "vnotex-syntax-highlighting::git+https://github.com/vnotex/syntax-highlighting"
        "vnotex-hunspell::git+https://github.com/vnotex/hunspell"
        "vnotex-sonnet::git+https://github.com/vnotex/sonnet")
sha256sums=('f83648b7416d01f492913ecb6738afe757e69bc2210c4ad8529e5b24550b42e7'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd "vnote"

  git submodule init
  git config 'submodule.libs/vtextedit.url' "${srcdir}/vnotex-vtextedit"
  git config 'submodule.libs/QHotkey.url' "${srcdir}/vnotex-QHotkey"
  git -c protocol.file.allow=always submodule update

  cd "libs/vtextedit"
  git submodule init
  git config 'submodule.src/libs/syntax-highlighting.url' "${srcdir}/vnotex-syntax-highlighting"
  git config 'submodule.src/libs/hunspell.url' "${srcdir}/vnotex-hunspell"
  git config 'submodule.src/libs/sonnet.url' "${srcdir}/vnotex-sonnet"
  git -c protocol.file.allow=always submodule update
}

build() {
  export CC=/usr/bin/clang CXX=/usr/bin/clang++
  export LD="/usr/bin/lld"
  export LDFLAGS="-fuse-ld=lld"

  cmake -B build -S "vnote" -Wno-dev \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DUSE_LD_GOLD=OFF \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
