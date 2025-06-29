# Maintainer: Graham King <grking.email@gmail.com>
pkgname=nim-stable
pkgver=2.2.4
pkgrel=1
epoch=
pkgdesc="Nim programming language. This packages tracks the latest stable release."
arch=(x86_64)
url="https://nim-lang.org/"
license=(MIT)
depends=(
  bash
  gcc
  gcc-libs
  glibc
  pcre
)
makedepends=(
	git
)
checkdepends=()
optdepends=(
  'python3: regenerate unidecode data'
  'python-unidecode: regenerate unidecode data'
)
provides=(
  nim
  nimble
)
conflicts=(
  nim
  nimble
)
replaces=()
backup=(
  'etc/nim/nim.cfg'
)
options=(debug !strip)
install=
changelog=
source=(
  "https://nim-lang.org/download/nim-$pkgver.tar.xz"
)
noextract=()
sha256sums=(
  'f82b419750fcce561f3f897a0486b180186845d76fb5d99f248ce166108189c7'
)
validpgpkeys=()

prepare() {
  cd "nim-$pkgver"
  for nimcfg in {compiler,config}/nim.cfg; do
    echo "gcc.options.always %= \"\${gcc.options.always} ${CFLAGS:-} ${CPPFLAGS}\"" >> "${nimcfg}"
    echo "gcc.options.linker %= \"\${gcc.options.linker} ${LDFLAGS:-}\"" >> "${nimcfg}"
  done

}

build() {
  cd "nim-$pkgver"
  mkdir cache

  echo "Building nim"
  sh build.sh

  echo "Building koch"
  bin/nim --nimcache:cache c koch

  echo "Bootstrapping koch"
  ./koch boot -d:release

  echo "Building tools"
  XDG_CACHE_HOME=cache ./koch tools
}

check() {
  cd "nim-$pkgver"
}

package() {
  cd "nim-$pkgver"
  XDG_CACHE_HOME=cache ./koch install "$pkgdir"

  mkdir -p "$pkgdir/usr/lib"
  mv lib "$pkgdir/usr/lib/nim"
  mv compiler "$pkgdir/usr/lib/nim/"
  install -Dm 644 nim.nimble "$pkgdir/usr/lib/nim/compiler"

  mkdir -p "$pkgdir/etc/nim"
  mv config/* "$pkgdir/etc/nim"

  mkdir -p "$pkgdir/usr/bin"
  mv bin/* "$pkgdir/usr/bin"

  # Fix FS#50252, unusual placement of header files
  mkdir -p "$pkgdir/usr/include"
  cp -a "$pkgdir/usr/lib/nim/"*.h "$pkgdir/usr/include"

  mkdir -p "$pkgdir/usr/share/nim"
  mv doc "$pkgdir/usr/share/nim/"

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  mv copying.txt "$pkgdir/usr/share/licenses/$pkgname/"

  ln -s "./" "$pkgdir/usr/lib/nim/lib"

  for comp in tools/*.bash-completion; do
    install -Dm 644 "$comp" "$pkgdir/usr/share/bash-completion/completions/$(basename "${comp/.bash-completion}")"
  done
  for comp in tools/*.zsh-completion; do
    install -Dm 644 "$comp" "$pkgdir/usr/share/zsh/site-functions/_$(basename "${comp/.zsh-completion}")"
  done

  rm -r "$pkgdir/nim"
  rm -r cache

}
