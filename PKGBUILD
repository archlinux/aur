# Maintainer: Noel Jacob <noeljacob at gmail dot com>
# Contributor: Daniele Basso <d dot bass 05 at proton dot me>
pkgname=bun-git
pkgver=1.0.2.r20.bab9889
pkgrel=1
pkgdesc="Bun is a fast JavaScript all-in-one toolkit. This PKGBUILD builds from source, resulting into a minor binary depending on your CPU."
arch=(x86_64)
url="https://github.com/oven-sh/bun"
license=('MIT')
makedepends=(bun clang cmake esbuild git go icu libiconv libtool lld llvm ninja pkg-config python ruby rust unzip zig git)
conflicts=(bun bun-bin)
provides=(bun)

pkgver() {
  cd "$pkgname"
  release=$(git describe --tags `git rev-list --tags --max-count=1` | sed 's/^bun-v//')
  version="r$(git rev-list --count HEAD).$(git rev-parse --short=7 HEAD)"
  printf "$release.$version"
}

prepare() {
  cd "$srcdir"
  if [[ -d $pkgname ]]; then
    cd $pkgname && git pull origin master
  else
    git clone --depth 1 "$url" $pkgname
  fi

  cd "$pkgname"
  git checkout .

  bun install -g @oven/zig
  bun install

  make assert-deps
  git -c submodule.src/javascript/jsc/WebKit.update=checkout submodule update --init --recursive --depth=1 --progress

  make vendor-without-npm -j1
  make identifier-cache clean-bindings
}

build() {
  cd "$pkgname"

#  mkdir -p $srcdir/bun/src/bun.js/WebKit/WebKitBuild/Release/lib/
#  ln -sf /usr/lib/libicui18n.so $srcdir/bun/src/bun.js/WebKit/WebKitBuild/Release/lib/libicui18n.a
#  ln -sf /usr/lib/libicudata.so $srcdir/bun/src/bun.js/WebKit/WebKitBuild/Release/lib/libicudata.a
#  ln -sf /usr/lib/libicuuc.so $srcdir/bun/src/bun.js/WebKit/WebKitBuild/Release/lib/libicuuc.a

#  make jsc-build jsc-copy-headers headers -j1

  make release-bindings
  make release -j1
}

package() {
  install -Dm755 $srcdir/$pkgname/packages/bun-linux-x64/bun $pkgdir/usr/bin/bun
  ln -s /usr/bin/bun $pkgdir/usr/bin/bunx

  SHELL=zsh $pkgdir/usr/bin/bun completions > bun.zsh
  SHELL=bash $pkgdir/usr/bin/bun completions > bun.bash
  SHELL=fish $pkgdir/usr/bin/bun completions > bun.fish

  install -Dm644 bun.zsh $pkgdir/usr/share/zsh/site-functions/_bun
  install -Dm644 bun.bash $pkgdir/usr/share/bash-completion/completions/bun
  install -Dm644 bun.fish $pkgdir/usr/share/fish/vendor_completions.d/bun.fish
}
