# Maintainer: Grega Vrbancic <grega.vrbancic@gmail.com>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>
# Contributor: Thiago Yukio Kikuchi Oliveira <stratust@gmail.com>

pkgname=globus-toolkit
pkgver=6.0.1558548600
pkgrel=1
pkgdesc="Toolkit for building grids"
arch=('i686' 'x86_64')
url="http://toolkit.globus.org/"
license=('APACHE')
optdepends=("igtf-trust-anchors: EUGridPMA trusted certificate authorities")
provides=(globus=$pkgver gsissh=6.4p1 myproxy=$pkgver)
replaces=(globus)
conflicts=(globus myproxy)
source=(https://downloads.globus.org/toolkit/gt6/stable/installers/src/globus_toolkit-$pkgver.tar.gz
        globus.sysusers)
sha512sums=('05a112e32129430644b5222205b125a022c5a934765a42a7527ab2d1e7367497e5dd5078b8b45154d74c65938ce74f21e4c606bb9f822f9ac15e5df772c2d8e8'
            'd2283c775e549e6e72366887a592248b1ae46a83134034fd66c05982e2fb5fde8300e6f68a5b52818adfc53656e77086dcf767b93759868cb3797dae2777cb00')
install="globus.install"
options=(!emptydirs)

build() {
  cd "globus_toolkit-$pkgver"
  #./configure --prefix=/opt/globus --libdir=/opt/globus/usr/lib
  # "libtool: cannot install to a path not ending in /usr/lib"
  ./configure -C \
    --prefix=/usr                     \
    --includedir=/usr/include/globus  \
    --libexecdir=/usr/lib/$pkgname    \
    --sbindir=/usr/bin                \
    --sysconfdir=/etc/globus          \
    --enable-myproxy                  ;
  make
}

package() {
  cd "globus_toolkit-$pkgver"
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir"/usr/share/doc/globus/
  mv "$pkgdir"/etc/globus/*.default "$pkgdir"/usr/share/doc/globus/
  mv "$pkgdir"/etc/globus/init.d    "$pkgdir"/usr/share/doc/globus/

  cd "$srcdir"
  install -Dm 644 globus.sysusers "$pkgdir"/usr/lib/sysusers.d/globus.conf
}
