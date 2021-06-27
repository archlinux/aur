# Maintainer: Walter - "bWVAd2FsdGVyY2FzYW5vdmEueHljCg==" - base64
# Contributor: Vasia Novikov <n1dr+cmarchlinux@yaaandex.com> (replace "aaa" with "a")
pkgname="rua-git"
_pkgname="rua"
pkgver=0.18.1.498.ge0e253f
pkgrel=1
pkgdesc="Build tool for Arch Linux providing control, review and jailed build options"
arch=("i686" "x86_64")
url="https://github.com/vn971/rua"
license=("GPL3")
depends=("pacman" "bubblewrap" "xz")
optdepends=(
  'bubblewrap-suid: version of bubblewrap that works on linux-hardened kernel'
  'shellcheck: check PKGBUILD scripts, taking care of special variables'
  'sudo: package installation can be done via sudo, if convenient'
)
makedepends=("rust" "cargo" "git")
provides=("rua")
conflicts=("rua")
source=("$_pkgname::git+https://github.com/vn971/rua.git")
sha256sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  mkdir -p target/completions
  COMPLETIONS_DIR=target/completions \
    RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 target/release/$_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 target/completions/rua.bash "${pkgdir}/usr/share/bash-completion/completions/rua.bash"
  install -Dm644 target/completions/rua.fish "${pkgdir}/usr/share/fish/completions/rua.fish"
  install -Dm644 target/completions/_rua "${pkgdir}/usr/share/zsh/functions/Completion/Linux/_rua"
}
