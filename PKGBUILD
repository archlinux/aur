# Maintainer: Benoît Zugmeyer <bzugmeyer@gmail.com>
pkgname=deno-git
pkgver=r470.0208305
pkgrel=1
pkgdesc="A secure TypeScript runtime on V8"
arch=('i686' 'x86_64')
url="https://github.com/denoland/deno"
provides=('deno')
license=('MIT')
makedepends=(git python2-virtualenv nodejs cargo ccache)
source=("deno-git::git+https://github.com/denoland/deno")
md5sums=(SKIP)

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  git submodule update --init --recursive
  mkdir -p "${srcdir}"/python2-path
  ln -sf /usr/bin/python2 "${srcdir}/python2-path/python"
  export PATH="${srcdir}/python2-path:${PATH}"
  ./tools/setup.py
}

build() {
  cd "$pkgname"
  export PATH="${srcdir}/python2-path:${PATH}"
  DENO_BUILD_MODE=release ./tools/build.py :deno
}

check() {
  cd "$pkgname"
  ./out/release/deno tests/002_hello.ts
}

package() {
  cd "$pkgname"
  install -dm755 "${pkgdir}"/usr/bin
  install -m755 out/release/deno "${pkgdir}"/usr/bin
}
