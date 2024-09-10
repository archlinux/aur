# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="librespeed-go"
pkgver=1.1.5
pkgrel=3
pkgdesc="Go backend for LibreSpeed"
url="https://github.com/librespeed/speedtest-go"
license=("LGPL3")
arch=("i386" "x86_64" "aarch64" "armv5h" "armv6h" "armv7h")
conflicts=("librespeed-rs")
makedepends=("go>=1.16")
optdepends=("mariadb: alternative database to bolt"
            "postgresql: alternative database to bolt")
source=("https://github.com/librespeed/speedtest-go/archive/v$pkgver.zip"
        "librespeed.ico"
        "librespeed.service"
        "librespeed.sysusers"
        "librespeed.tmpfiles")
b2sums=('7bb22236e9ae9a78793219124651877c0c20f9e99f218e4e275894aeed50225598ff559aa74c49a156f8818d92cc87766bf3de6af15df2c2ad26d404c05b35d9'
        'd561280edc2fe3f7228ce3366132bd22e345e7574f21d92e6f188f701642fe98ffab8c8b12e807ad72fea15a6016605d6febd08c3389395828c47767779540bc'
        '6aa0ca421c7ee5ac2dd58df13c1a42a350186eb5a72bad7f83776b7a291b3032ae84e0789d0fafb8116f4371b73317b6bda476ea3f44f72337b236e7e2514761'
        'a7d3d6d4e7adb5b5d45e254fafad7c7180a54c1eec898657cbd8d457e218c746742067d7a024b81e2bf1fefb05a6ce3f7abebbdf233f70c99a34406edf047b6c'
        'f89c7cdee011d281dca7726a2b196e768423e8b3c52a1335b04b6740d83d2700acfd1ad248a3e0549a7e0ca8f996db635448be35fdf96889a3d714902ec95aae')
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
