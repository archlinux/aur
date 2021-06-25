# kanidm service, the following still needs clarification or work:
# 
# * check the systemd units on their preconditions, especially nptd, ... 
#   as they are a copy of suse service files from https://build.opensuse.org/package/view_file/home:firstyear:kanidm/kanidm:w
# * systemd activate and run should be added to package if this is so with other arch packages 
# 
# if somebody wants to maintain or contribute, just drop a note, i will add you.

# Maintainer: cubi <coyote_x@gmx.de>
# Maintainer: soloturn@gmail.com

_basename=kanidm
pkgbase=kanidm
pkgname=($pkgbase-clients $pkgbase-server $pkgbase-unixd-clients)
pkgver=1.1.0_alpha.4
_realver=${pkgver/_/-}
pkgrel=1
pkgdesc='A identity management service and clients.'
url='https://github.com/kanidm/kanidm'
#https://github.com/kanidm/kanidm/archive/refs/tags/v1.1.0-alpha.4.tar.gz
source=("$_basename-$pkgver.tar.gz::https://github.com/$_basename/$_basename/archive/refs/tags/v${pkgver/_/-}.tar.gz")
#source=("$_basename-$pkgver.tar.gz::https://codeload.github.com/kanidm/kanidm/tar.gz/refs/tags/${_realver}")
arch=(x86_64 aarch64)
license=(MPL-2.0)
makedepends=(cargo git)
sha256sums=('998be8d0f4b94d7a4fa5e2e61d9ab55bee954508fed9138ca86dfa6981125c0e')


build () {
  cd ${pkgbase}-$_realver
  export RUSTFLAGS="-Clink-arg=-Wl,-z,relro,-z,now -C debuginfo=2"
  cargo build --release --target-dir target

  # Now, move the completions to easier to install locations.
  mkdir -p target/release/_completions
  cp target/release/build/*/out/_kanidm* target/release/_completions/
  cp target/release/build/*/out/kanidm*.bash target/release/_completions/
}

package_kanidm-clients () {
  conflicts=("$_basename-clients")
  provides=("$_basename-clients")
  pkgdesc='kanidm client to interact with kanidm identity management server.'

  cd ${pkgbase}-$_realver

  install -Dm755 target/release/kanidm "${pkgdir}/usr/bin/kanidm"

  install -Dm644 target/release/_completions/_kanidm "${pkgdir}/usr/share/zsh/site-functions/_kanidm"

  install -Dm644 target/release/_completions/kanidm.bash "${pkgdir}/usr/share/bash-completion/completions/kanidm.sh"
}

package_kanidm-server () {
  conflicts=("$_basename-server")
  provides=("$_basename-server")
  pkgdesc='kanidm server for idendity management, supports RADIUS, ssh key management.'

  cd ${pkgbase}-$_realver

  install -Dm755 target/release/kanidmd "${pkgdir}/usr/bin/kanidmd"
  install -Dm755 target/release/kanidm_badlist_preprocess "${pkgdir}/usr/bin/kanidm_badlist_preprocess"

  install -Dm644 $srcdir/../server.toml "$pkgdir/etc/kanidm/server.toml"

  install -Dm644 $srcdir/../kanidmd.service "$pkgdir/usr/lib/systemd/system/kanidmd.service"

  install -Dm644 target/release/_completions/_kanidmd "${pkgdir}/usr/share/zsh/site-functions/_kanidmd"
  install -Dm644 target/release/_completions/_kanidm_badlist_preprocess "${pkgdir}/usr/share/zsh/site-functions/_kanidm_badlist_preprocess"

  install -Dm644 target/release/_completions/kanidmd.bash "${pkgdir}/usr/share/bash-completion/completions/kanidmd.sh"
  install -Dm644 target/release/_completions/kanidm_badlist_preprocess.bash "${pkgdir}/usr/share/bash-completion/completions/kanidm_badlist_preprocess.sh"
}

package_kanidm-unixd-clients () {
  conflicts=("$_basename-unixd-clients")
  provides=("$_basename-unixd-clients")
  pkgdesc='kanidm localhost resolver to resolve posix identities to a kanidm instance.'

  cd ${pkgbase}-$_realver

  install -Dm755 target/release/libnss_kanidm.so "${pkgdir}/usr/lib/libnss_kanidm.so.2"
  install -Dm755 target/release/libpam_kanidm.so "${pkgdir}/usr/lib/security/pam_kanidm.so"

  install -Dm755 target/release/kanidm_cache_clear "${pkgdir}/usr/bin/kanidm_cache_clear"
  install -Dm755 target/release/kanidm_cache_invalidate "${pkgdir}/usr/bin/kanidm_cache_invalidate"
  install -Dm755 target/release/kanidm_ssh_authorizedkeys "${pkgdir}/usr/bin/kanidm_ssh_authorizedkeys"
  install -Dm755 target/release/kanidm_ssh_authorizedkeys_direct "${pkgdir}/usr/bin/kanidm_ssh_authorizedkeys_direct"
  install -Dm755 target/release/kanidm_unixd "${pkgdir}/usr/bin/kanidm_unixd"
  install -Dm755 target/release/kanidm_unixd_status "${pkgdir}/usr/bin/kanidm_unixd_status"
  install -Dm755 target/release/kanidm_unixd_status "${pkgdir}/usr/bin/kanidm_unixd_tasks"

  install -Dm644 $srcdir/../kanidm-unixd.service "$pkgdir/usr/lib/systemd/system/kanidm-unixd.service"
  install -Dm644 $srcdir/../kanidm-unixd-tasks.service "$pkgdir/usr/lib/systemd/system/kanidm-unixd-tasks.service"

  install -Dm644 target/release/_completions/_kanidm_ssh_authorizedkeys_direct "${pkgdir}/usr/share/zsh/site-functions/_kanidm_ssh_authorizedkeys_direct"
  install -Dm644 target/release/_completions/_kanidm_cache_clear "${pkgdir}/usr/share/zsh/site-functions/_kanidm_cache_clear"
  install -Dm644 target/release/_completions/_kanidm_cache_invalidate "${pkgdir}/usr/share/zsh/site-functions/_kanidm_cache_invalidate"
  install -Dm644 target/release/_completions/_kanidm_ssh_authorizedkeys "${pkgdir}/usr/share/zsh/site-functions/_kanidm_ssh_authorizedkeys"
  install -Dm644 target/release/_completions/_kanidm_unixd_status "${pkgdir}/usr/share/zsh/site-functions/_kanidm_unixd_status"

  install -Dm644 target/release/_completions/kanidm_ssh_authorizedkeys_direct.bash "${pkgdir}/usr/share/bash-completion/completions/kanidm_ssh_authorizedkeys_direct.sh"
  install -Dm644 target/release/_completions/kanidm_cache_clear.bash "${pkgdir}/usr/share/bash-completion/completions/kanidm_cache_clear.sh"
  install -Dm644 target/release/_completions/kanidm_cache_invalidate.bash "${pkgdir}/usr/share/bash-completion/completions/kanidm_cache_invalidate.sh"
  install -Dm644 target/release/_completions/kanidm_ssh_authorizedkeys.bash "${pkgdir}/usr/share/bash-completion/completions/kanidm_ssh_authorizedkeys.sh"
  install -Dm644 target/release/_completions/kanidm_unixd_status.bash "${pkgdir}/usr/share/bash-completion/completions/kanidm_unixd_status.sh"
}

