# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="librespeed-go"
pkgver=1.1.3
pkgrel=1
pkgdesc="Very lightweight speed test implemented in Javascript, using XMLHttpRequest and Web Workers."
url="https://github.com/librespeed/speedtest-go"
license=("LGPL3")
arch=("i386" "x86_64" "aarch64" "armv5h" "armv6h" "armv7h")
conflicts=("librespeed-go-bin")
makedepends=("go>=1.13")
optdepends=("mariadb: database"
            "postgresql: database")
source=("https://github.com/librespeed/speedtest-go/archive/v$pkgver.zip"
        "librespeed.service"
        "librespeed.sysusers"
        "librespeed.tmpfiles"
        "settings.toml")
sha256sums=("b4bf0a88df3ba87643b8be567fda0cf4cdfc234102c21c9103e8303518e25b62"
            "c9db604a942f3fcc25f75b8e630fdb95916bf604721d0d1dbd70f29554ab766c"
            "d2cdcfd2a5d4ed1b482915c65e38a3aa06e34e967510a3721ea95180fe31c83f"
            "ef3ee7877738f801edc83a56ef83ed49cef2f6a7431641a55f3f6d5c8967059e"
            "5a7daa3e93243d780379438dd13e112844b9e5064e9d89d1fb4d97e52e89138a")
backup=("etc/librespeed/settings.toml" "var/lib/librespeed/speedtest.db")

prepare(){
 cd "speedtest-go-$pkgver/assets"
 sed -i "s/LibreSpeed Example/LibreSpeed/" *.html
}

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
