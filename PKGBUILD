# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: benetnash<starbreaker@op.pl>
# Contributor: Mario Blättermann <mariobl@gnome.org>
pkgname=wmappl
pkgver=0.71
pkgrel=5
pkgdesc="wmappl is a simple scrolling application launcher for the WindowMaker dock"
arch=('i686' 'x86_64')
url="http://wmappl.sourceforge.net"
license="GPL"
depends=('libxpm' 'imlib2')
source=(ftp://ftp.uni-kl.de/pub/linux/gentoo/distfiles/$pkgname-$pkgver.tar.gz)
md5sums=('a72ed0dba969ff0e5e507680bf40fdd6')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man --enable-Imlib2
  make || return 1
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  mv $pkgdir/usr/bin/wmappl $pkgdir/usr/bin/wmappl-bin

# Generating default config
mkdir -p $pkgdir/usr/share/wmappl/
cat > $pkgdir/usr/share/wmappl/wmapplrc-default << EOF
[wmappl]
    iconpath=/usr/share/icons/wmappl:/usr/share/pixmaps/mini
    name=Demo
    window=
    debug=
    
    [info] 
    icon = info.xpm
    command = xmessage "Reports bugs to: \
    wmappl.sourceforge.net" &
    tooltip = wmappl information
    
    [man wmappl]
    icon = wmappl.xpm
    command = xterm -fg white -bg black -e man wmappl &
    tooltip = open the wmappl man page
    
    [wprefs]
    icon = gnustep.xpm
    command = /usr/share/GNUstep/WPrefs.app/WPrefs &
    
    [mozilla]
    icon = mozilla.xpm
    command = mozilla &
    
    [xterm]
    icon = glowx.xpm
    command = xterm &
    
    [ghostview]
    icon = ghost.xpm
    command = gv &
    
    [xmms] 
    icon = xmms.xpm
    command = xmms &
    tooltip = xmms gets a really really really   \
              really really really really really \
              really really really really really \
              long tooltip!
    
    [ssh to work]
    icon = ssh.xpm
    command = xterm -fg green -bg black \
              -e ssh -l user shell.work.com &

EOF

#startup script
cat > $pkgdir/usr/bin/wmappl << EOF
#!/bin/bash
#test if file already exists
#if yes, then launch

if (test -e \$HOME/.wmapplrc) then
         exec wmappl-bin

#if no, get /usr/share/wmapplrc-default and copy to \$HOME
else
        cp /usr/share/wmappl/wmapplrc-default  \$HOME/.wmapplrc
        exec wmappl-bin
fi
EOF

  chmod +x $pkgdir/usr/bin/wmappl
}

