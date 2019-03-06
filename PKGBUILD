# Maintainer: Rafael Fontenlle <rafaelff@gnome.org>
# Collaborator: Manoel Vilela <manoel_vilela@engineer.com>

pkgname=warsaw-openrc
pkgver=1.12.3.11
pkgrel=5
pkgdesc="Banking security tool developed by GAS Tecnologia"
arch=(i686 x86_64)
url="https://seg.bb.com.br"
license=('custom')
depends=('openssl' 'nss' 'openrc')
makedepends=('chrpath')
conflicts=("warsaw")
provides=("warsaw")
options=(!strip)
source=(warsaw.service warsaw.openrc)
source_i686=(https://cloud.gastecnologia.com.br/bb/downloads/ws/warsaw_32_installer.run)
source_x86_64=(https://cloud.gastecnologia.com.br/bb/downloads/ws/warsaw_64_installer.run)
md5sums=('d614d1164666e3071d9c2001109b0f18'
         '0996288430a741c50dc1b89d1909823b')
md5sums_i686=('b53b1696e2a0624f54eb516538ac655b')
md5sums_x86_64=('2d19b66de26dbd01a7980427a0535a8f')



if [[ $CARCH == x86_64 ]]; then
  _installer=warsaw_64_installer.run
  _warsawdir=tmp/warsaw_x64
else
  _installer=warsaw_32_installer.run
  _warsawdir=tmp/warsaw_x86
fi

prepare() {
  cd $srcdir

  # Make sure to have a cleaned up warsaw directory
  [ ! -d $pkgname-$pkgver ] && mkdir $pkgname-$pkgver
  [ -d $_warsawdir ] && rm -rf $_warsawdir

  # Extracts the binary content starting from the line number "L"
  # (L was informed within the installer)
  L=363
  tail -n +$L $_installer | tar -zxvf - -C $pkgname-$pkgver
}

build() {
  cd $pkgname-$pkgver/$_warsawdir
  ./configure --prefix=/usr --sysconfdir=/etc
}

package() {
  cd $pkgname-$pkgver/$_warsawdir
  make DESTDIR="$pkgdir" install

  # Enable executable permission for binaries
  chmod +x "$pkgdir/usr/bin/warsaw/core"
  chmod +x "$pkgdir/usr/bin/warsaw/migratecache"
  chmod +x "$pkgdir/usr/bin/warsaw/wsatspi"
  chmod +x "$pkgdir/usr/bin/warsaw/wscertmgr"

  # Set paths in comply with Arch Packaging Standards
  # i.e. Use /usr/bin, /etc, and /tmp
  sed -i 's|/usr/local/etc|/etc|g;s|/var/tmp|/tmp|' \
    "$pkgdir/usr/bin/warsaw/wscertmgr"
  sed -i 's|/usr/local/bin|/usr/bin|' \
    "$pkgdir/etc/xdg/autostart/warsaw.desktop"

  # this should be replaced to the systemd/openrc daemon
  rm -rf "$pkgdir/etc/xdg/"

  # Install copyright and license in proper directory
  install -Dm644 "$pkgdir"/usr/share/{doc,licenses}/warsaw/copyright
  rm -rf "$pkgdir/usr/share/doc"

  # Fix insecure RPATH to /usr/local/ directories
  chrpath -d "$pkgdir/usr/bin/warsaw/migratecache"
  chrpath -d "$pkgdir/usr/lib/warsaw/wsftuan.so"
  chrpath -d "$pkgdir/usr/lib/warsaw/wslbmid.so"
  chrpath -d "$pkgdir/usr/lib/warsaw/wsftup.so"
  chrpath -d "$pkgdir/usr/lib/warsaw/wsftbmo.so"
  chrpath -d "$pkgdir/usr/lib/warsaw/wsftbco.so"
  chrpath -d "$pkgdir/usr/lib/warsaw/wsftbid.so"
  chrpath -d "$pkgdir/usr/lib/warsaw/wsftdl.so"
  chrpath -d "$pkgdir/usr/lib/warsaw/wsbrmu.so"

  # :: Use systemd or openrc service instead of SysVinit script
  # if user use openrc, so then install warsaw.openrc
  if (pacman -Qi openrc &> /dev/null); then
      # override sysinit to OpenRC script
      install -Dm755 "$srcdir/warsaw.openrc" "$pkgdir/etc/init.d/warsaw"
  else
      install -Dm644 "$srcdir/warsaw.service" \
              "$pkgdir/usr/lib/systemd/system/warsaw.service"
      rm -rf "$pkgdir/etc/init.d"
  fi


  # Symlink to /usr/local, as the binaries still expect them to be valid
  install -dm755 "$pkgdir/usr/local/"{etc,bin,lib}
  ln -s /etc/warsaw/     "$pkgdir/usr/local/etc/warsaw"
  ln -s /usr/bin/warsaw/ "$pkgdir/usr/local/bin/warsaw"
  ln -s /usr/lib/warsaw/ "$pkgdir/usr/local/lib/warsaw"

  # fixing the new 2018 cancer from
  # fbello comments at https://aur.archlinux.org/packages/warsaw/?comments=all
  for i in ld-linux-x86-64.so.2 libc.so.6 libdl.so.2 libpthread.so.0; do
    cp /usr/lib/$i $pkgdir/usr/lib/warsaw/$i
  done

  install -dm755  $pkgdir/etc/sysctl.d/
  cat << EOF > $pkgdir/etc/sysctl.d/warsaw.conf
net.ipv4.tcp_syncookies=1
net.ipv4.tcp_synack_retries=3
net.ipv4.tcp_max_syn_backlog=65536
EOF
}
