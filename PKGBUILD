pkgname=amule-git
pkgver=2.4.0.r10287.34c7d73
pkgrel=1
pkgdesc='Client for the eD2k and Kad networks'
arch=(i686 x86_64)
url=http://amule.org/
license=(GPL)
depends=(crypto++ desktop-file-utils gd geoip libupnp wxgtk2.8)
makedepends=(git)
provides=(amule)
conflicts=(amule)
backup=(usr/share/webapps/amps/index.php
        usr/share/webapps/amps/style.css)
install=amule.install
source=(
git+https://github.com/amule-project/amule.git
http://svgicons.o7a.net/unofficial/amule.png
https://anonscm.debian.org/cgit/pkg-amule/amule.git/plain/debian/patches/configure_ignore_gdlib-config_garbage.diff
https://anonscm.debian.org/cgit/pkg-amule/amule.git/plain/debian/patches/mime-ed2k-protocol.patch
https://anonscm.debian.org/cgit/pkg-amule/amule.git/plain/debian/patches/use_xdg-open_as_preview_default.diff
https://anonscm.debian.org/cgit/pkg-amule/amule.git/plain/debian/patches/version_check.diff
https://raw.githubusercontent.com/microcai/gentoo-zh/master/net-p2p/amule-dlp/files/amule-dlp-scanner-header.patch
https://raw.githubusercontent.com/pld-linux/aMule/master/aMule-cas-datadir.patch
https://raw.githubusercontent.com/pld-linux/aMule/master/build.patch
)
sha256sums=(SKIP
            737873e5f29dabaca6f9ac96b612eda8cba0236b6618e380107ea7d1d7665b78
            505f70995a56d748f853265fba84a1bbdfbb0291195842b69e76370013239a6e
            255d99552136712416b3270bb26d2622d1f0d3724891457e4221e67431a0606f
            902f8f719c1c02335880621717f23c683da8edbb31add75d3e1267b190e03b9c
            0904ff6a1dfa298f452332831345feb4aa6575668a8b092b3cc6edfbfed974fe
            04db8bbb57834174148c48da4f02832c413a8911eb5ace0ee11190990b875ff9
            897ac890b5f1b8cb4b53fded313cb2779bed5d39041a320885dd9dbe30878879
            a76b5fe7042e226ccc048fce68006845b942a5400e31ebb42ff4530ff60b2eb8)

pkgver() {
  cd amule

  printf %s.r%s.%s $(grep '#define VERSION' src/include/common/ClientVersion.h |
    cut -d \" -f2) $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
  cd amule

  sed -i '15,$ d' $srcdir/amule-dlp-scanner-header.patch
  sed -i '12,$ d' $srcdir/configure_ignore_gdlib-config_garbage.diff

  patch -Np1 < $srcdir/aMule-cas-datadir.patch
  patch -Np1 < $srcdir/amule-dlp-scanner-header.patch
  patch -Np1 < $srcdir/build.patch
  patch -Np1 < $srcdir/configure_ignore_gdlib-config_garbage.diff
  patch -Np1 < $srcdir/mime-ed2k-protocol.patch
  patch -Np1 < $srcdir/use_xdg-open_as_preview_default.diff
  patch -Np1 < $srcdir/version_check.diff

  sed -i 's/Categories=Network;P2P;/Categories=GTK;Network;P2P;/' amule.desktop
  sed -i 's\./LucidaSansRegular.ttf\/usr/share/fonts/TTF/DejaVuSans.ttf\' src/utils/amps/index.php
  sed -i 's\/usr/share/fonts/corefonts/times.ttf\/usr/share/fonts/TTF/DejaVuSerif.ttf\' \
    src/utils/cas/configfile.c
}

build() {
  cd amule

  ./autogen.sh

  local confopts=(
    --disable-debug
    --disable-rpath
    --enable-alcc
    --enable-amule-daemon
    --enable-amulecmd
    --enable-cas
    --enable-ccache
    --enable-fileview
    --enable-geoip
    --enable-mmap
    --enable-optimize
    --enable-webserver
    --enable-xas
    --prefix=/usr
    --with-wx-config=wx-config-2.8
  )

  ./configure ${confopts[@]}

  make
}

package() {
  cd amule

  make DESTDIR=$pkgdir install

  rm $pkgdir/usr/share/pixmaps/amule.*
  install -m644 $srcdir/amule.png $pkgdir/usr/share/pixmaps

  install src/utils/fileview/mulefileview $pkgdir/usr/bin
  ln -rs $pkgdir/usr/bin/mulefileview $pkgdir/usr/bin/fileview

  install -d $pkgdir/usr/share/webapps/amps
  install -m644 $(find src/utils/amps -maxdepth 1 -type f) $pkgdir/usr/share/webapps/amps
  install -d $pkgdir/usr/share/webapps/amps/langs
  install -m644 src/utils/amps/langs/* $pkgdir/usr/share/webapps/amps/langs
  install -d $pkgdir/usr/share/webapps/amps/images
  install -m644 src/utils/amps/images/* $pkgdir/usr/share/webapps/amps/images

  install -m644 *.txt docs/{*.dia,AUTHORS,COPYING,README.*} README* $pkgdir/usr/share/doc/amule

  install -d $pkgdir/usr/share/doc/amule/cas
  install -m644 src/utils/cas/README $pkgdir/usr/share/doc/amule/cas

  install -d $pkgdir/usr/share/doc/amps
  ln -rs $pkgdir/usr/share/webapps/amps/{CHANGELOG,COPYING,README,SETTINGS,TODO} \
    $pkgdir/usr/share/doc/amps
  ln -rs $pkgdir/usr/share/doc/amps $pkgdir/usr/share/doc/amule
}
