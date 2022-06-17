# Maintainer: Jack Mitchell <jack@embed.me.uk>

pkgname=buildkite-agent-bin
pkgver=3.36.1
_commit='79f5ed9aad089fddc33f0665fd8e31f3decca48f'
pkgrel=1
pkgdesc='The Buildkite Agent'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://buildkite.com/docs/agent/v3'
license=('MIT')
options=('!strip' 'staticlibs')
source=("git+https://github.com/buildkite/agent.git#commit=$_commit"
        'buildkite-agent.sysusers'
        'buildkite-agent.tmpfiles')
backup=('etc/buildkite-agent/buildkite-agent.cfg')

source_x86_64=("https://github.com/buildkite/agent/releases/download/v$pkgver/buildkite-agent-linux-amd64-$pkgver.tar.gz")
source_armv7h=("https://github.com/buildkite/agent/releases/download/v$pkgver/buildkite-agent-linux-armhf-$pkgver.tar.gz")
source_aarch64=("https://github.com/buildkite/agent/releases/download/v$pkgver/buildkite-agent-linux-arm64-$pkgver.tar.gz")

sha256sums=('SKIP'
            '60503a6e93dfdb533cd54c82bf9aa3087c907ce8c574b657ca4c4b102badcf71'
            '15f1019081d8255ac6ac121445ae4b39ef5e3f1446a319855c1f7524372366b0')
sha256sums_x86_64=('98d5a1038536da69cf49d2bc6ace438e2b25965803d76cf9319468e8a32c3fb0')
sha256sums_armv7h=('9b1a86f2afdfd1f9eb7188c9626636cc206c09515ce100a3765a7f7f247782e5')
sha256sums_aarch64=('03be8cae93565f7d0790bd05cdb07a90d137c87430da40d9bc35cfa13ecb9716')

package() {
  install -d -m 755 "${pkgdir}/usr/bin"
  cp -dr --no-preserve='ownership' "${srcdir}/buildkite-agent" "${pkgdir}/usr/bin/"

  install -d -m 755 "${pkgdir}/etc/buildkite-agent/hooks"
  install -d -m 755 "${pkgdir}/etc/buildkite-agent/plugins"

  cp -dr --no-preserve='ownership' "${srcdir}/agent/packaging/linux/root/usr/share/buildkite-agent/buildkite-agent.cfg" "${pkgdir}/etc/buildkite-agent/buildkite-agent.cfg"

  cp --no-preserve='ownership' ${srcdir}/agent/packaging/linux/root/usr/share/buildkite-agent/hooks/* "${pkgdir}/etc/buildkite-agent/hooks/"

  install -D -m 644 "${srcdir}/agent/packaging/linux/root/usr/share/buildkite-agent/systemd/buildkite-agent.service" "${pkgdir}/usr/lib/systemd/system/buildkite-agent.service"
  install -D -m 644 "${srcdir}/agent/packaging/linux/root/usr/share/buildkite-agent/systemd/buildkite-agent@.service" "${pkgdir}/usr/lib/systemd/system/buildkite-agent@.service"

  install -D -m 644 "${srcdir}/buildkite-agent.sysusers" "${pkgdir}/usr/lib/sysusers.d/buildkite.conf"
  install -D -m 644 "${srcdir}/buildkite-agent.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/buildkite.conf"
}

# vim: ts=2 sw=2 et:
