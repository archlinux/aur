# Maintainer: Manuel Barrio Linares <mbarriolinares at gmail dot com>
# contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Andrew Simmons <andrew.simmons@gmail.com>

pkgbase=xarchiver-git
pkgname=(xarchiver-git xarchiver-gtk2-git)
pkgver=0.5.4.25.94.g8b56b0b3
pkgrel=2
pkgdesc="GTK+ frontend to various command line archivers"
arch=(x86_64)
url="https://github.com/ib/xarchiver"
license=(GPL)
depends=(gtk2 gtk3)
makedepends=(docbook-xsl intltool xmlto)
optdepends=('arj: ARJ support'
            'binutils: deb support'
            'bzip2: bzip2 support'
            'cpio: RPM support'
            'gzip: gzip support'
            'lha: LHA support'
            'lrzip: lrzip support'
            'lz4: LZ4 support'
            'lzip: lzip support'
            'lzop: LZOP support'
            'p7zip: 7z support'
            'tar: tar support'
            'unarj: ARJ support'
            'unrar: RAR support'
            'unzip: ZIP support'
            'xdg-utils: recognize more file types to open'
            'xz: xz support'
            'zip: ZIP support'
            'zstd: zstd support')
source=("git+$url.git"
        xarchiver.appdata.xml)
sha256sums=('SKIP'
            '55f41aa0e5569b446933a34ac0585443fa5bd92f03f47e1fd53daf19905cc97e')

pkgver() {
  cd "$srcdir/xarchiver"
  git describe --tags | sed 's/^v//;s/-/./g'
}

build() {
	cd "$srcdir"
  # GTK+ 3 version
  [ -d gtk3 ] || cp -r xarchiver gtk3
  cd gtk3
  ./configure --prefix=/usr --libexecdir=/usr/lib/xfce4
  make

  cd "$srcdir"
  # GTK+ 2 version
  [ -d gtk2 ] || cp -r xarchiver gtk2
  cd gtk2
  ./configure --prefix=/usr --libexecdir=/usr/lib/xfce4 --enable-gtk2
  make
}

package_xarchiver-git() {
  depends=(gtk3)
  provides=(xarchiver)
  conflicts=(xarchiver)
  	
  cd gtk3
  make DESTDIR="$pkgdir" install
  install -Dm644 ../xarchiver.appdata.xml "$pkgdir/usr/share/metainfo/xarchiver.appdata.xml"
}

package_xarchiver-gtk2-git() {
  pkgdesc+=' (GTK+ 2 version)'
  depends=(gtk2)
  provides=(xarchiver)
  conflicts=(xarchiver xarchiver-git)
  
  cd gtk2
  make DESTDIR="$pkgdir" install

  # Ignore package by AppStream to avoid duplicated IDs
  echo 'X-AppStream-Ignore=true' >> "$pkgdir/usr/share/applications/xarchiver.desktop"
}
