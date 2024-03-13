# Maintainer: Morgan <morganamilo@archlinux.org>
pkgname=paru-alpm-v3-git
_pkgname=paru
pkgver=2.0.1.r25.g2a8e257
pkgrel=1
pkgdesc='Feature packed AUR helper (with ALPM v3 patches)'
url='https://github.com/morganamilo/paru'
source=("git+https://github.com/morganamilo/paru.git#branch=alpm-v3")
backup=("etc/paru.conf")
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('GPL3')
makedepends=('cargo')
depends=('glibc' 'git' 'pacman')
optdepends=('bat: colored pkgbuild printing' 'devtools: build in chroot and downloading pkgbuilds')
conflicts=('paru')
provides=('paru')
sha256sums=('SKIP')

prepare() {
  cd "$_pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build () {
  cd "$srcdir/$_pkgname"

  if pacman -T pacman-git > /dev/null; then
    _features+="git,"
  fi

  if [[ $(rustc -V) == *"nightly"* ]]; then
    _features+="backtrace,"
  fi

  if [[ $CARCH != x86_64 ]]; then
    export CARGO_PROFILE_RELEASE_LTO=off
  fi

  PARU_VERSION=$pkgver cargo build --frozen --features "${_features:-}" --release --target-dir target
  ./scripts/mkmo locale/
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 target/release/paru "${pkgdir}/usr/bin/paru"
  install -Dm644 paru.conf "${pkgdir}/etc/paru.conf"

  install -Dm644 man/paru.8 "$pkgdir/usr/share/man/man8/paru.8"
  install -Dm644 man/paru.conf.5 "$pkgdir/usr/share/man/man5/paru.conf.5"

  install -Dm644 completions/bash "${pkgdir}/usr/share/bash-completion/completions/paru.bash"
  install -Dm644 completions/fish "${pkgdir}/usr/share/fish/vendor_completions.d/paru.fish"
  install -Dm644 completions/zsh "${pkgdir}/usr/share/zsh/site-functions/_paru"

  install -d "$pkgdir/usr/share/"
  cp -r locale "$pkgdir/usr/share/"
}

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
