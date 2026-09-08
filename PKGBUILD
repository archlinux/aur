# Maintainer: Lorenzo Cozzaglio <lorenzocozzaglio.10@gmail.com>

pkgname=open5gs
pkgver=2.8.0
pkgrel=1
pkgdesc="C-language Open Source implementation of 5G Core and EPC (evolved packet core)"
arch=('x86_64' 'aarch64')
url="https://open5gs.org/"
license=('AGPL3')
depends=('gnutls' 'openssl' 'libnghttp2' 'libmicrohttpd' 'curl' 'talloc' 'libyaml'
         'lksctp-tools' 'mongo-c-driver')
makedepends=('meson' 'ninja' 'cmake' 'flex' 'bison' 'python')
backup=('etc/open5gs/mme.yaml' 'etc/open5gs/sgwc.yaml' 'etc/open5gs/sgwu.yaml'
        'etc/open5gs/smf.yaml' 'etc/open5gs/amf.yaml' 'etc/open5gs/upf.yaml'
        'etc/open5gs/hss.yaml' 'etc/open5gs/pcrf.yaml' 'etc/open5gs/nrf.yaml'
        'etc/open5gs/scp.yaml' 'etc/open5gs/sepp1.yaml' 'etc/open5gs/sepp2.yaml'
        'etc/open5gs/ausf.yaml' 'etc/open5gs/udm.yaml' 'etc/open5gs/udr.yaml'
        'etc/open5gs/pcf.yaml' 'etc/open5gs/nssf.yaml' 'etc/open5gs/bsf.yaml'
        'etc/freeDiameter/mme.conf' 'etc/freeDiameter/hss.conf'
        'etc/freeDiameter/smf.conf' 'etc/freeDiameter/pcrf.conf'
        'etc/logrotate.d/open5gs')

# Open5GS builds a handful of forked dependencies (libtins, freeDiameter,
# prometheus-client-c) as meson/cmake subprojects. The official release
# tarball already vendors them under subprojects/, so the build is fully
# offline (arch-meson defaults to --wrap-mode nodownload) with no extra
# sources needed.
source=("$pkgname-$pkgver.tar.gz::https://github.com/open5gs/open5gs/archive/refs/tags/v$pkgver.tar.gz"
        "open5gs.sysusers"
        "open5gs.tmpfiles")
sha256sums=('a04d66f66f6df62a376a2434a05a7268e08e4fc0cc1b9c56221467689a8b56ab'
            'SKIP'
            'SKIP')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir" --skip-subprojects=libtins,prometheus-client-c

  # The upstream meson install scripts for config/TLS/hnet material are
  # DESTDIR-aware and deliberately no-op under packaging (DESTDIR set), so
  # config trees have to be copied in manually from the generated build dir.
  install -dm755 "$pkgdir/etc/open5gs" "$pkgdir/etc/freeDiameter"
  cp -a build/configs/open5gs/. "$pkgdir/etc/open5gs/"
  cp -a build/configs/freeDiameter/*.conf "$pkgdir/etc/freeDiameter/"
  find "$pkgdir/etc/open5gs" "$pkgdir/etc/freeDiameter" -type d -exec chmod 755 {} +
  find "$pkgdir/etc/open5gs" "$pkgdir/etc/freeDiameter" -type f -exec chmod 644 {} +

  install -Dm644 -t "$pkgdir/usr/lib/systemd/system" build/configs/systemd/open5gs-*.service
  install -Dm644 -t "$pkgdir/usr/lib/systemd/network" \
    build/configs/systemd/99-open5gs.netdev build/configs/systemd/99-open5gs.network
  install -Dm644 build/configs/logrotate/open5gs "$pkgdir/etc/logrotate.d/open5gs"

  install -Dm644 open5gs.sysusers "$pkgdir/usr/lib/sysusers.d/open5gs.conf"
  install -Dm644 open5gs.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/open5gs.conf"

  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
