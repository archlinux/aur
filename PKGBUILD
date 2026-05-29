# Maintainer: Mark Collins <tera_1225 hat hotmail ðot com>
# Partially adapted from https://github.com/wasta-linux/lameta-snap
pkgname=lameta
pkgver=3.0.18_beta
_upstream_pkgver="${pkgver//_/-}"
_electron=electron37
pkgrel=1
pkgdesc="The Metadata Editor for Transparent Archiving of language document materials"
arch=('x86_64')
url="https://github.com/onset/lameta"
license=('MIT')
depends=(
    bash
    "$_electron"
    glibc
    libgcc
    nodejs
)
makedepends=(
    asar
    npm
    yarn
)
source=(
  "${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${_upstream_pkgver}.tar.gz"
    "${pkgname}.desktop"
  'no_node_pin.patch'
)
sha256sums=('03e82fa34ab04897472fc4a4dbb652842be99ff4ddfd54c9f7aedf2d1911df23'
            '874e1acc986076e9c876c6ccd2efc7ee0dcda322733c018fb8e3d0bf010b8791'
            '013659645d17441f98ed7a8bfcf3a1ef4385aeeb84ddc76e2a59afea42a2da44')

prepare() {
    cd "${srcdir}/${pkgname}-${_upstream_pkgver}"
    echo -e 'logFilters:\n  - code: "YN0013"\n    level: "discard"' >> .yarnrc.yml
    echo "Applying patch to unpin node and yarn versions"
    patch --forward --strip=1 --input="${srcdir}/no_node_pin.patch"
}

build() {
    cd "${srcdir}/${pkgname}-${_upstream_pkgver}"
    yarn
    yarn install --frozen-lockfile
    yarn build
    yarn strings:compile
    ./node_modules/.bin/electron-builder \
      --linux \
      --x64 \
      --dir \
      --config.electronDist=/usr/lib/"$_electron"
}

package() {
    cd "${srcdir}"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
    cd "${srcdir}/${pkgname}-${_upstream_pkgver}"
    install -Dm644 "LICENSE" \
   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "assets/icon.png" \
            "$pkgdir/usr/share/icons/$pkgname/$pkgname.png"
    install -dm755 "${pkgdir}/var/log/lameta"
    install -d "$pkgdir/usr/lib/$pkgname/"
    asar e "release/linux-unpacked/resources/app.asar" "$pkgdir/usr/lib/$pkgname/"
    install -Dm755 /dev/null "${pkgdir}/usr/bin/$pkgname"
    cat >>"${pkgdir}/usr/bin/$pkgname" <<EOD
#! /usr/bin/sh
exec $_electron /usr/lib/$pkgname "\$@"
EOD
    echo "This build dir is rather large:"
    du -h -d0 "$(dirname "$srcdir/../")"
    echo "Maybe you should consider deleting it"
}
