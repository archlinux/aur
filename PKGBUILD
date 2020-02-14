# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Danto <danto@lavabit.com>
# Contributor: Mario Blättermann <mariobl@gnome.org>
pkgname=wmdrawer
pkgver=0.10.5
pkgrel=4
pkgdesc="Dockapp with retractable button bar to launch applications"
arch=('i686' 'x86_64')
url="http://people.easter-eggs.org/~valos/wmdrawer/"
license=('GPL')
groups=(x11)
depends=('libxt' 'gdk-pixbuf')
source=(http://people.easter-eggs.org/~valos/wmdrawer/$pkgname-$pkgver.tar.gz)
md5sums=(608bf2f75fdd084f8e63764c31a2a9a5)

prepare() {
  cd $pkgname-$pkgver

# sed -r -i 's,CFLAGS = -O3 -Wall (.*),CFLAGS += \1,;s,LDFLAGS = ,LDFLAGS += ,' Makefile
  sed -r -i 's,CFLAGS = -O3 -Wall (.*),CFLAGS += \1,' Makefile
}

build() {
  cd $pkgname-$pkgver

  make clean
  make INCLUDES=-I/usr/include/X11
}

package() {
  cd $pkgname-$pkgver

  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/doc/$pkgname/
  mkdir -p $pkgdir/usr/share/man/man1/
  /usr/bin/install -c $pkgname $pkgdir/usr/bin/wmdrawer-bin
  /usr/bin/install -c ./doc/$pkgname.1x.gz $pkgdir/usr/share/man/man1/
  /usr/bin/install -c AUTHORS README TODO wmdrawerrc.example $pkgdir/usr/share/doc/$pkgname

#startup script
cat > $pkgdir/usr/bin/wmdrawer << EOF
#!/bin/bash
#test if file already exists
#if yes, then launch

if (test -e \$HOME/.wmdrawerrc) then
         exec wmdrawer-bin

#if no, get /usr/share/doc/wmdrawer/wmdrawerrc.example and copy to \$HOME
else
        cp /usr/share/doc/wmdrawer/wmdrawerrc.example  \$HOME/.wmdrawerrc
        exec wmdrawer-bin
fi
EOF

  chmod +x $pkgdir/usr/bin/wmdrawer
}
