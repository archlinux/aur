# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


pkgname=git-delta
_name="${pkgname#*-}"
pkgver=0.5.1
pkgrel=1

pkgdesc='A syntax-highlighting pager for git and diff output'
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/dandavison/$_name"
license=('MIT')

depends=('git' 'libgit2')
makedepends=('rust' 'clang' 'llvm')

source=("$pkgname-$pkgver.tgz::$url/archive/$pkgver.tar.gz")
sha256sums=('dd59b747cd178184dff31c7e1707be41f8bc6b412c0c78e62b89aeca4c0f2e15')


prepare() {
  # Assist chroot builds with a persistent cargo cache (hat tip @ccorn for this patch)
  if [ -d "$startdir/.cargo" ]; then
    export CARGO_HOME="${CARGO_HOME:-$startdir/.cargo}"
  else
    msg2 "NOTE : If you're building in a (clean) chroot and want a persistant
            cargo cache folder specific for this package, you can create
            an empty '.cargo' directory next to the 'PKGBUILD'. This will
            be recognized and used as CARGO_HOME (except when CARGO_HOME is
            already set)."
  fi
}

build() {
  cd "$_name-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$_name-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$_name-$pkgver"
  install -Dm755 "target/release/$_name"   -t"$pkgdir/usr/bin/"
  install -Dm644 {README,CONTRIBUTING}.md  -t"$pkgdir/usr/share/doc/$_name/"
  install -Dm644 LICENSE                   -t"$pkgdir/usr/share/licenses/$_name/"
  cd etc
  cp -a --no-preserve=o performance examples "$pkgdir/usr/share/doc/$_name/"
  install -Dm644 completion/completion.bash  "$pkgdir/usr/share/bash-completion/completions/$_name"
  install -Dm644 completion/completion.zsh   "$pkgdir/usr/share/zsh/site-functions/_$_name"
  cd bin
  local _bin
  for _bin in *; do
    install -Dm755 "$_bin"                   "$pkgdir/usr/bin/delta-$_bin"
  done
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
