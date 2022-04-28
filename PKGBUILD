# Maintainer: afterSt0rm <ateles.1@gmail.com>
# Contributor: Rafael Fontenlle <rafaelff@gnome.org>

pkgname=warsaw
pkgver=1.12.3.11
pkgrel=3
pkgdesc="Banking security tool developed by GAS Tecnologia"
arch=(x86_64)
url="https://seg.bb.com.br"
license=('custom')
depends=('openssl' 'nss')
makedepends=('chrpath')
options=(!strip)
conflicts=('warsaw-bin')
provides=('warsaw')
source=(warsaw.service)
source_x86_64=(https://cloud.gastecnologia.com.br/bb/downloads/ws/warsaw_64_installer.run)
sha256sums=('dde06741817b8b77d9b1150bd10110d8b22330f8e2900fcae06dcedeee10a09e')
sha256sums_x86_64=('d8d637a2910aed6ab5e9baa9d2bd85c00259ee133e4aa6219bbf7d1dd3b04f40')

_installer=warsaw_64_installer.run
_warsawdir=tmp/warsaw_x64

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
  
    # Use systemd service instead of SysVinit script
  install -Dm644 "$srcdir/warsaw.service" \
    "$pkgdir/usr/lib/systemd/system/warsaw.service"
  rm -rf "$pkgdir/etc/init.d"
  
    # Use native libraries
  rm "$pkgdir/usr/lib/warsaw/ld-linux-x86-64.so.2"
  rm "$pkgdir/usr/lib/warsaw/libc.so.6"
  rm "$pkgdir/usr/lib/warsaw/libpthread.so.0"
  rm "$pkgdir/usr/lib/warsaw/libdl.so.2"
  rm "$pkgdir/usr/lib/warsaw/librt.so.1"

  ln -s /usr/lib/ld-linux-x86-64.so.2 "$pkgdir/usr/lib/warsaw/ld-linux-x86-64.so.2"
  ln -s /usr/lib/libc.so.6 "$pkgdir/usr/lib/warsaw/libc.so.6"
  ln -s /usr/lib/libpthread.so.0 "$pkgdir/usr/lib/warsaw/libpthread.so.0"
  ln -s /usr/lib/libdl.so.2 "$pkgdir/usr/lib/warsaw/libdl.so.2"
  ln -s /usr/lib/librt.so.1 "$pkgdir/usr/lib/warsaw/librt.so.1"

    # Fix .desktop file
  sed -i 's/X-GNOME-AutoRestart=true/X-GNOME-AutoRestart=false/g' "$pkgdir/etc/xdg/autostart/warsaw.desktop"

    # Symlink to /usr/local, as the binaries still expect them to be valid
  install -dm755 "$pkgdir/usr/local/"{etc,bin,lib}
  ln -s /etc/warsaw/     "$pkgdir/usr/local/etc/warsaw"
  ln -s /usr/bin/warsaw/ "$pkgdir/usr/local/bin/warsaw"
  ln -s /usr/lib/warsaw/ "$pkgdir/usr/local/lib/warsaw"
}
