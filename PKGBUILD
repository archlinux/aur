# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Yaohan Chen <yaohan.chen@gmail.com>
pkgname=anura
pkgver=4.0.2
pkgrel=2
pkgdesc="A fully-featured game engine, the tech behind the spectacular Frogatto & Friends"
arch=('x86_64')
url="https://github.com/anura-engine/anura"
license=('zlib')
depends=('libgl' 'mesa' 'glew' 'cairo' 'sdl2' 'sdl2_image' 'sdl2_ttf' 'sdl2_mixer' 'libpng' 'boost-libs')
makedepends=('git' 'boost' 'glm')
source=("git+https://github.com/anura-engine/anura.git#tag=v$pkgver"
        'git+https://github.com/sweetkristas/imgui.git'
        'Upstreamed-boost-patch-1.patch::https://github.com/anura-engine/anura/commit/a2a10404bd9b2d7bd0d20bda3f8c7252721e5ee8.patch'
        'Upstreamed-boost-patch-2.patch::https://github.com/anura-engine/anura/commit/4140e26ff3e4c904556e4b33be252ad687c0be74.patch'
        'Fix-Boost-1.86.0-compatibility.patch::https://github.com/anura-engine/anura/commit/f921cf7fb63ed4d386db973dc0188c45e636db9e.patch')
sha512sums=('5b2a546629d43c4fd2dc53e7be9488aa42ef089db9f7d72a82899315b2b9f650895e317fc23eeba1fd9ee826bbdf98c650ee10e41e2146d24d438f0e7ee00c4d'
            'SKIP'
            '28ad5a8fb1aadcfb23349ebee97d755d326efa2cdbfd124471ab5f91eab2d8c49632ccf8941bc646267013ee2bebbbf258a8e73bc9fdc72ad9b05ec286bb1d86'
            '1c20e8db9153081f0ddd5ff08fc4101db4740618198e6831393948b9360944f7ad8e87751dba620a35b84efb4171a2f5852517305f82333620894bf4b26c2f6d'
            '72bc2734b752d299886a9c3354108dc6a49a0a0001180d71bcab5d7996cfc2c7ad2ce60177c05bd18c688b698d4be1db6fee9e2a7b72dc2aa90a3edb7a2b55fa')

prepare() {
  cd $pkgname
  git submodule init
  git config submodule.imgui.url "$srcdir/imgui"
  git -c protocol.file.allow=always submodule update --init --recursive
  git submodule update

  patch -Np1 -i "$srcdir/Upstreamed-boost-patch-1.patch"
  patch -Np1 -i "$srcdir/Upstreamed-boost-patch-2.patch"
  patch -Np1 -i "$srcdir/Fix-Boost-1.86.0-compatibility.patch"
}

build() {
  cd $pkgname

  # this uses malloc_usable_size, which is incompatible with fortification level 3
  export CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  export CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

  export CXXFLAGS="${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS} -DGLM_ENABLE_EXPERIMENTAL -Wno-error=return-type -Wno-error=dangling-reference -Wno-error=deprecated-declarations -Wno-error=odr"
  make anura
}

package() {
  cd $pkgname
  install -D -m755 anura $pkgdir/usr/lib/anura/anura

  _installdir=$pkgdir/usr/share/anura
  mkdir -p $_installdir
  cp -r data $_installdir
  cp -r images $_installdir
  cp -r music $_installdir
  cp -r modules $_installdir
}

# vim:set ts=2 sw=2 et:
