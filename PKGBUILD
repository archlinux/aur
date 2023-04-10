# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=kobodeluxe
pkgver=0.5.1
pkgrel=14
pkgdesc='3rd person scrolling 2D shooter'
arch=(x86_64)
url='http://www.olofson.net/kobodl/'
license=(GPL LGPL)
depends=(
  'hicolor-icon-theme'
  'sdl_image'
)
source=(
  "http://www.olofson.net/kobodl/download/KoboDeluxe-${pkgver}.tar.gz"
  "http://deb.debian.org/debian/pool/main/k/kobodeluxe/kobodeluxe_0.5.1-10.debian.tar.xz"
)
sha256sums=(
  '2d5a4c3cd573e39640d4fdf81517eff7cb13fd6d433fc053563e79bb18b8071a'
  '646102c0e8699dbd1c6d01a4a2bfdc362295414ec1f26c0195d3fba763adca42'
)

prepare() {
  cd "KoboDeluxe-$pkgver"

  xargs -a "$srcdir/debian/patches/series" -d "\n" -i -P 1 \
    -- patch -p 1 -i "$srcdir/debian/patches/{}"

  tar xf icons.tar.gz

  # Fix paths and file names
  sed -i -e 's:kobo-deluxe:kobodeluxe:' configure{,.in} data/{gfx,sfx}/Makefile{.in,.am}

  # Fix .desktop file
  sed -i -e 's:^Exec=kobodl$:Exec=kobodeluxe:' "icons/KDE/kobo-deluxe.desktop"
  sed -i -e 's:^Categories=Qt;KDE;Game;ArcadeGame$:Categories=Qt;KDE;Game:' "icons/KDE/kobo-deluxe.desktop"

  # Fix scores directory
  sed -Ei -e 's@^(install-data-hook:)\t\$\(.*\)$@\1\n\tmkdir -p $(DESTDIR)$(kobo_scoredir)@' Makefile.am

  # silence filename warning
  cp configure.in configure.am

  autoreconf -vfi
}

build() {
  cd "KoboDeluxe-$pkgver"
  ./configure \
    --prefix=/usr \
    --localstatedir=/var \
    --sharedstatedir=/var/lib
  make
}

package() {
  cd "KoboDeluxe-$pkgver"
  DESTDIR="$pkgdir" make install

  mv "$pkgdir/usr/bin/kobodl" "$pkgdir/usr/bin/kobodeluxe"

  install -D -m644 "icons/KDE/kobo-deluxe.desktop" \
    "$pkgdir/usr/share/applications/kobodeluxe.desktop"

  for i in 16 22 32 48 64 128 ; do
    install -Dm644 "icons/KDE/icons/${i}x${i}/kobodl.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}x$i/apps/kobodl.png"
  done
}
