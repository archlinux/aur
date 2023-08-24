# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: AK <crt@archlinux.email>

# https://git.alpinelinux.org/aports/tree/community/ossec-hids
# https://git.alpinelinux.org/aports/tree/community/ossec-hids-server/
# https://git.alpinelinux.org/aports/tree/community/ossec-hids-agent/
# https://git.alpinelinux.org/aports/tree/community/ossec-hids-local/

pkgname="ossec-hids-server"
pkgver=3.7.0
pkgrel=3
pkgdesc="Open Source Host-based Intrusion Detection System - Server only"
url="https://www.ossec.net/"
license=("GPL2")
arch=("x86_64" "aarch64" "armv7h")
provides=("ossec-hids-server")
conflicts=("ossec-hids-local")
depends=("geoip-database-extra"
         "inotify-tools"
         "libprocps"
         "openssl")
makedepends=(
        "czmq"
        "file"
        "findutils"
        "libevent"
        "lua"
        "pcre2"
        "sqlite"
        "zlib")
source=("ossec-hids.config"
        "ossec-hids.logrotate"
        "ossec-hids.service"
        "ossec-hids.sysusers"
        "ossec-hids.tmpfiles"
        "patch-makefile.patch"
        "patch-os.patch"
        "https://github.com/ossec/ossec-hids/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('efc7cc34037b3e0eebf612036622a3df13abd50d7113f6f9c47de4cf856b6e1e'
            'bf2cfddcedb4a239cc034a37a4868c2415932b8e1db82481d143c734ad457ce0'
            '0a00e9b90ee12b6780f874463ff7a4530c063628e60ce98fc5ba4ccdac44734f'
            '84cf9143e9b894c65f42ddebfef54221440e076ba4f4f7d85f2f056c07ed0418'
            '325da49ec4ea61e0aaadf1094cc641612aa160d48fdae0ff8f14de908ecb7460'
            'c6b7848e4a8b7f581ee2cee5628ed439797284e6f2189a35aab0ffb97a392bcc'
            'b81ce4baf229be877b278dd03828d979980c565de43283416f3e94f2c2f90f7a'
            '23f5ede50f5de449db0a571fc453977f7079b4b47ce90b0ef31feed20df100e9')
backup=("etc/ossec.conf"
        "etc/ossec-server.conf"
        "var/lib/ossec-hids/etc/shared/ar.conf"
        "var/lib/ossec-hids/etc/client.keys"
        "var/lib/ossec-hids/rules/local_rules.xml")
options=("!strip")

prepare(){
 cd "ossec-hids-$pkgver"

 # variables
 source "$srcdir/ossec-hids.config"
 export USER_INSTALL_TYPE=server 

 # patches
 patch --forward --strip=1 --input="$srcdir/patch-makefile.patch"
 patch --forward --strip=1 --input="$srcdir/patch-os.patch"

 # version
 install -d "$pkgdir/etc"
 cat > "etc/ossec-init.conf" <<CONTENT
DIRECTORY="$USER_DIR"
VERSION="$(sed "s|v||" "src/VERSION")"
DATE="$(date -I)"
TYPE="$USER_INSTALL_TYPE"
CONTENT

 # avoids ERROR: Invalid SMTP Server: smtp.example.com
 sed -i "etc/ossec.conf" \
     -e "s|<email_notification>yes|<email_notification>no|"
 sed -i "etc/ossec-server.conf" \
     -e "s|<email_notification>yes|<email_notification>no|"

 # avoids OSSEC analysisd: Testing rules failed. Configuration error. Exiting.
 # /var/lib/ossec-hids/bin/ossec-analysisd -ddddddf
 sed -i "etc/rules/attack_rules.xml" \
     -e 's|<rule id="40113"|<!--&|' \
     -e 's|.*SYSLOG, ATTACKS, -->|-->\n&|'
}

build(){
 cd "ossec-hids-$pkgver/src"

 # compilation
 make clean
 make TARGET="$USER_INSTALL_TYPE" PREFIX="$USER_DIR"
}

package(){
 cd "ossec-hids-$pkgver"

 # main files
 cd "src"
 export OSSEC_GROUP=root
 export OSSEC_USER=root
 export OSSEC_USER_MAIL=root
 export OSSEC_USER_REM=root
 make install TARGET="$USER_INSTALL_TYPE" PREFIX="$pkgdir$USER_DIR"
 
 # configuration
 cd "$srcdir/ossec-hids-$pkgver"
 install -D -m 644 "etc/ossec.conf" -t "$pkgdir/etc"
 install -D -m 644 "etc/ossec-server.conf" -t "$pkgdir/etc"
 rm "$pkgdir/var/lib/ossec-hids/etc/ossec.conf"
 ln -sf "/etc/ossec.conf" "$pkgdir/var/lib/ossec-hids/etc/ossec.conf"

 # logs
 install -d -m 755 "$pkgdir/var/log"
 mv "$pkgdir/var/lib/ossec-hids/logs" "$pkgdir/var/log/ossec-hids"
 ln -sf "/var/log/ossec-hids" "$pkgdir/var/lib/ossec-hids/logs"
 install -D -m 644 "$srcdir/ossec-hids.logrotate" -t "$pkgdir/etc/logrotate.d"

 # contributions
 install -d "$pkgdir/usr/share/ossec-hids"
 cp -a "contrib/"* "$pkgdir/usr/share/ossec-hids"
 rm -r "$pkgdir/usr/share/ossec-hids/"{selinux,debian-packages,specs}

 # documentation
 install -d "$pkgdir/usr/share/doc/ossec-hids"
 cp -a "doc/"* "$pkgdir/usr/share/doc/ossec-hids"
 
 # systemd
 install -D -m 644 "$srcdir/ossec-hids.service"  "$pkgdir/usr/lib/systemd/system/ossec-hids.service"
 install -D -m 644 "$srcdir/ossec-hids.sysusers" "$pkgdir/usr/lib/sysusers.d/ossec-hids.conf"
 install -D -m 644 "$srcdir/ossec-hids.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/ossec-hids.conf"
}
