# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="librespeed-go"
pkgver=1.1.5
pkgrel=1
pkgdesc="Very lightweight speed test implemented in Javascript, using XMLHttpRequest and Web Workers"
url="https://github.com/librespeed/speedtest-go"
license=("LGPL3")
arch=("i386" "x86_64" "aarch64" "armv5h" "armv6h" "armv7h")
conflicts=("librespeed-go-bin")
makedepends=("go>=1.16")
optdepends=("mariadb: alternative database to bolt"
            "postgresql: alternative database to bolt")
source=("https://github.com/librespeed/speedtest-go/archive/v$pkgver.zip"
        "librespeed.ico"
        "librespeed.service"
        "librespeed.sysusers"
        "librespeed.tmpfiles")
sha256sums=('f481669c460713f3fc1c4fafbbd7ef5c5afbb21ef60221d36cea11a127e73a3c'
            '4a0d7a5a4aa43eeb967dff70c899de820cb725c74841a5b5eea37cea78ca1d42'
            '8bcbda327d2be9a4fc8195f39b5876c7e48562af2f5956417ad78d857183ce75'
            'd2cdcfd2a5d4ed1b482915c65e38a3aa06e34e967510a3721ea95180fe31c83f'
            '36cb69ea0ca1ed28e608e54202fa319ba25bbd8fc111d47eb345d34d182b91d4')
backup=("etc/librespeed/settings.toml" "usr/share/librespeed/assets/index.html")

prepare(){
 cd "speedtest-go-$pkgver"
 # use arch linux paths
 sed -i "settings.toml" \
     -e 's|^assets_path=.*|assets_path="/usr/share/librespeed/assets"|' \
     -e 's|database_file=.*|database_file="/var/lib/librespeed/speedtest.db"|'
 # remove "Example" from html pages
 sed -i "web/assets/"*.html \
     -e "s|LibreSpeed Example|LibreSpeed Speedtest|g"
}

build(){
 cd "speedtest-go-$pkgver"
 go build -ldflags "-w -s" -trimpath -o "speedtest" "main.go"
}

package(){
 cd "speedtest-go-$pkgver"
 # binary file
 install -D "speedtest" "$pkgdir/usr/bin/librespeed"
 # configuration
 install -D -m 640 "settings.toml" "$pkgdir/etc/librespeed/settings.toml"
 # database
 install -d -m 750 "$pkgdir/var/lib/librespeed"
 #touch "$pkgdir/var/lib/librespeed/speedtest.db"
 # webapp files
 install -d "$pkgdir/usr/share/librespeed"
 install -m 644 "database/mysql/telemetry_mysql.sql" "$pkgdir/usr/share/librespeed"
 install -m 644 "database/postgresql/telemetry_postgresql.sql" "$pkgdir/usr/share/librespeed"
 # html pages
 install -D -m 644 "web/assets/example-singleServer-full.html" "web/assets/index.html"
 install -D -m 644 "$srcdir/librespeed.ico" "web/assets/favicon.ico"
 cp -r "web/assets" "$pkgdir/usr/share/librespeed"
 # systemd files
 install -D -m 644 "$srcdir/librespeed.service" "$pkgdir/usr/lib/systemd/system/librespeed.service"
 install -D -m 644 "$srcdir/librespeed.sysusers" "$pkgdir/usr/lib/sysusers.d/librespeed.conf"
 install -D -m 644 "$srcdir/librespeed.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/librespeed.conf"
}
