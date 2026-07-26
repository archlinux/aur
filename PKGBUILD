# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Chinmay Dalal <TILDE chinmay SLASH public-inbox AT lists.sr.ht>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: desbma

declare srcdir pkgdir
pkgname=zoxide-extra-opts
pkgver=0.9.9
pkgrel=1
pkgdesc='A smarter cd command for your terminal - extra options patch'
arch=('x86_64')
url='https://github.com/ajeetdsouza/zoxide'
license=('MIT')
depends=(glibc # libc.so libm.so
         libgcc libgcc_s.so)
makedepends=(cargo git)
optdepends=('fzf: for interactive selection')
options=('!lto')
source=("$pkgname::git+$url.git#tag=v$pkgver"
        "extra_opts.diff::https://github.com/ValJed/zoxide/compare/9cdc6aa3740b4d8a9d62406c99e84c5de49645e9...7936aa6f4ca74ce2c3d0ffaf04899215d65cdd21.diff")
sha256sums=('a43bd37528b841bdf160a8b3d5f72afd5ba5b1caa22948d5b33097012d1cf9c2'
            '9900cedb15b6a6c8566fc886141e347092a2dca007a522dc77a8ca49eac8859d')
conflicts=('zoxide' 'zoxide-git')

prepare() {
  cd "$pkgname"
  git apply "$srcdir/extra_opts.diff"

  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname"

  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname"
  _pkgname=zoxide

  # binary
  install -vDm755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$_pkgname/" LICENSE

  # man pages
  install -vDm644 -t "$pkgdir/usr/share/man/man1/" man/man1/*.1

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$_pkgname/" README.md

  # shell auto-completions
  cd contrib/completions
  install -vDm644 -t "$pkgdir/usr/share/zsh/site-functions/" _zoxide
  install -vDm644 -t "$pkgdir/usr/share/fish/vendor_completions.d/" zoxide.fish
  install -vDm644 -t "$pkgdir/usr/share/nushell/vendor/autoload/" zoxide.nu
  install -vDm644 zoxide.bash "$pkgdir/usr/share/bash-completion/completions/zoxide"
}
