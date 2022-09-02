# Maintainer: <me at auoeke dot net>
pkgname=lapce-nightly-bin
pkgver=20220902
pkgrel=2
pkgdesc='Lightning-fast and powerful code editor'
arch=(x86_64)
url=https://lapce.dev
license=(Apache)
depends=(
    expat
    fontconfig
    freetype2
    gcc-libs
    gtk3
    libxcb
    libxkbcommon
)
options=('!lto')
source=(
    https://github.com/lapce/lapce/releases/download/nightly/Lapce-linux.tar.gz
    https://raw.githubusercontent.com/lapce/lapce/master/extra/{images/logo.png,linux/dev.lapce.lapce.{desktop,metainfo.xml}}
)
sha256sums=(
    'f84cdf5fd9ea91e7b6d8ec593f99331cd0f7b52dfa499af3098727f357bcd669'
    'b715c6d069e7cb9fd76ebe398c0251de9f218a44876c75015b9e969c9e70ba23'
    '07e6b1b685c88b8f23919f58f9e2210a0357836b12026b5a04b0c18b4acfd34a'
    'ea9a83d6612ac4a3a315577b3e55ec761420ea62af1ed35936a5421891fba0ff'
)

prepare() {
    sed -i "s/Exec=lapce/Exec=lapce-nightly/" "$srcdir/dev.lapce.lapce.desktop"
    sed -i "s/Name=Lapce/Name=Lapce nightly/" "$srcdir/dev.lapce.lapce.desktop"
}

pkgver() {
    date -d $(curl https://api.github.com/repos/lapce/lapce/releases/tags/nightly | jq -r .published_at) +%Y%m%d
    #"$srcdir/Lapce/lapce" -V | cut -d - -f 2
}

package() {
    cd "$srcdir"
    install -D Lapce/lapce "$pkgdir/usr/bin/lapce-nightly"
    install -Dm 644 dev.lapce.lapce.desktop "$pkgdir/usr/share/applications/dev.lapce.lapce-nightly.desktop"
    install -Dm 644 dev.lapce.lapce.metainfo.xml "$pkgdir/usr/share/metainfo/dev.lapce.lapce-nightly.metainfo.xml"
    install -Dm 644 logo.png "$pkgdir/usr/share/pixmaps/dev.lapce.lapce-nightly.png"
}

