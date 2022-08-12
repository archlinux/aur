# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

pkgname=failing-disk-reporter
pkgver=0.5.1
pkgrel=1
pkgdesc="Failing Disk Reporter (FDR): Get a report on Matrix or Slack when a drive (HDD or SDD) is failing"
arch=("x86_64")
url="https://git.sr.ht/~vejnar/failing-disk-reporter"
license=("MPLv2")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~vejnar/failing-disk-reporter/archive/v${pkgver}.tar.gz")
sha1sums=('5d915dcd37b0d024ad09bceb28a48a2c96d62915')

build() {
    cd "$srcdir/failing-disk-reporter-${pkgver}"
    export CGO_ENABLED=0
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build ./cmd/...
}

package() {
    cd "$srcdir/failing-disk-reporter-${pkgver}"
    install -Dm 755 fdr -t "${pkgdir}/usr/bin"
    install -Dm 644 config/fdr.toml -t "${pkgdir}/etc"
    install -Dm 644 systemd/failing-disk-reporter.service -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm 644 systemd/failing-disk-reporter.timer -t "${pkgdir}/usr/lib/systemd/system"
}
