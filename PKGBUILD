# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Matthew Gamble <git@matthewgamble.net>

pkgname="scrutiny-bin"
pkgver=0.4.14
pkgrel=1
pkgdesc="Hard Drive S.M.A.R.T Monitoring, Historical Trends & Real World Failure Thresholds"
url="https://github.com/AnalogJ/scrutiny"
license=("MIT")
arch=("x86_64")
provides=("scrutiny")
conflicts=("scrutiny" "scrutiny-collector")
depends=("smartmontools")
optdepends=("influxdb: run the datastore on the same machine")
makedepends=("go")
backup=("etc/scrutiny/scrutiny.yaml"
        "etc/scrutiny/collector.yaml"
)
install="scrutiny.install"
options=("!strip")

source=(
 "$url/releases/download/v$pkgver/scrutiny-web-frontend.tar.gz"
 "https://raw.githubusercontent.com/AnalogJ/scrutiny/v$pkgver/example.scrutiny.yaml"
 "https://raw.githubusercontent.com/AnalogJ/scrutiny/v$pkgver/example.collector.yaml"
 "scrutiny.sysusers"
 "scrutiny.tmpfiles"
 "scrutiny.service"
 "scrutiny-collector.service"
 "scrutiny-collector.timer"
)

source_x86_64=(
    "$url/releases/download/v$pkgver/scrutiny-collector-metrics-linux-amd64"
    "$url/releases/download/v$pkgver/scrutiny-web-linux-amd64"
)

sha256sums=('6917055a0537f7564a810b72dbf220eee4b4887546024928aa11276dd72716cb'
            '60015fb20fb28293faf64552cece87c27c0b3df3cd9e6384eef4dbdf0502c0e2'
            'ebe687ec822ff9209bacdd2644cc668d3dc0fba02dfd1b9dc57d1d7c89ff4388'
            'd5a9f3ab0246bf14dff3c4becd2532c82a406ef1fb71da3d6e30b6eb0df7cac7'
            'eec7e2d5df9d28d2ec2d959f81cc8e41b37095bb8b169e04a8d7d7c1d3a55b6c'
            '6106bb1c00deb6f07f126ad7ee049bfea059562a588d80d017eaf9ecdea00822'
            '8815c11133926538be48349266f85bf3ce989ee77bfb83bf347231294495c219'
            'bb30677b6ed77590124d92eb133d3a9ab73b7f812b8c91b6bb49786cee20ddde')
sha256sums_x86_64=('70f4957e94d16853f084cbefd53b4c453427ac5062040789695ac2db516d1a11'
                   '05868aece364d908c8e52dd579339b5ede8ec59ea4a91f3a48f5f2a14cdef502')

prepare(){
 sed -i "example.scrutiny.yaml" \
     -e "s|0\.0\.0\.0|127.0.0.1|g" \
     -e "s|/opt/scrutiny/config/scrutiny.db|/var/lib/scrutiny/scrutiny.db|" \
     -e "s|/opt/scrutiny/web|/usr/share/webapps/scrutiny|" \
     -e "s|file: ''|file: '/var/log/scrutiny/scrutiny.log'|"
}

package(){
 # new folders
 install -d -m 750 "$pkgdir/etc/scrutiny"
 install -d -m 755 "$pkgdir/usr/share/webapps"
 # configuration files
 install -D -m 644 "example.scrutiny.yaml" "$pkgdir/etc/scrutiny/scrutiny.yaml"
 install -D -m 644 "example.collector.yaml" "$pkgdir/etc/scrutiny/collector.yaml"
 # binaries
 install -D -m 755 "scrutiny-web-linux-amd64" "$pkgdir/usr/bin/scrutiny"
 install -D -m 755 "scrutiny-collector-metrics-linux-amd64" "$pkgdir/usr/bin/scrutiny-collector"
 # systemd units
 install -D -m 644 "scrutiny.sysusers" "$pkgdir/usr/lib/sysusers.d/scrutiny.conf"
 install -D -m 644 "scrutiny.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/scrutiny.conf"
 install -D -m 644 "scrutiny.service" "$pkgdir/usr/lib/systemd/system/scrutiny.service"
 install -D -m 644 "scrutiny-collector.service" "$pkgdir/usr/lib/systemd/system/scrutiny-collector.service"
 install -D -m 644 "scrutiny-collector.timer" "$pkgdir/usr/lib/systemd/system/scrutiny-collector.timer"
 # frontend files
 cp -r "dist" "$pkgdir/usr/share/webapps/scrutiny"
}
