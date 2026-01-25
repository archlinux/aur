# Maintainer: Justin Suess <utilityemal77@gmail.com>
pkgname=pinpam-git
pkgver=r50.86a68c3
pkgrel=1
pkgdesc="TPM2 backed PAM module and utility for pin-based authentication"
arch=('x86_64')
url="https://github.com/RazeLighter777/pinpam"
license=('GPL-3.0')
depends=('tpm2-tss' 'pam' 'openssl' 'gcc-libs' 'gcc')
makedepends=('git' 'rust' 'cargo' 'coreutils' 'gcc')
provides=("${pkgname%-git}")
conflict=("${pkgname%-git}")
_git_folder="${pkgname%-git}"
source=("${_git_folder}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_git_folder}"
  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_git_folder}"
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${_git_folder}"
  export CARGO_TARGET_DIR=./target
  cargo build --frozen --release --all-features
}

check() {
  cd "${_git_folder}"
  cargo test --frozen --all-features
}

generate_arch_default_policy() {
  cat << EOF
# Default pinpam policy for Arch Linux
pin_min_length=4
pin_max_length=6
pin_lockout_max_attempts=5
pinutil_path="/usr/bin/pinutil"
EOF
}

package() {
  cd "${_git_folder}"
  generate_arch_default_policy > ./policy.conf
  install -Dm755 "target/release/pinutil" -t "$pkgdir/usr/bin/"
  install -Dm644 target/release/libpinpam.so -t "$pkgdir/usr/lib/security/"
  install -Dm644 ./policy.conf -t "$pkgdir/etc/pinpam/"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-GPL-3.0"
  # setuid bit for pinutil, so it can access the TPM device
  chmod 4755 "${pkgdir}/usr/bin/pinutil"
}
