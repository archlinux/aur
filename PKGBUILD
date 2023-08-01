# kanidm service, the following still needs clarification or work:
# 
# * check the systemd units on their preconditions, especially nptd, ... 
#   as they are a copy of suse service files from https://build.opensuse.org/package/view_file/home:firstyear:kanidm/kanidm:w
# 
# if somebody wants to maintain or contribute, just drop a note, i will add you.

# Maintainer: cubi <coyote_x@gmx.de>
# Maintainer: soloturn@gmail.com

_basename=kanidm
pkgbase=kanidm
pkgname=(
	$_basename
	$_basename-clients
	$_basename-server
	$_basename-unixd-clients
)
pkgver=1.1.0_beta.13
_realver=${pkgver/_/-}
pkgrel=1
pkgdesc='A identity management service and clients.'
url='https://github.com/kanidm/kanidm'
source=("$_basename-$pkgver.tar.gz::https://github.com/$_basename/$_basename/archive/refs/tags/v${_realver}.tar.gz")
arch=(x86_64 aarch64)
license=(MPL-2.0)
makedepends=(cargo systemd)
sha256sums=('e378ab384cc9bc88e554f7ce7002cc23c7cbac419ea7796f74b67a6e4542b0da')


build () {
  cd ${pkgbase}-$_realver

  export KANIDM_BUILD_PROFILE="release_suse_generic"
  cargo build --locked --release --target-dir target
}

package_kanidm () {
  conflicts=("$_basename-git")
  depends=(
	"kanidm-server=${pkgver}"
	"kanidm-clients=${pkgver}"
	"kanidm-unixd-clients=${pkgver}"
  )
}

package_kanidm-clients () {
  conflicts=("$_basename-clients-git")
  provides=("$_basename-clients")
  depends=("libgit2")
  pkgdesc='kanidm client to interact with kanidm identity management server.'
  backup=("etc/kanidm/config")

  cd ${pkgbase}-$_realver

  install -Dm644 examples/config "${pkgdir}/etc/kanidm/config"

  install -Dm755 target/release/kanidm "${pkgdir}/usr/bin/kanidm"

  install -Dm644 target/release/build/completions/_kanidm "${pkgdir}/usr/share/zsh/site-functions/_kanidm"

  install -Dm644 target/release/build/completions/kanidm.bash "${pkgdir}/usr/share/bash-completion/completions/kanidm.sh"
}

package_kanidm-server () {
  conflicts=("$_basename-server-git")
  provides=("$_basename-server")
  depends=("libgit2")
  pkgdesc='kanidm server for idendity management, supports RADIUS, ssh key management.'
  backup=("etc/kanidm/server.toml")

  cd ${pkgbase}-$_realver

  install -Dm644 examples/server.toml "${pkgdir}/etc/kanidm/server.toml"
  install -Dm644 platform/opensuse/kanidmd.service "${pkgdir}/usr/lib/systemd/system/kanidmd.service"

  install -Dm755 target/release/kanidmd "${pkgdir}/usr/bin/kanidmd"
  install -Dm755 target/release/kanidm-ipa-sync "${pkgdir}/usr/bin/kanidm-ipa-sync"

  install -Dm644 target/release/build/completions/_kanidmd "${pkgdir}/usr/share/zsh/site-functions/_kanidmd"

  install -Dm644 target/release/build/completions/kanidmd.bash "${pkgdir}/usr/share/bash-completion/completions/kanidmd.sh"


  # add web-ui files
  install -dv "${pkgdir}/usr/share/kanidm/ui/"
  cp -r server/web_ui/pkg "${pkgdir}/usr/share/kanidm/ui/"
}

package_kanidm-unixd-clients () {
  conflicts=("$_basename-unixd-clients-git")
  provides=("$_basename-unixd-clients")
  pkgdesc='kanidm localhost resolver to resolve posix identities to a kanidm instance.'
  backup=("etc/kanidm/unixd")

  cd ${pkgbase}-$_realver

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

  install -Dm644 target/release/build/completions/kanidm_ssh_authorizedkeys_direct.bash "${pkgdir}/usr/share/bash-completion/completions/kanidm_ssh_authorizedkeys_direct.sh"
  install -Dm644 target/release/build/completions/kanidm_ssh_authorizedkeys.bash "${pkgdir}/usr/share/bash-completion/completions/kanidm_ssh_authorizedkeys.sh"
  install -Dm644 target/release/build/completions/kanidm_unix.bash "${pkgdir}/usr/share/bash-completion/completions/kanidm_unix.sh"
}
