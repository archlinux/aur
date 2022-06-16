# Maintainer: Brian Cole <arch at brianEcole dot com>
# Contributor: Ecmel Ercan <ecmel dot ercan at gmail dot com>
# Contributor: Vain <aurmaint1 on host: uninformativ dot de>
# Contributor: BlindPenguin <ferdinand holzner at gmail dot com>

_gitname=cdesktopenv
pkgname="$_gitname"-git
pkgver=2.4.0.778.g2a988df4c
pkgrel=1
pkgdesc="Common Desktop Environment"
url="http://sourceforge.net/projects/cdesktopenv/"
arch=('i686' 'x86_64') # Some parts of CDE are not stable on x86_64 yet.
license=('LGPL2')
options=(!strip !zipman)
install="cdesktopenv.install"
depends=(openmotif xbitmaps rpcbind mksh ncurses libxss xbitmaps libxinerama libutempter rpcsvc-proto xorg-mkfontdir xorg-bdftopcf xorg-xrdb libxpm libxaw)
makedepends=(tcl ncompress bison)
optdepends=('xorg-fonts-100dpi: additional fonts'
            'cups: for printing support'
            'xinetd: for rpc services')
conflicts=('cdesktopenv')
backup=('etc/dt/config/xfonts/C/fonts.alias')
source=("git+https://git.code.sf.net/p/cdesktopenv/code"
        'cdesktopenv.install'
        'dtlogin.service'
        'fonts.alias'
        'fonts.dir'
        'startxsession.sh'
        'cde.desktop'
        'mksh.patch'
        'fonts_alias.patch')

sha512sums=('SKIP'
            '1964e5150fa7e29905f19651834ff7c609a69a1a652b30350bb6c6f89aa282fd7b3057f4a025c8dabb3f0b5c98a2afe512e2a77a78893e9a935d5987bd954545'
            'a14176bc2b9e7cc163965fe1c53e12b3bee7e2ca47e91ec9508666f6a91576ae658ff009cf4f2c22dd06d98e3b098c90f5019896a6fa7fde6cf9810a805798a8'
            '69b740e1d8925f0dd2df09a206e3c36c1331af1617085610689067d1042a031b442fdeff502a36a895265abb4c1f899fa6ed2df6c60df8a60f8835e037c10067'
            'a546d1300f49037a465ecec8bc1ebd07d57015a5ff1abfa1c94da9b30576933fb68e3898ff764d4de6e6741da822a7c93adc6e845806a266a63aa14c8bb09ebb'
            'fdeea1adaf0de5da63e3cc8760893451e7ad1b2bb5c383f70208e3ac62e8fbce3092d6036e70ac46d4ccfb0a4884029cbf0088e58e56004bc9aeb7aa53983548'
            'bc7e4f7430c6d939459faa97aac1f43c87c08828f751933b6f9247040e3eec8ea0194260b020e90e71ccb4d51198d403e7687155a87d3e9fb409a233bd768881'
            '4821925f902481bf59cda0f7a51b35c834c80f676e37608030e7cd64b1e18269cd7cbe1f37cffedd0f1205a6621f51c1b22293c959cffa3602bfdcdba82fd8f4'
            'c7f34130a7d4881584bdf7592a218c8eb18f017e05e87b27020a170858fc5040e73806fcb2ad6fa37abc7114a431fc143400f79831a57aab35bac083e5158520')

pkgver() {
    cd "$srcdir/code/cde"
    git describe --long --tags | sed 's/-/./g'
}

prepare() {
  # Sets autoconf to accept mksh, which is much easier to build then the original ksh93
  patch -p1 -i mksh.patch
  # Bug in build where it tries to find a file in the /usr directory
  patch -p1 -i fonts_alias.patch
}

build() {
    cd "$srcdir/code/cde"
	./autogen.sh
	./configure --with-gnu-ld --prefix=/usr/dt
	make LDFLAGS=-lm

}

package() {

  cd "$srcdir/code/cde"

  (
    export LANG=C
    export LC_ALL=C
    make DESTDIR="$pkgdir" install
  )

  mkdir -p "$pkgdir/var/dt/"
  cd "$pkgdir/var/dt"

  chmod 755 .
  chown bin .
  chgrp bin .
  mkdir -p appconfig/appmanager
  mkdir -p tmp
  chmod -R 755 *
  chown -R bin *
  chgrp -R bin *

  mkdir -p "$pkgdir/etc/dt/"
  cd "$pkgdir/etc/dt/"
  chmod 755 .
  mkdir -p appconfig/appmanager/C
  mkdir -p appconfig/help/C
  mkdir -p appconfig/icons/C
  mkdir -p appconfig/types/C
  mkdir -p config/Xsession.d
  mkdir -p config/xfonts/C
  chmod -R 755 *

  chmod a+x $srcdir/startxsession.sh
  install -m644 "$srcdir"/fonts.{alias,dir} "$pkgdir/etc/dt/config/xfonts/C/"
  
  install -Dm644 "$srcdir/cde.desktop" \
                 "$pkgdir/usr/share/xsessions/cde.desktop"
  install -Dm644 "$srcdir/dtlogin.service" \
                 "$pkgdir/usr/lib/systemd/system/dtlogin.service" 

  install -dm755 "$pkgdir/usr/spool"
  install -dm755 "$pkgdir/var/spool/calendar"
  install -Dm644 "$srcdir/code/cde/contrib/xinetd/cmsd" \
                 "$pkgdir/etc/xinetd.d/cmsd"
  install -Dm644 "$srcdir/code/cde/contrib/xinetd/ttdbserver" \
                 "$pkgdir/etc/xinetd.d/ttdbserver"
  install -Dm644 "$srcdir/startxsession.sh" \
		 "$pkgdir/usr/bin/startxsession.sh"
}
