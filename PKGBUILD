# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: AK <crt@archlinux.email>

# https://git.alpinelinux.org/aports/tree/community/ossec-hids
# https://git.alpinelinux.org/aports/tree/community/ossec-hids-server/
# https://git.alpinelinux.org/aports/tree/community/ossec-hids-agent/
# https://git.alpinelinux.org/aports/tree/community/ossec-hids-local/
# https://blog.e-zest.com/ossec-hids-installation-and-configuration-on-amazon-ec2-instance

pkgname="ossec-hids-server"
pkgver=3.7.0
pkgrel=4
pkgdesc="Open Source Host-based Intrusion Detection System - Server only"
url="https://www.ossec.net/"
license=("GPL2")
arch=("x86_64" "aarch64" "armv7h")
provides=("ossec-hids-server")
conflicts=("ossec-hids-agent" "ossec-hids-hybrid" "ossec-hids-local")
depends=("geoip"
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
        "patch-makefile.patch"
        "https://github.com/ossec/ossec-hids/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('bd5c74db93a8dfd939463d606813028a8c1e16d72920ced4a635019e68c1d4bc'
            'bf2cfddcedb4a239cc034a37a4868c2415932b8e1db82481d143c734ad457ce0'
            'c6b7848e4a8b7f581ee2cee5628ed439797284e6f2189a35aab0ffb97a392bcc'
            '23f5ede50f5de449db0a571fc453977f7079b4b47ce90b0ef31feed20df100e9')
backup=("etc/ossec.conf"
        "var/lib/ossec-hids/etc/client.keys"
        "var/lib/ossec-hids/etc/local_internal_options.conf"
        "var/lib/ossec-hids/rules/local_rules.xml")
options=("!strip")
install="$pkgname.install"

prepare(){
 cd "ossec-hids-$pkgver"

 # variables
 source "$srcdir/ossec-hids.config"
 export USER_INSTALL_TYPE=server 

 # patches
 patch --forward --strip=1 --input="$srcdir/patch-makefile.patch"

 # version
 cat > "etc/ossec-init.conf" <<CONTENT
DIRECTORY="$USER_DIR"
VERSION="$(sed "s|v||" "src/VERSION")"
DATE="$(date -I)"
TYPE="$USER_INSTALL_TYPE"
CONTENT

 # avoids ERROR: Invalid SMTP Server: smtp.example.com
 sed -i "etc/ossec-server.conf" \
     -e "s|<email_notification>yes|<email_notification>no|"

 # avoids OSSEC analysisd: Testing rules failed. Configuration error. Exiting.
 # /var/lib/ossec-hids/bin/ossec-analysisd -ddddddf
 sed -i "etc/rules/attack_rules.xml" \
     -e 's|<rule id="40113"|<!--&|' \
     -e 's|.*SYSLOG, ATTACKS, -->|-->\n&|'
     
 #  https://github.com/ossec/ossec-hids/tree/master/src/systemd
 IFS=$'\n' _fileList=($(grep -rnl "/var/ossec" "src/systemd"))
 for _file in "${_fileList[@]}"; do
  if [ -f "$_file" ]; then 
   sed -i "s|/var/ossec|/var/lib/ossec-hids|g" "$_file"
  fi
 done
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
 # need to specify root, otherwise chown is run
 export OSSEC_GROUP=root
 export OSSEC_USER=root
 export OSSEC_USER_MAIL=root
 export OSSEC_USER_REM=root
 make install TARGET="$USER_INSTALL_TYPE" PREFIX="$pkgdir$USER_DIR"
 chmod 700 "$pkgdir/var/lib/ossec-hids"
 cd ..
 
 # configuration
 install -d "$pkgdir/etc"
 install -D -m 644 "etc/ossec-init.conf" "$pkgdir/etc/ossec-init.conf"
 install -D -m 640 "etc/ossec-local.conf" "$pkgdir/etc/ossec.conf"
 ln -sf "/etc/ossec.conf" "$pkgdir/var/lib/ossec-hids/etc/ossec.conf"

 # logs
 install -d -m 755 "$pkgdir/var/log"
 mv "$pkgdir/var/lib/ossec-hids/logs" "$pkgdir/var/log/ossec-hids"
 ln -sf "/var/log/ossec-hids" "$pkgdir/var/lib/ossec-hids/logs"
 install -D -m 644 "$srcdir/ossec-hids.logrotate" -t "$pkgdir/etc/logrotate.d"

 # contributions
 install -d "$pkgdir/usr/share/ossec-hids"
 cp -a "contrib/"* "$pkgdir/usr/share/ossec-hids"

 # documentation
 install -d "$pkgdir/usr/share/doc/ossec-hids"
 cp -a "doc/"* "$pkgdir/usr/share/doc/ossec-hids"
 
 # systemd
 find "src/systemd/server" -type f -exec install -D -m 644 {} -t "$pkgdir/usr/lib/systemd/system" \;
}
