# Maintainer: See AUR page for current maintainer.
# Contributor: Yichao Yu <yyc1992@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=fontconfig-git
pkgver=2.11.94.r1772
pkgrel=1
pkgdesc="A library for configuring and customizing font access"
arch=(i686 x86_64)
url="http://www.fontconfig.org/release/"
license=('custom')
depends=('expat' 'freetype2')
# You need to pick your python poison here and below in the prepare
# section untill I get around to create the python packages.
makedepends=('gperf' 'python')
options=('!libtool')
conflicts=('fontconfig')
provides=('fontconfig')
install=$pkgname.install
source=("$pkgname::git://anongit.freedesktop.org/fontconfig"
        '29-replace-bitmap-fonts.conf')
sha256sums=('SKIP'
            '00911ca1b6e15bb57eb11a5ca5c4f45b721e5bd7a0f57ec2d05091702ae36cde')

pkgver() {
  cd "$pkgname"
  printf "%s.r%s" \
    "$(git describe --abbrev=0 | sed 's/^v//')" \
    "$(git rev-list --count HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  
  # #$&$%&@! upstream forced python extension compiling down our 
  # throats, be cursed. No flags to turn that off.

  # If you want to use Python 2 you know what to do (lots of sed are 
  # involved).
  PYTHON=/usr/bin/python

  # I doubt it is smart to change the dependency from expat to lxml2.
  # I don't like breaking away from upstream packaging
  # too much, unless really needed. 
  # As is, expat works fine; otherwise you are on your own.
  ./autogen.sh --prefix=/usr \
    --sysconfdir=/etc \
    --with-templatedir=/etc/fonts/conf.avail \
    --with-xmldir=/etc/fonts \
    --localstatedir=/var \
    --disable-static \
    --with-default-fonts=/usr/share/fonts \
    --with-add-fonts=/usr/share/fonts
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install

  # Not in upstream, not in FC and not in Gentoo, although this probably should.
  # This satisfies pages like 
  # http://zipcon.net/~swhite/docs/computers/browsers/fonttest.html
  #
  install -dm755 "$pkgdir"/etc/fonts/{conf.d,conf.avail}
  install -m644 "$srcdir/29-replace-bitmap-fonts.conf" \
    "$pkgdir/etc/fonts/conf.avail"
  #
  #
  # Enable configuration below if you want...
  #
  #ln -s /etc/fonts/conf.avail/29-replace-bitmap-fonts.conf \
  #  "$pkgdir/etc/fonts/conf.d"

  #Install license
  install -m755 -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname"
}
