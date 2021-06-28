# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : ccorn


pkgname=git-delta

pkgver=0.8.1
pkgrel=2

pkgdesc='Syntax-highlighting pager for git and diff output'
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url=https://github.com/dandavison/delta
license=('MIT')

makedepends=('rust')
depends=('git' 'libgit2')

source=("$pkgname-$pkgver.tgz::$url/archive/$pkgver.tar.gz")
sha256sums=('e478acf90c1125af0cfcb055c1e2b358080d192fbf83cf5ddfa40241830ab826')

# lto fails, ref: https://aur.archlinux.org/packages/git-delta/#comment-811625
options=('!lto')


_setup_build_env() {
  # Assist chroot builds with a persistent cargo cache
  if [ -d "$startdir/.cargo" ]; then
    export CARGO_HOME="${CARGO_HOME:-$startdir/.cargo}"
  elif [ "$1" = "-v" ]; then
    msg2 "NOTE : If you're building in a (clean) chroot and want a persistant
            cargo cache folder specific for this package, you can create
            an empty '.cargo' directory next to the PKGBUILD.  This will
            then be recognized and used as the CARGO_HOME cache. (Except
            when the CARGO_HOME variable is already set in your environ-
            ment.)"
  fi
}

prepare() {
  sed -i "/path *=/s|=.*|= /usr/share/gitconfig.delta|" "delta-$pkgver/themes.gitconfig"
}

build() {
  _setup_build_env -v
  cd "delta-$pkgver"
  cargo build --release --locked --target-dir ./target
}

check() {
  _setup_build_env
  cd "delta-$pkgver"
  cargo test --release --locked --target-dir ./target
}

package() {
  cd "delta-$pkgver"
  install -Dm755 "target/release/delta"   -t"$pkgdir/usr/bin/"
  install -Dm644 themes.gitconfig           "$pkgdir/usr/share/gitconfig.delta"
  install -Dm644 {README,CONTRIBUTING}.md -t"$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE                  -t"$pkgdir/usr/share/licenses/$pkgname/"
  cd etc
  install -Dm644 completion/completion.bash "$pkgdir/usr/share/bash-completion/completions/delta"
  install -Dm644 completion/completion.zsh  "$pkgdir/usr/share/zsh/site-functions/_delta"
  install -Dm755 bin/*                    -t"$pkgdir/usr/lib/$pkgname/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
