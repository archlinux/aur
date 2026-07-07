# Maintainer: smiley <smiley@aur.archlinux.org>

pkgname=cosmic-passphrase-git
_pkgname=cosmic-passphrase
pkgver=r6.gb7bc282
pkgrel=1
pkgdesc='GPG/SSH passphrase caching via the freedesktop Secret Service, for the COSMIC desktop'
arch=('x86_64' 'aarch64')
url='https://github.com/AuthenticSm1les/cosmic-passphrase'
license=('MIT' 'GPL-2.0-only')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
optdepends=(
  'gnupg: pinentry-cosmic is a pinentry program for gpg-agent'
  'openssh: cosmic-ssh-askpass is an SSH_ASKPASS helper for a plain ssh-agent'
  'oo7: freedesktop Secret Service backend passphrases are cached in'
  'gnome-keyring: alternative freedesktop Secret Service backend'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/AuthenticSm1les/cosmic-passphrase.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgname"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
  cargo build --release --frozen
}

package() {
  cd "$_pkgname"
  install -Dm755 target/release/pinentry-cosmic "$pkgdir/usr/bin/pinentry-cosmic"
  install -Dm755 target/release/cosmic-ssh-askpass "$pkgdir/usr/lib/cosmic-ssh-askpass"
}
