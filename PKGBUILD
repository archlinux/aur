# Maintainer: brokenpip3 <brokenpip3[at]gmail[dot]com>
# Maintainer: Thomas Labarussias <issif+aur@gadz.org>
# https://github.com/brokenpip3/my-pkgbuilds
# Contributor: Kris Nóva R.I.P. <kris@nivenly.com>

pkgbase=falco-bin
pkgname=falco-bin
provides=(falco)
conflicts=(falco)
backup=('etc/falco/falco_rules.yaml'  'etc/falco/falco.yaml')
pkgver=0.37.1
pkgrel=3
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
_rules_tag="falco-rules-3.0.1"
source_x86_64=(
    "https://download.falco.org/packages/bin/${arch}/falco-${pkgver}-x86_64.tar.gz"
    "git+https://github.com/falcosecurity/rules#tag=${_rules_tag}"
    "falco-modern-bpf.service"
)
sha256sums_x86_64=('8d441495f72489be1bcab1ce8476ae26007fe2063c8053e8082b264066c46f25'
                   'b33034564398503bac9cb0088759710ddf176e64c249dfcdd47d9310f0692c6e'
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
