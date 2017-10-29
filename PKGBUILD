# Maintainer: Det
# Contributors: Joris Steyn, Florian Dejonckheere, Tevin Zhang, Andrea Fagiani, Biru Ionut, Paul Bredbury
# Installation order:  freetype2 → fontconfig-ubuntu → cairo-ubuntu

pkgname=fontconfig-ubuntu
pkgver=2.12.6
_ubver=0ubuntu1
pkgrel=1
pkgdesc="Library for configuring and customizing font access - with Ubuntu's patches"
arch=('i686' 'x86_64')
url="https://launchpad.net/ubuntu/+source/fontconfig"
license=('custom')
depends=('expat' 'freetype2')
makedepends=('python2' 'docbook2x')
conflicts=('fontconfig')
provides=("fontconfig=$pkgver")
options=('!libtool')
install=$pkgname.install
source=("https://launchpad.net/ubuntu/+archive/primary/+files/fontconfig_$pkgver.orig.tar.bz2"
        "https://launchpad.net/ubuntu/+archive/primary/+files/fontconfig_$pkgver-$_ubver.debian.tar.xz"
        '53-monospace-lcd-filter.patch')
sha256sums=('cf0c30807d08f6a28ab46c61b8dbd55c97d2f292cf88f3a07d3384687f31f017'
            '6e44e884856924986ec3637cc38d0a759934d4d065ffd65fa25dd8c9d36bc844'
            'c759702ba66fe88768aa93035637401085bb5c02d898c960b68291aea10daa8d')

# nice pages to test font matching:
# http://zipcon.net/~swhite/docs/computers/browsers/fonttest.html
# http://getemoji.com/

prepare() {
  cd fontconfig-$pkgver

  # Loop Debian patches
  for _f in $(cat ../debian/patches/series); do
    msg2 "Applying Debian patch: $_f"
    patch -Np1 -i "../debian/patches/$_f"
  done

  ## patch
  #patch -p1 -i conf.d/53-monospace-lcd-filter.conf ../53-monospace-lcd-filter.patch
}

build() {
  cd fontconfig-$pkgver

  msg2 "Running ./configure.."
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --with-templatedir=/etc/fonts/conf.avail \
    --with-xmldir=/etc/fonts \
    --localstatedir=/var \
    --disable-static \
    --with-default-fonts=/usr/share/fonts \
    --with-add-fonts=/usr/share/fonts

  msg2 "Running make.."
  make
}

package() {
  cd fontconfig-$pkgver

  msg2 "Running 'make install'.."
  make DESTDIR="$pkgdir" install

  # License
  install -Dm0644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING

  # Docs
  install -Dm0644 ../debian/changelog "$pkgdir"/usr/share/doc/fontconfig/changelog
}
