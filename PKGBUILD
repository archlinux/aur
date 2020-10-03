# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="librespeed-go"
pkgver=1.1.1
pkgrel=1
pkgdesc="Very lightweight speed test implemented in Javascript, using XMLHttpRequest and Web Workers."
url="https://github.com/librespeed/speedtest-go"
license=("LGPL3")
arch=("i386" "x86_64" "aarch64" "armv5h" "armv6h" "armv7h")
conflicts=("librespeed-go-bin")
makedepends=("go>=1.13")
optdepends=("mariadb: database"
            "postgres: database")
source=("https://github.com/librespeed/speedtest-go/archive/v$pkgver.zip"
        "librespeed.service"
        "librespeed.sysusers"
        "librespeed.tmpfiles"
        "settings.toml")
md5sums=("4534a45a909ca9bb4fe176299dbb0deb"
        "81c7b43b922df27533399746715a5db5"
        "62f7aab9f9607bb9f0f4250f54928c3f"
        "25ec3e5a8b85467863134a68cd3e0e03"
        "0a3ae23c24688169f44931a937df8a85")
backup=("etc/librespeed/settings.toml" "var/lib/librespeed/speedtest.db")

build(){
 cd "speedtest-go-$pkgver"
 go build -ldflags "-w -s" -trimpath -o "speedtest" "main.go"
}

package(){
 install -D -m 644 "librespeed.service" "$pkgdir/usr/lib/systemd/system/librespeed.service"
 install -D -m 644 "librespeed.sysusers" "$pkgdir/usr/lib/sysusers.d/librespeed.conf"
 install -D -m 644 "librespeed.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/librespeed.conf"
 install -D -m 640 "settings.toml" "$pkgdir/etc/librespeed/settings.toml"
 
 cd "speedtest-go-$pkgver"
 install -d "$pkgdir/usr/share/librespeed"
 install -m 644 "database/mysql/telemetry_mysql.sql" "$pkgdir/usr/share/librespeed"
 install -m 644 "database/postgresql/telemetry_postgresql.sql" "$pkgdir/usr/share/librespeed"
 cp -r "assets" "$pkgdir/usr/share/librespeed"
 
 install -D "speedtest" "$pkgdir/usr/bin/librespeed"

 install -d -m 750 "$pkgdir/var/lib/librespeed"
 touch "$pkgdir/var/lib/librespeed/speedtest.db"

 install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 
}
