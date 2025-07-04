# Maintainer: graysky <therealgraysky AT proton DOT me>

pkgname=autojump-rs-git
_pkgname=autojump-rs
_autojump_ver=22.5.3
pkgver=0.5.1.r14.g65abf11
pkgrel=1
pkgdesc="A faster way to navigate your filesystem from the command line"
arch=(any)
url="https://github.com/xen0n/autojump-rs"
license=(GPL-3.0-only)
makedepends=(git python cargo)
conflicts=(autojump)
provides=(autojump)
source=('git+https://github.com/xen0n/autojump-rs.git'
         autojump-$_autojump_ver.tar.gz::https://github.com/wting/autojump/archive/refs/tags/release-v$_autojump_ver.tar.gz)
sha256sums=('SKIP'
            '00daf3698e17ac3ac788d529877c03ee80c3790472a85d0ed063ac3a354c37b1')

pkgver() {
    cd $_pkgname
    git describe --long --tags | sed 's/^release\-v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  cargo build --release --locked --all-features
  cargo fix --bin "autojump"
}

check () {
  cd $_pkgname
  cargo test --release --locked --all-features
}

package() {
  cd ${_pkgname/-rs}-release-v$_autojump_ver

  ./install.py --prefix 'usr/' --destdir "$pkgdir" --zshshare 'usr/share/zsh/site-functions'

   # remove python built bin and use rust build one
   rm "$pkgdir"/usr/bin/${_pkgname/-rs}*
   rm "$pkgdir"/usr/share/autojump/icon.png

   install -Dm755 "$srcdir"/$_pkgname/target/release/${_pkgname/-rs} "$pkgdir"/usr/bin/${_pkgname/-rs}

   # FS#43762
   sed -i -e '27,31d' -i -e 's|local/||' "$pkgdir"/etc/profile.d/${_pkgname/-rs}.sh

   # FS#49601
   install -d "$pkgdir"/usr/share/fish/completions
   mv "$pkgdir"/usr/share/${_pkgname/-rs}/${_pkgname/-rs}.fish "$pkgdir"/usr/share/fish/completions
}


# vim:set ts=4 sw=4 et:
