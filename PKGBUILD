# Maintainer: Morgan <morganamilo@archlinux.org>
pkgname=bah
pkgver=2.6.5
pkgrel=1
pkgdesc='Beautiful AUR helper, libalpm powered package manager '
url='https://github.com/Hinarosha/bah'
source=("$pkgname-$pkgver.tar.gz::https://github.com/Hinarosha/bah/archive/v$pkgver.tar.gz")
backup=("etc/bah.conf")
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('GPL-3.0-or-later')
makedepends=('cargo')
depends=('git' 'pacman' 'libalpm.so>=14')
optdepends=('bat: colored pkgbuild printing' 'devtools: build in chroot and downloading pkgbuilds')
sha256sums=('7ac0b942c61679d2700d4cbd1aae27acc18c18b6d771e3326498bfcbe232ae47')

prepare() {
  cd "$pkgname-$pkgver"
  cargo update alpm alpm-utils
  cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build () {
  cd "$srcdir/$pkgname-$pkgver"

  if pacman -T pacman-git > /dev/null; then
    _features+="git,"
  fi

  if [[ $CARCH != x86_64 ]]; then
    export CARGO_PROFILE_RELEASE_LTO=off
  fi

  cargo build --frozen --features "${_features:-}" --release --target-dir target
  ./scripts/mkmo locale/
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/bah "${pkgdir}/usr/bin/bah"
  install -Dm644 bah.conf "${pkgdir}/etc/bah.conf"

  install -Dm644 man/bah.8 "$pkgdir/usr/share/man/man8/bah.8"
  install -Dm644 man/bah.conf.5 "$pkgdir/usr/share/man/man5/bah.conf.5"

  install -Dm644 completions/bash "${pkgdir}/usr/share/bash-completion/completions/bah.bash"
  install -Dm644 completions/fish "${pkgdir}/usr/share/fish/vendor_completions.d/bah.fish"
  install -Dm644 completions/zsh "${pkgdir}/usr/share/zsh/site-functions/_bah"

  install -d "$pkgdir/usr/share/"
  cp -r locale "$pkgdir/usr/share/"
}