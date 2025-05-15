# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: AK <crt@archlinux.email>

# https://git.alpinelinux.org/aports/tree/community/ossec-hids
# https://git.alpinelinux.org/aports/tree/community/ossec-hids-server/
# https://git.alpinelinux.org/aports/tree/community/ossec-hids-agent/
# https://git.alpinelinux.org/aports/tree/community/ossec-hids-local/
# https://blog.e-zest.com/ossec-hids-installation-and-configuration-on-amazon-ec2-instance

pkgname="ossec-hids-local"
pkgver=3.8.0
pkgrel=2
pkgdesc="Open Source Host-based Intrusion Detection System - Standalone"
url="https://www.ossec.net/"
license=("GPL2")
arch=("x86_64" "aarch64" "armv7h")
provides=("ossec-hids-server")
conflicts=("ossec-hids-server" "ossec-hids-agent")
depends=("geoip"
         "inotify-tools"
         "libprocps"
         "openssl")
makedepends=(
        "czmq-git"
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
sha256sums=('0bec7dcff9c899f075d9cc5ad158ca2cb3776ee39bbd52767feba9f73e0d42e6'
            '077a1382f5b1b07854007dd8525011c30566ac8d52db421d3723218ab747d34b'
            'f0810da503622ba27dd2c4108f6c9b88b6664c51e473aae2ecfc1897f6d1d234'
            'bd857a2dd7d0559ef59b4a9ec276f3a8ade6830f8aed257e8f4a62106cfe5f38')
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
 export USER_INSTALL_TYPE=local 

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
 export USER_INSTALL_TYPE=local
 
 # compilation
 make clean
 make TARGET="$USER_INSTALL_TYPE" PREFIX="$USER_DIR"
}

package(){
 cd "ossec-hids-$pkgver"

 # variables
 source "$srcdir/ossec-hids.config"
 export USER_INSTALL_TYPE=local
 
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
 install -D -m 640 "etc/ossec-local.conf" "etc/ossec.conf"
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
