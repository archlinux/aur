# Maintainer: Shalygin Konstantin (k0ste@opentech.ru)

pkgname='irq-tools'
pkgver='0.1'
pkgrel='1'
pkgdesc='irq-tune for set smp affinity and irqstat for better watch /proc/interrupts, designet for NUMA systems'
arch=('any')
url="https://github.com/k0ste/${pkgname}"
license=('GPL')
depends=('python2' 'numactl')
makedepends=('git' 'patch')
source=("irq-tune::git+https://github.com/hep-gc/irq-tune"
	"irqstat::git+https://github.com/lanceshelton/irqstat"
	"irq-tune.patch"
	"irqstat.patch"
	"irqtune.service"
	"irqtune-auto.service")
sha256sums=('SKIP'
	    'SKIP'
	    'b83afbfc604d7195cf75b25f0bf74eb3bb7a8e545736ccda589283e74b291dea'
	    '7cc83179add66cf0bd4a012dcd5cf908944359f0b2b76a9d0fdb08cb3d3a2131'
	    '3a7575d6ec501b44878cce38d95effd99dfa8d43a8706abfffbed43a16905321'
	    '6121ebabc8c6b965fded2944c4ddce2bff79d78eb3661b7260f065a99c3b9725')
install="${pkgname}.install"

prepare() {
  pushd "${srcdir}"
  cd "irq-tune"
  patch -p1 -i "${srcdir}/irq-tune.patch"
  popd
  cd "irqstat"
  patch -p1 -i "${srcdir}/irqstat.patch"
}

package() {
  pushd "${srcdir}"
  install -Dm755 "irq-tune/irq-tune.py" "${pkgdir}/usr/bin/irq-tune"
  install -Dm644 "irq-tune/irq.json" "${pkgdir}/etc/irq-tune/irq.json"
  install -Dm644 "irq-tune/irq-eth.json.sample" "${pkgdir}/etc/irq-tune/irq-eth.json.sample"
  install -Dm755 "irqstat/irqstat" "${pkgdir}/usr/bin/irqstat"
  install -Dm644 "irqtune.service" "${pkgdir}/usr/lib/systemd/system/irqtune.service"
  install -Dm644 "irqtune-auto.service" "${pkgdir}/usr/lib/systemd/system/irqtune-auto.service"
  install -Dm644 "irqstat/LICENSE" "$pkgdir/usr/share/doc/${pkgname}/LICENSE"
  install -Dm644 "irq-tune/README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  popd
}
