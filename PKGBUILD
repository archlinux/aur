# Maintainer: Keiran <keircn@proton.me>
# Fork of paru by Morgan <morganamilo@archlinux.org>

pkgname=paru-key-git
pkgver=2.1.0.r1277.g789bead
pkgrel=1
pkgdesc='Feature packed AUR helper (custom fork with QOL improvements)'
url='https://github.com/keircn/paru'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('GPL-3.0-or-later')
makedepends=('cargo' 'git')
depends=('git' 'pacman' 'libalpm.so>=14')
optdepends=('bat: colored pkgbuild printing' 
            'devtools: build in chroot and downloading pkgbuilds')
provides=('paru')
conflicts=('paru' 'paru-bin' 'paru-git')
backup=('etc/paru.conf')
source=("$pkgname::git+https://github.com/keircn/paru.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  if git describe --long --tags --abbrev=7 2>/dev/null | grep -q '^v'; then
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf "2.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

prepare() {
  cd "$pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
  cd "$pkgname"

  if pacman -T pacman-git > /dev/null; then
    _features+="git,"
  fi

  if [[ $CARCH != x86_64 ]]; then
    export CARGO_PROFILE_RELEASE_LTO=off
  fi

  cargo build --frozen --features "${_features:-}" --release --target-dir target
  
  if [[ -x scripts/mkmo ]]; then
    ./scripts/mkmo po/
  fi
}

package() {
  cd "$pkgname"

  install -Dm755 target/release/paru "${pkgdir}/usr/bin/paru"
  
  install -Dm644 paru.conf "${pkgdir}/etc/paru.conf"

  install -Dm644 man/paru.8 "$pkgdir/usr/share/man/man8/paru.8"
  install -Dm644 man/paru.conf.5 "$pkgdir/usr/share/man/man5/paru.conf.5"

  install -Dm644 completions/bash "${pkgdir}/usr/share/bash-completion/completions/paru.bash"
  install -Dm644 completions/fish "${pkgdir}/usr/share/fish/vendor_completions.d/paru.fish"
  install -Dm644 completions/zsh "${pkgdir}/usr/share/zsh/site-functions/_paru"

  if [[ -d locale ]]; then
    install -d "$pkgdir/usr/share/"
    cp -r locale "$pkgdir/usr/share/"
  fi
}
