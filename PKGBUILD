# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


pkgname=git-delta
_name="${pkgname#*-}"
pkgver=0.7.1
pkgrel=1

pkgdesc='A syntax-highlighting pager for git and diff output'
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/dandavison/$_name"
license=('MIT')

makedepends=('rust' 'clang' 'llvm')
depends=('git' 'libgit2')

backup=("etc/gitconfig.$_name")
source=("$pkgname-$pkgver.tgz::$url/archive/$pkgver.tar.gz")
sha256sums=('f432335361088c37f8aa4bb747ba12e1f8eddbbc3ed5c51fdd52d9b96eb22227')


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
  sed -i "4s|\(path *= *\).*$|\1/etc/gitconfig.$_name|" "$_name-$pkgver/themes.gitconfig"
}

build() {
  cd "$_name-$pkgver"
  cargo build --release --locked --target-dir ./target
}

check() {
  cd "$_name-$pkgver"
  cargo test --release --locked --target-dir ./target
}

package() {
  cd "$_name-$pkgver"
  install -Dm755 "target/release/$_name"  -t"$pkgdir/usr/bin/"
  install -Dm644 themes.gitconfig           "$pkgdir/etc/gitconfig.$_name"
  install -Dm644 {README,CONTRIBUTING}.md -t"$pkgdir/usr/share/doc/$_name/"
  install -Dm644 LICENSE                  -t"$pkgdir/usr/share/licenses/$_name/"
  cd etc
  install -Dm644 completion/completion.bash "$pkgdir/usr/share/bash-completion/completions/$_name"
  install -Dm644 completion/completion.zsh  "$pkgdir/usr/share/zsh/site-functions/_$_name"
  install -Dm755 bin/*                    -t"$pkgdir/usr/lib/$pkgname/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
