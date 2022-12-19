# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-iptv
pkgver=2.4.0
_vdrapi=2.6.3
pkgrel=10
pkgdesc="Integrates multicast IPTV transport streams seamlessly into VDR"
url="https://github.com/rofafor/vdr-plugin-iptv"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('curl' "vdr-api=${_vdrapi}")
optdepends=('vlc: Needed for vlc2iptv')
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/rofafor/vdr-plugin-iptv/archive/v$pkgver.tar.gz"
        "$pkgname-fix_vlc2iptv.patch"
        'https://github.com/yavdr/yavdr-base/raw/stable-0.5/etc/vdr/plugins/iptv/vlcinput/3Sat.conf'
        'https://github.com/yavdr/yavdr-base/raw/stable-0.5/etc/vdr/plugins/iptv/vlcinput/Bundesligen-TV.conf'
        'https://github.com/yavdr/yavdr-base/raw/stable-0.5/etc/vdr/plugins/iptv/vlcinput/Daytona-Beach.conf'
        'https://github.com/yavdr/yavdr-base/raw/stable-0.5/etc/vdr/plugins/iptv/vlcinput/NASA.conf'
        'https://github.com/yavdr/yavdr-base/raw/stable-0.5/etc/vdr/plugins/iptv/vlcinput/Sky-News.conf'
        'https://github.com/yavdr/yavdr-base/raw/stable-0.5/etc/vdr/plugins/iptv/vlcinput/THE_VOICE.conf'
        'https://github.com/yavdr/yavdr-base/raw/stable-0.5/etc/vdr/plugins/iptv/vlcinput/zdf-iptv.conf'
        'https://github.com/yavdr/yavdr-base/raw/stable-0.5/etc/vdr/plugins/iptv/vlcinput/zdf_info-iptv.conf'
        'https://github.com/yavdr/yavdr-base/raw/stable-0.5/etc/vdr/plugins/iptv/vlcinput/zdf_kultur-iptv.conf'
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf"
        'etc/vdr/plugins/iptv/vlcinput/3Sat.conf'
        'etc/vdr/plugins/iptv/vlcinput/Bundesligen-TV.conf'
        'etc/vdr/plugins/iptv/vlcinput/Daytona-Beach.conf'
        'etc/vdr/plugins/iptv/vlcinput/NASA.conf'
        'etc/vdr/plugins/iptv/vlcinput/Sky-News.conf'
        'etc/vdr/plugins/iptv/vlcinput/THE_VOICE.conf'
        'etc/vdr/plugins/iptv/vlcinput/zdf-iptv.conf'
        'etc/vdr/plugins/iptv/vlcinput/zdf_info-iptv.conf'
        'etc/vdr/plugins/iptv/vlcinput/zdf_kultur-iptv.conf')
sha256sums=('4c9663136b3f0bc5eedebe7dd4fb72837c55dea9777cdc6d1fb07a15eae370c6'
            'd4a39fae860ce961b2aab8b721cef7f37e80640c50cc9c06d5f9d2b9c265379d'
            '9c8e99d0c82ef5af5141ff89ffd411e0feb3ee6ff2416fee03d9b09e2edb2a6c'
            'c5ead86e396eb0f2bbfced5913f381764131575379b2930bd0e86f6d2df3f774'
            '040d48f0384e8e3afc3a7cb8ccd35127c7b4a795c4a7a0591e45f386060140c7'
            'd1bc5cda831d59d2520fddad69061dd4498ab12a08ebbc7824f96a34de43ee5c'
            'c5dd96d8bf4924f33df9e75a0e65fb60db53b60b7ec5385ea0d45268c5b670dc'
            '2ffcb0906e2412f706c9f6316f0f8bdaf1d4e9a79c37558c93826fdf4cf6335b'
            'd4f0bf84f02b429dd68b8fedb8a892cedba50a932c5178c887e03305cee43e80'
            '73e12fd7132b9fbe277299fa36378fabbe9a3ebba3966f36c64831968b6e7272'
            'a82edea74b3834462ffd7e504c9afb00c2297ddb5aa624c62c0a738e512523e9'
            '0aa1a3f9050345774ff3a7aa1b581ce80416d81fc5fdf8dcc7112f29045be27e')

prepare() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"

  patch -p1 -i "$srcdir/$pkgname-fix_vlc2iptv.patch"
}

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make GITTAG=''
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make DESTDIR="${pkgdir}" install-lib install-i18n

  install -Dm755 iptv/vlc2iptv "$pkgdir/usr/share/vdr/plugins/iptv/vlc2iptv"
  install -Dm755 iptv/vlc2iptv_raw "$pkgdir/usr/share/vdr/plugins/iptv/vlc2iptv_raw"

  mkdir -p "$pkgdir/etc/vdr/plugins/iptv/vlcinput"
  cp "$srcdir"/*.conf "$pkgdir/etc/vdr/plugins/iptv/vlcinput"
  rm "$pkgdir/etc/vdr/plugins/iptv/vlcinput/50-iptv.conf"

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
