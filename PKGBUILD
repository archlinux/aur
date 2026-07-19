# Maintainer: Christopher Kreft <email@christopherkreft.de>

pkgname=snclient-bin
pkgver=0.44
pkgrel=1
pkgdesc='General-purpose monitoring agent supporting REST, NRPE and Prometheus'
arch=('x86_64' 'aarch64' 'i686')
url='https://github.com/ConSol-Monitoring/snclient'
license=('MIT')
depends=('iputils' 'openssl' 'systemd' 'util-linux')
optdepends=('logrotate: rotate SNClient log files'
            'prometheus-node-exporter: node_exporter support')
provides=("snclient=${pkgver}")
conflicts=('snclient')
backup=('etc/logrotate.d/snclient'
        'etc/snclient/snclient.ini')
options=('!debug' '!strip')
install=snclient.install
source_x86_64=("snclient-${pkgver}-linux-x86_64.rpm::${url}/releases/download/v${pkgver}/snclient-${pkgver}-linux-x86_64.rpm")
source_aarch64=("snclient-${pkgver}-linux-aarch64.rpm::${url}/releases/download/v${pkgver}/snclient-${pkgver}-linux-aarch64.rpm")
source_i686=("snclient-${pkgver}-linux-i686.rpm::${url}/releases/download/v${pkgver}/snclient-${pkgver}-linux-i386.rpm")
noextract=("snclient-${pkgver}-linux-x86_64.rpm"
           "snclient-${pkgver}-linux-aarch64.rpm"
           "snclient-${pkgver}-linux-i686.rpm")
sha256sums_x86_64=('d9682e1bb44aa102473b0bdea4f00decb8de99087c6f8519f663469b55616179')
sha256sums_aarch64=('8b730c48c329869bf279b1bb03dbe2b2ba656e4f25b30e56f05450d51b610911')
sha256sums_i686=('c6b4c16e3d75ba3361c7b7f41e35c742d41b95e6ae1a2588812a2d0f8b6d5548')

prepare() {
  mkdir -p completions rpm-root
  bsdtar -xf "snclient-${pkgver}-linux-${CARCH}.rpm" -C rpm-root
  sed -i 's|/usr/lib/snclient/node_exporter|/usr/bin/prometheus-node-exporter|' \
    rpm-root/etc/snclient/snclient.ini

  rpm-root/usr/bin/snclient completion bash > completions/snclient.bash
  rpm-root/usr/bin/snclient completion fish > completions/snclient.fish
  rpm-root/usr/bin/snclient completion zsh > completions/snclient.zsh
}

package() {
  install -Dm755 rpm-root/usr/bin/snclient "${pkgdir}/usr/bin/snclient"

  install -Dm600 rpm-root/etc/snclient/snclient.ini "${pkgdir}/etc/snclient/snclient.ini"
  install -Dm644 rpm-root/etc/logrotate.d/snclient "${pkgdir}/etc/logrotate.d/snclient"

  install -Dm644 rpm-root/lib/systemd/system/snclient.service \
    "${pkgdir}/usr/lib/systemd/system/snclient.service"
  install -Dm644 rpm-root/lib/sysusers.d/snclient.conf \
    "${pkgdir}/usr/lib/sysusers.d/snclient.conf"
  install -Dm644 rpm-root/lib/tmpfiles.d/snclient.conf \
    "${pkgdir}/usr/lib/tmpfiles.d/snclient.conf"

  install -Dm644 rpm-root/usr/share/man/man1/snclient.1.gz \
    "${pkgdir}/usr/share/man/man1/snclient.1.gz"
  install -Dm644 rpm-root/usr/share/man/man8/snclient.8.gz \
    "${pkgdir}/usr/share/man/man8/snclient.8.gz"
  install -Dm644 completions/snclient.bash \
    "${pkgdir}/usr/share/bash-completion/completions/snclient"
  install -Dm644 completions/snclient.fish \
    "${pkgdir}/usr/share/fish/vendor_completions.d/snclient.fish"
  install -Dm644 completions/snclient.zsh \
    "${pkgdir}/usr/share/zsh/site-functions/_snclient"
  install -Dm644 rpm-root/usr/share/snclient/README.md \
    "${pkgdir}/usr/share/doc/snclient/README"
  install -Dm644 rpm-root/usr/share/snclient/LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
