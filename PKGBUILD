# Maintainer: bendork <bendik.lynghaug@gmail.com>

pkgbase=kanidm-bin
pkgname=(kanidm-clients-bin kanidm-unixd-clients-bin kanidm-server-bin kanidm-bin)
pkgver=1.10.4
pkgrel=5
pkgdesc='Modern identity management platform (prebuilt binaries)'
arch=(x86_64 aarch64)
url='https://kanidm.com'
license=('MPL-2.0')
options=(!debug !strip)

_publisher=bendik/kanidm

source_x86_64=("kanidm-v${pkgver}-x86_64-linux-gnu.tar.gz::https://github.com/${_publisher}/releases/download/v${pkgver}-bin/kanidm-v${pkgver}-x86_64-linux-gnu.tar.gz")
source_aarch64=("kanidm-v${pkgver}-aarch64-linux-gnu.tar.gz::https://github.com/${_publisher}/releases/download/v${pkgver}-bin/kanidm-v${pkgver}-aarch64-linux-gnu.tar.gz")
sha256sums_x86_64=('8b5fb92f9346671825bc3f2ca4eb0bc3386c0629989b1b47136a1dd46fe02005')
sha256sums_aarch64=('e295b6db80e59f97e2b076d9ef0d574339f67a46875cf7a9dda3c262188ccbab')

_srcdir() {
  if [[ $CARCH == x86_64 ]]; then echo "kanidm-v${pkgver}-x86_64-linux-gnu"
  else echo "kanidm-v${pkgver}-aarch64-linux-gnu"; fi
}

package_kanidm-clients-bin() {
  pkgdesc='Kanidm command-line client (prebuilt binaries)'
  depends=(glibc gcc-libs openssl sqlite)
  provides=(kanidm-clients "kanidm-clients=${pkgver}")
  conflicts=(kanidm-clients)
  local src; src=$(_srcdir)
  install -Dm755 "${srcdir}/${src}/bin/kanidm" \
                 "${pkgdir}/usr/bin/kanidm"
  install -Dm755 "${srcdir}/${src}/bin/kanidm_ssh_authorizedkeys_direct" \
                 "${pkgdir}/usr/bin/kanidm_ssh_authorizedkeys_direct"
  install -Dm644 "${srcdir}/${src}/config/config.example" \
                 "${pkgdir}/etc/kanidm/config.example"
}

package_kanidm-unixd-clients-bin() {
  pkgdesc='Kanidm UNIX integration daemons (prebuilt; PAM/NSS modules not included)'
  depends=(glibc gcc-libs openssl sqlite pam dbus libcap tpm2-tss systemd-libs)
  provides=(kanidm-unixd-clients "kanidm-unixd-clients=${pkgver}")
  conflicts=(kanidm-unixd-clients)
  local src; src=$(_srcdir)
  install -Dm755 "${srcdir}/${src}/bin/kanidm_unixd" \
                 "${pkgdir}/usr/bin/kanidm_unixd"
  install -Dm755 "${srcdir}/${src}/bin/kanidm_unixd_tasks" \
                 "${pkgdir}/usr/bin/kanidm_unixd_tasks"
  install -Dm755 "${srcdir}/${src}/bin/kanidm_ssh_authorizedkeys" \
                 "${pkgdir}/usr/bin/kanidm_ssh_authorizedkeys"
  install -Dm755 "${srcdir}/${src}/bin/kanidm-unix" \
                 "${pkgdir}/usr/bin/kanidm-unix"
  install -Dm644 "${srcdir}/${src}/systemd/kanidm-unixd.service" \
                 "${pkgdir}/usr/lib/systemd/system/kanidm-unixd.service"
  install -Dm644 "${srcdir}/${src}/systemd/kanidm-unixd-tasks.service" \
                 "${pkgdir}/usr/lib/systemd/system/kanidm-unixd-tasks.service"
  install -Dm644 "${srcdir}/${src}/config/unixd.example" \
                 "${pkgdir}/etc/kanidm/unixd.example"
}

package_kanidm-server-bin() {
  pkgdesc='Kanidm server daemon (prebuilt binary)'
  depends=(glibc gcc-libs openssl sqlite tpm2-tss systemd-libs libcap)
  provides=(kanidm-server "kanidm-server=${pkgver}")
  conflicts=(kanidm-server)
  local src; src=$(_srcdir)
  install -Dm755 "${srcdir}/${src}/bin/kanidmd" \
                 "${pkgdir}/usr/bin/kanidmd"
  install -Dm644 "${srcdir}/${src}/systemd/kanidmd.service" \
                 "${pkgdir}/usr/lib/systemd/system/kanidmd.service"
  install -Dm644 "${srcdir}/${src}/config/server.toml.example" \
                 "${pkgdir}/etc/kanidm/server.toml.example"
  # Web UI static assets. kanidmd is built with the release_linux profile,
  # which expects these at /usr/share/kanidm/ui/hpkg; without them the daemon
  # fails to start when serving the web UI.
  install -d "${pkgdir}/usr/share/kanidm/ui"
  cp -r "${srcdir}/${src}/share/kanidm/ui/hpkg" \
        "${pkgdir}/usr/share/kanidm/ui/hpkg"
  chmod -R u=rwX,go=rX "${pkgdir}/usr/share/kanidm/ui/hpkg"
}

package_kanidm-bin() {
  pkgdesc='Kanidm identity management platform (meta package, prebuilt binaries)'
  depends=(kanidm-clients-bin kanidm-unixd-clients-bin kanidm-server-bin)
  provides=(kanidm "kanidm=${pkgver}")
  conflicts=(kanidm)
  # meta package - no files
}
