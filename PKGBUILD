# Maintainer: brokenpip3 <brokenpip3[at]gmail[dot]com>
# Maintainer: Thomas Labarussias <issif+aur@gadz.org>
# https://github.com/brokenpip3/my-pkgbuilds
# Contributor: Kris Nóva R.I.P. <kris@nivenly.com>

pkgbase=falco-bin
pkgname=falco-bin
provides=(falco)
conflicts=(falco)
backup=('etc/falco/falco_rules.yaml'  'etc/falco/falco.yaml')
pkgver=0.40.0
pkgrel=1
pkgdesc="Cloud native runtime security. Modern ebpf and config files"
arch=(x86_64)
license=(Apache)
optdepends=(
    "falco-probe-ebpf: ebpf probe"
    "falco-module-dkms: dkms module"
    "falcoctl: administrative tooling for Falco"
    "falcosidekick: connect Falco to your ecosystem"
)
url="https://github.com/falcosecurity/falco"
_rules_tag="falco-rules-3.2.0"
source_x86_64=(
    "https://download.falco.org/packages/bin/${arch}/falco-${pkgver}-x86_64.tar.gz"
    "git+https://github.com/falcosecurity/rules#tag=${_rules_tag}"
    "falco-modern-bpf.service"
)
sha256sums_x86_64=('e9f14b04f9675ce6a168f62efeee4e7365cdc07747c9f8deeda240f76e8b1f55'
                   'e2c117951ccbab473569894bd22aa95aac3704e52aefd7023563806eb9f5e98c'
                   '0709add709184db8a275a5c7c6b6b4123b6dc418e72f7c9d4ab6dcc1d5ab2644')
install="falco.install"

package() {
    install -Dm644 falco-${pkgver}-${arch}/etc/falco/falco.yaml "${pkgdir}/etc/falco/falco.yaml"
    install -Dm755 falco-${pkgver}-${arch}/usr/bin/falco "${pkgdir}/usr/bin/falco"
    install -Dm644 "${srcdir}/rules/rules/falco_rules.yaml" "${pkgdir}/etc/falco/falco_rules.yaml"
    install -d "${pkgdir}/etc/falco/rules.d"
    sed -i 's#probe: ${HOME}/.falco/falco-bpf.o#probe: /usr/share/falco/falco-bpf.o#' "${pkgdir}/etc/falco/falco.yaml"
    install -Dm644 "${srcdir}/falco-modern-bpf.service" "${pkgdir}/usr/lib/systemd/system/falco-modern-bpf.service"
}
