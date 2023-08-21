# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: AK <crt@archlinux.email>

# https://git.alpinelinux.org/aports/tree/community/ossec-hids-server/

pkgname="ossec-hids-server"
pkgver=3.7.0
pkgrel=1
pkgdesc="Open Source Host-based Intrusion Detection System - Server package"
url="https://www.ossec.net/"
license=("GPL2")
arch=("x86_64" "aarch64" "armv7h")
depends=("geoip-database-extra"
         "inotify-tools"
         "libprocps"
         "openssl"
         "ossec-hids"
         )
makedepends=(
        "czmq"
        "file"
        "findutils"
        "libevent"
        "lua"
        "pcre2"
        "sqlite"
        "zlib"
        )
source=("ossec-hids.config"
        "ossec-hids.logrotate"
        "ossec-hids.service"
        "ossec-hids.sysusers"
        "ossec-hids.tmpfiles"
        "patch-makefile.patch"
        "patch-os.patch"
        "https://github.com/ossec/ossec-hids/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('52f6d311f5b44e4af681975131a93a948f772884d923100d6f8bdaa087172787'
            'bf2cfddcedb4a239cc034a37a4868c2415932b8e1db82481d143c734ad457ce0'
            '435a3f107c9095f00882b2a928e75f8b7d3350fde3e42e917c0d1386104b0235'
            '84cf9143e9b894c65f42ddebfef54221440e076ba4f4f7d85f2f056c07ed0418'
            '325da49ec4ea61e0aaadf1094cc641612aa160d48fdae0ff8f14de908ecb7460'
            'c6b7848e4a8b7f581ee2cee5628ed439797284e6f2189a35aab0ffb97a392bcc'
            'b81ce4baf229be877b278dd03828d979980c565de43283416f3e94f2c2f90f7a'
            '23f5ede50f5de449db0a571fc453977f7079b4b47ce90b0ef31feed20df100e9')
backup=("etc/ossec-server.conf")
options=("!strip")

prepare(){
 cd "ossec-hids-$pkgver"
 # variables
 set +x
 source "$srcdir/ossec-hids.config"
 export USER_INSTALL_TYPE=server 

 # patches
 patch --forward --strip=1 --input="$srcdir/patch-makefile.patch"
 patch --forward --strip=1 --input="$srcdir/patch-os.patch"

 install -d "$pkgdir/etc"
 cat > "etc/ossec-init.conf" <<CONTENT
DIRECTORY="$USER_DIR"
VERSION="$(sed "s|v||" "src/VERSION")"
DATE="$(date -I)"
TYPE="$USER_INSTALL_TYPE"
CONTENT

 # avoid OSSEC analysisd: Testing rules failed. Configuration error. Exiting.
 # /var/lib/ossec-hids/bin/ossec-analysisd -ddddddf
 sed -i "etc/rules/attack_rules.xml" \
     -e 's|<rule id="40113"|<!--&|' \
     -e 's|.*SYSLOG, ATTACKS, -->|</group>--> <!-- &|'
}

build(){
 cd "ossec-hids-$pkgver/src"

 # compilation
 make clean
 make TARGET="$USER_INSTALL_TYPE" PREFIX="$USER_DIR"
}

package(){
 cd "ossec-hids-$pkgver"

 # systemd
 install -D -m 644 "$srcdir/ossec-hids.service"  "$pkgdir/usr/lib/systemd/system/ossec-hids.service"
 #install -D -m 644 "$srcdir/ossec-hids.sysusers" "$pkgdir/usr/lib/sysusers.d/ossec-hids.conf"
 #install -D -m 644 "$srcdir/ossec-hids.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/ossec-hids.conf"

 # files
 cd "src"
 make install TARGET="$USER_INSTALL_TYPE" PREFIX="$pkgdir$USER_DIR"
 
 # configuration
 install -D -m 644 "etc/ossec-server.conf" -t "$pkgdir/etc"
 rm "$pkgdir/var/lib/ossec-hids/etc/ossec.conf"
 ln -sf "/etc/ossec.conf" "$pkgdir/var/lib/ossec-hids/etc/ossec.conf"

 # logs
 install -d -m 755 "$pkgdir/var/log"
 mv "$pkgdir/var/lib/ossec-hids/logs" "$pkgdir/var/log/ossec-hids"
 ln -sf "/var/log/ossec-hids" "$pkgdir/var/lib/ossec-hids/logs"
 install -D -m 644 "$srcdir/ossec-hids.logrotate" -t "$pkgdir/etc/logrotate.d"

}
