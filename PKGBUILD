# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=aotopsy-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="Static analyzer for Flutter/Dart AOT snapshots — recovers function names, class hierarchies, call graphs, and behavioral signals from libapp.so"
arch=('x86_64' 'aarch64')
url="https://github.com/BroNils/aotopsy"
license=('BSD-3-Clause')
provides=('aotopsy')
conflicts=('aotopsy')
depends=()
options=('!debug')
source_x86_64=("${pkgname}-${pkgver}-linux-amd64.tar.gz::https://github.com/BroNils/aotopsy/releases/download/v${pkgver}/aotopsy_v${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('a16d5c9f79f34a4cdff5565128f58d0d97d7b1de058b395358f77dfff817ba45')
source_aarch64=("${pkgname}-${pkgver}-linux-arm64.tar.gz::https://github.com/BroNils/aotopsy/releases/download/v${pkgver}/aotopsy_v${pkgver}_linux_arm64.tar.gz")
sha256sums_aarch64=('21e5f72f081ec68014a535675e1a2fe63b755f394a969341af3bddf7339c642d')

latestver() {
    curl -fsSL "https://api.github.com/repos/BroNils/aotopsy/releases/latest" |
    jq -r '.tag_name // empty' | sed 's/^v//'
}

package() {
    # Upstream layout is binary + ghidra_scripts/ + ida_scripts/ side by side:
    # both integrations discover scripts relative to os.Executable(), so the
    # tree must stay together. /usr/lib is the FHS-valid home for it.
    install -Dm755 aotopsy "$pkgdir/usr/lib/aotopsy/aotopsy"
    cp -r ghidra_scripts ida_scripts "$pkgdir/usr/lib/aotopsy/"
    install -d "$pkgdir/usr/bin"
    ln -s ../lib/aotopsy/aotopsy "$pkgdir/usr/bin/aotopsy"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
