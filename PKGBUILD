# Maintainer: M0Rf30

pkgname=vdr-devel
pkgver=2.1.6
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="The video disk recorder (VDR)"
url="ftp://ftp.tvdr.de/vdr/Developer/"
license=('GPL2')
depends=('fontconfig' 'gettext' 'libjpeg' 'perl')
conflicts=('vdr')
makedepends=('linux-api-headers')
optdepends=('lirc: To use a remote control'
            'runvdr-extreme: An alternative runvdr script'
            'vdrsymbols-ttf: Symbols that some VDR plugins and patches use')
backup=('etc/vdr/channels.conf'
        'etc/vdr/diseqc.conf'
        'etc/vdr/keymacros.conf'
        'etc/vdr/sources.conf'
        'etc/vdr/svdrphosts.conf')
options=(!emptydirs)
install="${pkgname}.install"
source=(ftp://ftp.tvdr.de/vdr/Developer/vdr-${pkgver}.tar.bz2
        Make.config
	vdr.conf
	vdr.service
        vdr-shutdown.sh
	vdr-check-setup.sh
	vdr-config.sh
	vdr-moveto.sh
	vdr.tmpfiles
	vdr.sudoers
	vdr-runvdr.sh
	51-vdr.rules)

build() {
  cd $srcdir/vdr-$pkgver

# Patches
msg2 "Disable some graphs that end up too big to be useful"
	for g in COLLABORATION INCLUDE INCLUDED_BY ; do
	    sed -i -e 's/^\(\s*'$g'_GRAPH\s*=\s*\).*/\1NO/' Doxyfile
	done
  
msg2 "Update lirc socket location in man page"
  sed -i "s|/dev/lircd|/var/run/lirc/lircd|g" vdr.1

msg2 "Don't install runvdr"
  sed -i "s|runvdr ||g" Makefile

  # VDR directory environment (Make.config):
  # MANDIR       = /usr/share/man
  # BINDIR       = /usr/bin
  # LOCDIR       = /usr/share/locale
  # PLUGINLIBDIR = /usr/lib/vdr
  # VIDEODIR     = /var/spool/video
  # CONFDIR      = /etc/vdr
  # Also:
  # VDR_USER = vdr

  cp ../Make.config Make.config
msg2 "Buildin..."
  #unset PREFIX
  make PREFIX=/usr
}

package(){
  cd $srcdir/vdr-$pkgver
  make DESTDIR="$pkgdir" PREFIX=/usr install 
  
  install -d -m755 $pkgdir/usr/bin
  install -d -m755 $pkgdir/usr/include/vdr/include
  install -d -m755 $pkgdir/usr/include/vdr/libsi
  install -d -m755 $pkgdir/usr/share/doc/vdr
  install -d -m755 $pkgdir/etc/vdr/vdr-plugins.d

msg2 "Install utility scripts"
  install -m755 ../vdr-check-setup.sh $pkgdir/usr/bin/vdr-check-setup
  install -m755 ../vdr-config.sh $pkgdir/usr/bin/vdr-config
  install -m755 ../vdr-moveto.sh $pkgdir/usr/bin/vdr-moveto
  chmod +x $pkgdir/usr/bin/*
  install -m755 epg2html $pkgdir/usr/bin/epg2html

msg2 "Install Make.config and vdr header files"
  install -m644 Make.config $pkgdir/usr/include/vdr
  install -m644 *.h $pkgdir/usr/include/vdr
  install -m644 libsi/*.h $pkgdir/usr/include/vdr/libsi
  ln -sf .. $pkgdir/usr/include/vdr/include/vdr
  ln -sf ../libsi $pkgdir/usr/include/vdr/include/libsi

msg2 "Install udev rules"
  mkdir -p $pkgdir/usr/lib/udev/rules.d/
  cp $srcdir/51-vdr.rules $pkgdir/usr/lib/udev/rules.d/51-vdr.rules
  chmod a+r $pkgdir/usr/lib/udev/rules.d/51-vdr.rules

msg2 "Init services file" 
  install -D -m644 ../vdr.conf $pkgdir/etc/vdr/vdr
  install -D -m644 ../vdr.service $pkgdir/usr/lib/systemd/system/vdr.service
  install -D -m644 ../vdr.tmpfiles $pkgdir/usr/lib/tmpfiles.d/vdr.conf
  install -m644 ../vdr-runvdr.sh $pkgdir/usr/sbin/runvdr
  chmod +x $pkgdir/usr/sbin/runvdr

msg2 "Sudoers file"
  install -D -m755 ../vdr.sudoers $pkgdir/etc/sudoers.d/vdr
msg2 "Vdr-shutdown.sh"
  install -m755 $srcdir/vdr-shutdown.sh $pkgdir/usr/bin/vdr-shutdown.sh

msg2 "Install documents"
  for _document in channels.conf* *.template CONTRIBUTORS HISTORY INSTALL MANUAL PLUGINS.html README* UPDATE*; do
    install -m644 ${_document} $pkgdir/usr/share/doc/vdr
  done
}

md5sums=('79519dac59166fabc2029b916bd61d00'
         'b2daabab143f879e8fb02f939d942202'
         '729bd6dffe7493f30b70f1a76ba8da43'
         'b216bcc3c7f44f9d47284a2df54f62a4'
         'd96642acceb658209d7a4d3867a9dab4'
         '7cc69205b789906a59563fe94bd03db7'
         '39ea8344b770a9f9fba7b71f1e2640da'
         '01b49f61a78690e8894ab662e84d6f2f'
         '3b19cfb57d7632246798f115bf60b4cb'
         'a05c9ef5d30e33d5ea5bee43c72eac31'
         'e867e399822ca441e60c8daa7867ba11'
         'cb8ce90f5602fa99e13f72be57ad0954')
