# Maintainer: Jack Mitchell <jack@embed.me.uk>

pkgname=buildkite-agent-bin
pkgver=3.42.0
pkgrel=1
pkgdesc='The Buildkite Agent'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://buildkite.com/docs/agent/v3'
license=('MIT')
options=('!strip' 'staticlibs')
source=("git+https://github.com/buildkite/agent.git#tag=v$pkgver"
        'buildkite-agent.sysusers'
        'buildkite-agent.tmpfiles')
backup=('etc/buildkite-agent/buildkite-agent.cfg')

source_x86_64=("https://github.com/buildkite/agent/releases/download/v$pkgver/buildkite-agent-linux-amd64-$pkgver.tar.gz")
source_armv7h=("https://github.com/buildkite/agent/releases/download/v$pkgver/buildkite-agent-linux-armhf-$pkgver.tar.gz")
source_aarch64=("https://github.com/buildkite/agent/releases/download/v$pkgver/buildkite-agent-linux-arm64-$pkgver.tar.gz")

sha256sums=('SKIP'
            '60503a6e93dfdb533cd54c82bf9aa3087c907ce8c574b657ca4c4b102badcf71'
            '15f1019081d8255ac6ac121445ae4b39ef5e3f1446a319855c1f7524372366b0')
sha256sums_x86_64=('2a1b36f02f46ecc445fb8b9839de737d3c94a8f6bc7fdff8981266ca690f3551')
sha256sums_armv7h=('f750df714f1f4bd5e54720b6cf51ea92e85a7e4188ac0b5722e6c55b5b27b709')
sha256sums_aarch64=('f88bda679e465e2bbc062d4900af4439ace66e1566a99ef4007788c63b15eeee')

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
