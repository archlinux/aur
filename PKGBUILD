# Maintainer: Javier Tia <floss@jetm.me>
# Based on the AUR pam_rssh PKGBUILD by peelz <peelz.dev+arch@gmail.com>

# pam_rssh with one change: a security-key (sk-ecdsa / sk-ed25519) signature
# whose U2F flags byte has the user-presence bit clear is rejected, so sudo
# through ssh-agent needs a physical touch even when the agent signs without
# one. See touch-required.patch. Both sources are pinned to commits, as in the
# AUR package; bump _commit and _ssh_agent_rs_commit together with pkgver.

_commit="e8dd046c423f85df266c23bcc3d7033bfee81255"
_ssh_agent_rs_commit="802b94ccf2e00ac33a3863300d0769f02b62d807"
_upstream="pam_rssh"
pkgname="pam_rssh-jetm"
pkgver="1.2.1"
pkgrel="1"
pkgdesc="A PAM module that provides ssh-agent based authentication, requiring user presence for security keys"
url="https://github.com/z4yx/pam_rssh"
arch=("x86_64")
license=("MIT")
depends=(
  "openssl"
  "pam"
)
makedepends=(
  "git"
  "cargo"
)
provides=("pam_rssh")
conflicts=("pam_rssh")
source=(
  "${_upstream}::git+https://github.com/z4yx/pam_rssh.git#commit=${_commit}"
  "ssh-agent.rs::git+https://github.com/z4yx/ssh-agent.rs.git#commit=${_ssh_agent_rs_commit}"
  "touch-required.patch"
)
sha256sums=(
  "SKIP"
  "SKIP"
  "defee089c443b132fa168c11eb9d88f49f250540dc4934e710dd800ae3a36f92"
)

prepare() {
  cd "${srcdir}/${_upstream}"
  git submodule init
  git config submodule.dep/ssh-agent.rs.url "${srcdir}/ssh-agent.rs"
  git -c protocol.allow=never -c protocol.file.allow=always submodule update
  patch -Np1 -i "${srcdir}/touch-required.patch"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${_upstream}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${srcdir}/${_upstream}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # The sshagent_* tests talk to a live ssh-agent holding keys, which a build
  # chroot does not have; every other unit test runs.
  cargo test --frozen --all-features -- --skip sshagent_
}

package() {
  cd "${srcdir}/${_upstream}"
  install -Dm0755 target/release/libpam_rssh.so \
    "${pkgdir}/usr/lib/security/pam_rssh.so"
  install -Dm0644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm0644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
