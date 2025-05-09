# kanidm service, the following still needs clarification or work:
# 
# * check the systemd units on their preconditions, especially nptd, ... 
#   as they are a copy of suse service files from https://build.opensuse.org/package/view_file/home:firstyear:kanidm/kanidm:w
# 
# if somebody wants to maintain or contribute, just drop a note, i will add you.

# Maintainer: cubi <coyote_x@gmx.de>
# Maintainer: soloturn@gmail.com

_basename=kanidm
pkgbase=kanidm-git
pkgname=(
	$_basename-git
	$_basename-clients-git
	$_basename-server-git
	$_basename-unixd-clients-git
)
pkgver=1.7.0.dev.r11.g036f069c2
pkgrel=1
pkgdesc='A identity management service and clients.'
url='https://github.com/kanidm/kanidm'
source=("$pkgbase::git+https://github.com/${_basename}/${_basename}.git")
arch=(x86_64 aarch64)
license=(MPL-2.0)
makedepends=(cargo systemd clang tpm2-tss lld)
sha256sums=(SKIP)
# ring won't compile on x86_64 with link-time-optimizations enabled:
# https://github.com/briansmith/ring/issues/1444
options=(!lto)

pkgver() {
  cd "$pkgbase"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build () {
  cd "$pkgbase"

  export KANIDM_BUILD_PROFILE="release_linux"
  cargo build --release --target-dir target \
        --features tpm,unix \
        --package daemon \
        --package kanidm-ipa-sync \
        --package kanidm_tools \
        --package kanidm_unix_int \
        --package nss_kanidm \
        --package pam_kanidm
}


package_kanidm-git () {
  conflicts=("$_basename-bin")
  depends=(
	"kanidm-server-git=${pkgver}"
	"kanidm-clients-git=${pkgver}"
	"kanidm-unixd-clients-git=${pkgver}"
  )
}


package_kanidm-clients-git () {
  conflicts=("$_basename-clients-bin")
  provides=("$_basename-clients")
  depends=("libgit2")
  pkgdesc='kanidm client to interact with kanidm identity management server.'
  backup=("etc/kanidm/config")

  cd "$pkgbase"

  install -Dm644 examples/config "${pkgdir}/etc/kanidm/config"

  install -Dm755 target/release/kanidm "${pkgdir}/usr/bin/kanidm"

  install -Dm644 target/release/build/completions/_kanidm "${pkgdir}/usr/share/zsh/site-functions/_kanidm"

  install -Dm644 target/release/build/completions/kanidm.bash "${pkgdir}/usr/share/bash-completion/completions/kanidm"

  install -Dm644 target/release/build/completions/kanidm.fish "${pkgdir}/usr/share/fish/completions/kanidm.fish"
}

package_kanidm-server-git () {
  conflicts=("$_basename-server-bin")
  provides=("$_basename-server")
  depends=("libgit2")
  pkgdesc='kanidm server for idendity management, supports RADIUS, ssh key management.'
  backup=("etc/kanidm/server.toml")

  cd "$pkgbase"

  install -Dm644 examples/server.toml "${pkgdir}/etc/kanidm/server.toml"
  install -Dm644 platform/opensuse/kanidmd.service "${pkgdir}/usr/lib/systemd/system/kanidmd.service"

  install -Dm755 target/release/kanidmd "${pkgdir}/usr/bin/kanidmd"
  install -Dm755 target/release/kanidm-ipa-sync "${pkgdir}/usr/bin/kanidm-ipa-sync"

  install -Dm644 target/release/build/completions/_kanidmd "${pkgdir}/usr/share/zsh/site-functions/_kanidmd"

  install -Dm644 target/release/build/completions/kanidmd.bash "${pkgdir}/usr/share/bash-completion/completions/kanidmd"

  install -Dm644 target/release/build/completions/kanidmd.fish "${pkgdir}/usr/share/fish/completions/kanidmd.fish"

  # add web-ui files
  install -dv "${pkgdir}/usr/share/kanidm/ui/hpkg"
  cp -r server/core/static/* "${pkgdir}/usr/share/kanidm/ui/hpkg"
}

package_kanidm-unixd-clients-git () {
  conflicts=("$_basename-unixd-clients-bin")
  provides=("$_basename-unixd-clients")
  pkgdesc='kanidm localhost resolver to resolve posix identities to a kanidm instance.'
  backup=("etc/kanidm/unixd")

  cd "$pkgbase"

  install -Dm644 examples/unixd "${pkgdir}/etc/kanidm/unixd"
  install -Dm644 platform/opensuse/kanidm-unixd.service "${pkgdir}/usr/lib/systemd/system/kanidm-unixd.service"
  install -Dm644 platform/opensuse/kanidm-unixd-tasks.service "${pkgdir}/usr/lib/systemd/system/kanidm-unixd-tasks.service"

  install -Dm755 target/release/libnss_kanidm.so "${pkgdir}/usr/lib/libnss_kanidm.so.2"
  install -Dm755 target/release/libpam_kanidm.so "${pkgdir}/usr/lib/security/pam_kanidm.so"

  install -Dm755 target/release/kanidm_ssh_authorizedkeys "${pkgdir}/usr/bin/kanidm_ssh_authorizedkeys"
  install -Dm755 target/release/kanidm_ssh_authorizedkeys_direct "${pkgdir}/usr/bin/kanidm_ssh_authorizedkeys_direct"
  install -Dm755 target/release/kanidm-unix "${pkgdir}/usr/bin/kanidm-unix"
  install -Dm755 target/release/kanidm_unixd "${pkgdir}/usr/bin/kanidm_unixd"
  install -Dm755 target/release/kanidm_unixd_tasks "${pkgdir}/usr/bin/kanidm_unixd_tasks"

  install -Dm644 target/release/build/completions/_kanidm_ssh_authorizedkeys_direct "${pkgdir}/usr/share/zsh/site-functions/_kanidm_ssh_authorizedkeys_direct"
  install -Dm644 target/release/build/completions/_kanidm_ssh_authorizedkeys "${pkgdir}/usr/share/zsh/site-functions/_kanidm_ssh_authorizedkeys"
  install -Dm644 target/release/build/completions/_kanidm_unix "${pkgdir}/usr/share/zsh/site-functions/_kanidm_unix"

  install -Dm644 target/release/build/completions/kanidm_ssh_authorizedkeys_direct.bash "${pkgdir}/usr/share/bash-completion/completions/kanidm_ssh_authorizedkeys_direct"
  install -Dm644 target/release/build/completions/kanidm_ssh_authorizedkeys.bash "${pkgdir}/usr/share/bash-completion/completions/kanidm_ssh_authorizedkeys"
  install -Dm644 target/release/build/completions/kanidm_unix.bash "${pkgdir}/usr/share/bash-completion/completions/kanidm_unix"

  install -Dm644 target/release/build/completions/kanidm_ssh_authorizedkeys_direct.fish "${pkgdir}/usr/share/fish/completions/kanidm_ssh_authorizedkeys_direct.fish"
  install -Dm644 target/release/build/completions/kanidm_ssh_authorizedkeys.fish "${pkgdir}/usr/share/fish/completions/kanidm_ssh_authorizedkeys.fish"
  install -Dm644 target/release/build/completions/kanidm_unix.fish "${pkgdir}/usr/share/fish/completions/kanidm_unix.fish"
}
