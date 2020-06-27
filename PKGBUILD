# Maintainer: Applebloom <rat.o.drat@gmail.com>

pkgname=gimp-plugin-laso
pkgver=1.0
pkgrel=2
pkgdesc="Selection tool using active contour models (aka snakes)."
arch=('i686' 'x86_64')
url="https://github.com/pixlsus/registry.gimp.org_static"
license=('unknown')
depends=('gimp')
source=("https://github.com/pixlsus/registry.gimp.org_static/raw/master/registry.gimp.org/files/gimp-laso-devel_3.zip"
        "https://github.com/pixlsus/registry.gimp.org_static/raw/master/registry.gimp.org/files/gimp-laso-share.zip")
md5sums=('65b59063a06234c747a6c585795ab6e6'
         '55d39232eaa0c3a45e47cf6594adf415')

build() {
  cd "gimp-laso-devel"
  cc src/*.c -o "laso" `pkg-config --cflags --libs gimp-2.0` \
  `pkg-config --cflags --libs gimpui-2.0` -lm $CFLAGS $CPPFLAGS
}

package() {
  cd "gimp-laso-devel"
  
  install -Dm755 "laso" "$pkgdir/usr/lib/gimp/2.0/plug-ins/laso"
  
  for i in locale/*
  do
    msgfmt -o "$i/gimp20-plugin-laso.mo" "$i/gimp20-plugin-laso.po"
    install -Dm644 "$i/gimp20-plugin-laso.po" \
    "$pkgdir/usr/share/$i/LC_MESSAGES/gimp20-plugin-laso.mo"
  done

  cd "../GIMP-2.0"
  find "share/gimp" -type f -exec install -Dm644 {} "$pkgdir/usr/"{} \;
}
