# Maintainer: ⭐️NINIKA⭐️ <nikita6@bk.ru>
pkgname=psvpfstools-git
_gitname=psvpfstools
pkgver=0.17.0.gfe2549cb
pkgrel=1
pkgdesc="Tools for decrypting PS Vita PFS filesystem (Vita3K fork)."
arch=('any')
url="https://github.com/Vita3K/psvpfstools"
license=('Unknown')
depends=(boost)
makedepends=(git cmake ninja)
source=(
  "git+https://github.com/Vita3K/psvpfstools.git#commit=1d2547a72d20126c1425101cb448943a1027d950"
  "git+https://github.com/KorewaWatchful/libb64.git"
  "git+https://github.com/KorewaWatchful/libtomcrypt.git"
  "git+https://github.com/KorewaWatchful/libzrif.git"
  "git+https://github.com/Vita3K/psvpfsparser.git"
  "git+https://github.com/KorewaWatchful/zlib.git"
  "build-examples.patch"
  "run-execute-in-example.patch"
)
sha256sums=(
  SKIP
  SKIP
  SKIP
  SKIP
  SKIP
  SKIP
  SKIP
  SKIP
)

_link_submodule() {
  git config "submodule.libs/$1.url" "$srcdir/$1"
}

prepare() {
  cd "${_gitname}"
  git submodule init
  
  _link_submodule libb64
  _link_submodule libtomcrypt
  _link_submodule libzrif
  _link_submodule svpfsparser
  _link_submodule zlib
  
  git -c protocol.file.allow=always submodule update
  
  patch -Nup1 --ignore-whitespace -i "${srcdir}/build-examples.patch"
  patch -Nup1 --ignore-whitespace -i "${srcdir}/run-execute-in-example.patch"
}

build() {
  mkdir -p build
  cd build
  cmake ../${_gitname} -DCMAKE_BUILD_TYPE=Release -G Ninja
  
  ninja
}

package() { 
  mkdir -p "${pkgdir}/usr/bin/"
  install -Dm755 "${srcdir}/build/psvpfsparser/cmake/example_project" "${pkgdir}/usr/bin/psvpfsparser"
}
