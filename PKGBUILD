# Maintainer: Benoît Zugmeyer <bzugmeyer@gmail.com>
pkgname=deno-git
pkgver=0.5.0.r19.g72197878
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
  git describe --long --tags 2>/dev/null | sed 's/[^[:digit:]]*\(.\+\)-\([[:digit:]]\+\)-g\([[:xdigit:]]\{7\}\)/\1.r\2.g\3/;t;q1'
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
  DENO_BUILD_MODE=release ./tools/build.py deno
}

check() {
  cd "$pkgname"
  ./target/release/deno run tests/002_hello.ts
}

package() {
  cd "$pkgname"
  install -dm755 "${pkgdir}"/usr/bin
  install -m755 target/release/deno "${pkgdir}"/usr/bin
}
