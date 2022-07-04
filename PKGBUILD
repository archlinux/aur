# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Matthew Gamble <git@matthewgamble.net>

pkgname="scrutiny-bin"
pkgver=0.4.14
pkgrel=4
pkgdesc="Hard Drive S.M.A.R.T Monitoring, Historical Trends & Real World Failure Thresholds"
url="https://github.com/AnalogJ/scrutiny"
license=("MIT")
arch=("x86_64" "armv5h" "armv6h" "armv7h" "aarch64")
provides=("scrutiny")
conflicts=("scrutiny" "scrutiny-collector")
depends=("smartmontools")
optdepends=("influxdb: run the datastore on the same machine")
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
 "$url/releases/download/v$pkgver/scrutiny-web-linux-amd64"
 "$url/releases/download/v$pkgver/scrutiny-collector-metrics-linux-amd64"
)

source_armv5h=(
 "$url/releases/download/v$pkgver/scrutiny-web-linux-arm-5"
 "$url/releases/download/v$pkgver/scrutiny-collector-metrics-linux-arm-5"
)

source_armv6h=(
 "$url/releases/download/v$pkgver/scrutiny-web-linux-arm-6"
 "$url/releases/download/v$pkgver/scrutiny-collector-metrics-linux-arm-6"
)

source_armv7h=(
 "$url/releases/download/v$pkgver/scrutiny-web-linux-arm-7"
 "$url/releases/download/v$pkgver/scrutiny-collector-metrics-linux-arm-7"
)

source_aarch64=(
 "$url/releases/download/v$pkgver/scrutiny-web-linux-arm64"
 "$url/releases/download/v$pkgver/scrutiny-collector-metrics-linux-arm64"
)

sha256sums=('6917055a0537f7564a810b72dbf220eee4b4887546024928aa11276dd72716cb'
            '60015fb20fb28293faf64552cece87c27c0b3df3cd9e6384eef4dbdf0502c0e2'
            'ebe687ec822ff9209bacdd2644cc668d3dc0fba02dfd1b9dc57d1d7c89ff4388'
            'd5a9f3ab0246bf14dff3c4becd2532c82a406ef1fb71da3d6e30b6eb0df7cac7'
            '4e6b3abd6555423c124436279d37407e5f5cd077e587bd8c4f84d00085827fd4'
            '1092990c80080ddf56587310d8993f82db49ddcbd0e2948f2ab3fea694fc7887'
            'e487c741ee1c3798507af7fc0c5d5ea3c5f673464169eb6192579dba097fc6e6'
            'bb30677b6ed77590124d92eb133d3a9ab73b7f812b8c91b6bb49786cee20ddde')
sha256sums_x86_64=('05868aece364d908c8e52dd579339b5ede8ec59ea4a91f3a48f5f2a14cdef502'
                   '70f4957e94d16853f084cbefd53b4c453427ac5062040789695ac2db516d1a11')
sha256sums_armv5h=('07af20e29ff9fb3ea6d358a993ad990526af5e713eaf8964d52a0dd8a7bc7909'
                   '8db18b623776bc653b9a2b7502bb48dd197f1e7165466245d2c8f39acdfa18f7')
sha256sums_armv6h=('ef1ef39f336ab893c8dc85551ae7234e5c2196ce34790807e72676abd6363279'
                   'b6d5abf230582e152b2c8273800ff3ad746359b196dcf530f7015c4c84d03c5c')
sha256sums_armv7h=('f737e603748d7fdff17b9e81cb59c0c7f89f3c7c3370e3a7ad3f03036c28758f'
                   '967b5b88c9600364f76177def8571aaa4a6d748c1da717f885d3906eddef54e9')
sha256sums_aarch64=('8a7d3275a469e164d0b7f337457009360cbb35fd2dda9cf088613e4732b2f7e5'
                    'aa1c8099d9d910b9f7bcc475384f5f6e9532f37d10201e969c2added9343eef4')

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
 case "$CARCH" in
  "x86_64")
   install -D -m 755 "scrutiny-web-linux-amd64" "$pkgdir/usr/bin/scrutiny"
   install -D -m 755 "scrutiny-collector-metrics-linux-amd64" "$pkgdir/usr/bin/scrutiny-collector"
  ;;
  "armv5h")
   install -D -m 755 "scrutiny-web-linux-arm-5" "$pkgdir/usr/bin/scrutiny"
   install -D -m 755 "scrutiny-collector-metrics-linux-arm-5" "$pkgdir/usr/bin/scrutiny-collector"
  ;;
  "armv6h")
   install -D -m 755 "scrutiny-web-linux-arm-6" "$pkgdir/usr/bin/scrutiny"
   install -D -m 755 "scrutiny-collector-metrics-linux-arm-6" "$pkgdir/usr/bin/scrutiny-collector"
  ;;
  "armv7h")
   install -D -m 755 "scrutiny-web-linux-arm-7" "$pkgdir/usr/bin/scrutiny"
   install -D -m 755 "scrutiny-collector-metrics-linux-arm-7" "$pkgdir/usr/bin/scrutiny-collector"
  ;;
  "aarch64") 
   install -D -m 755 "scrutiny-web-linux-arm64" "$pkgdir/usr/bin/scrutiny"
   install -D -m 755 "scrutiny-collector-metrics-linux-arm64" "$pkgdir/usr/bin/scrutiny-collector"
   ;;
  *) echo "[KO] Unsupported architecture provided" && return 1;;
 esac
 # systemd units
 install -D -m 644 "scrutiny.sysusers" "$pkgdir/usr/lib/sysusers.d/scrutiny.conf"
 install -D -m 644 "scrutiny.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/scrutiny.conf"
 install -D -m 644 "scrutiny.service" "$pkgdir/usr/lib/systemd/system/scrutiny.service"
 install -D -m 644 "scrutiny-collector.service" "$pkgdir/usr/lib/systemd/system/scrutiny-collector.service"
 install -D -m 644 "scrutiny-collector.timer" "$pkgdir/usr/lib/systemd/system/scrutiny-collector.timer"
 # frontend files
 cp -r "dist" "$pkgdir/usr/share/webapps/scrutiny"
}
