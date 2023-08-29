# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: AK <crt@archlinux.email>

# https://git.alpinelinux.org/aports/tree/community/ossec-hids
# https://git.alpinelinux.org/aports/tree/community/ossec-hids-server/
# https://git.alpinelinux.org/aports/tree/community/ossec-hids-agent/
# https://git.alpinelinux.org/aports/tree/community/ossec-hids-local/
# https://blog.e-zest.com/ossec-hids-installation-and-configuration-on-amazon-ec2-instance

pkgname="ossec-hids-server"
pkgver=3.7.0
pkgrel=7
pkgdesc="Open Source Host-based Intrusion Detection System - Server only"
url="https://www.ossec.net/"
license=("GPL2")
arch=("x86_64" "aarch64" "armv7h")
provides=("ossec-hids-server")
conflicts=("ossec-hids-agent" "ossec-hids-local")
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
            '077a1382f5b1b07854007dd8525011c30566ac8d52db421d3723218ab747d34b'
            'c6b7848e4a8b7f581ee2cee5628ed439797284e6f2189a35aab0ffb97a392bcc'
            '23f5ede50f5de449db0a571fc453977f7079b4b47ce90b0ef31feed20df100e9')
# why no configuration files in /etc and logs in /var/log? https://groups.google.com/g/wazuh/c/0HDde9QcOgI
backup=("var/lib/ossec-hids/etc/ossec.conf"
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
  
 # hardcoded paths
 IFS=$'\n' _fileList=($(grep -rnl "/var/ossec"))
 for _file in "${_fileList[@]}"; do
  if [ -f "$_file" ]; then 
   sed -i "s|/var/ossec|/var/lib/ossec-hids|g" "$_file"
  fi
 done
 
 # avoids error on startup if mail is not configured, and uses arch paths when possible
 sed -i "etc/ossec-local.conf" \
     -e "s|<email_notification>yes|<email_notification>no|" \
     -e "s|/usr/bin,/usr/sbin|/usr/bin|" \
     -e "s|/bin,/sbin,/boot|/boot|" \
     -e "s|/etc/ssl/private.key|/etc/httpd/conf/server.key|" \
     -e "s|/var/www/logs|/var/log/httpd|"
}

build(){
 cd "ossec-hids-$pkgver/src"

 # variables
 source "$srcdir/ossec-hids.config"
 export USER_INSTALL_TYPE=server
 
 # compilation
 make clean
 make TARGET="$USER_INSTALL_TYPE" PREFIX="$USER_DIR"
}

package(){
 cd "ossec-hids-$pkgver"

 # variables
 source "$srcdir/ossec-hids.config"
 export USER_INSTALL_TYPE=server
 
 # main files
 cd "src"
 # need to specify root gere, regardless of "$srcdir/ossec-hids.config" values
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
 install -D -m 640 "etc/ossec-server.conf" "etc/ossec.conf"
 ln -sf "/var/lib/ossec-hids/etc/ossec.conf" "$pkgdir/etc/ossec.conf"

 # logs
 install -d -m 755 "$pkgdir/var/log"
 install -D -m 644 "$srcdir/ossec-hids.logrotate" -t "$pkgdir/etc/logrotate.d"
 ln -sf "/var/lib/ossec-hids/logs" "$pkgdir/var/log/ossec-hids" 

 # contributions
 install -d "$pkgdir/usr/share/ossec-hids"
 cp -a "contrib/"* "$pkgdir/usr/share/ossec-hids"

 # documentation
 install -d "$pkgdir/usr/share/doc/ossec-hids"
 cp -a "doc/"* "$pkgdir/usr/share/doc/ossec-hids"
 
 # systemd
 find "src/systemd/server" -type f -exec install -D -m 644 {} -t "$pkgdir/usr/lib/systemd/system" \;
}
