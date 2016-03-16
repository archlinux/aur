# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
# Contributor: Thiago Yukio Kikuchi Oliveira <stratust@gmail.com>

pkgname=globus-toolkit
pkgver=6.0.1453307864
pkgrel=1
pkgdesc="Toolkit for building grids"
arch=('i686' 'x86_64')
url="http://toolkit.globus.org/"
license=('APACHE')
optdepends=("igtf-trust-anchors: EUGridPMA trusted certificate authorities")
provides=(globus=$pkgver gsissh=6.4p1 myproxy=$pkgver)
replaces=(globus)
conflicts=(globus myproxy)
source=(http://toolkit.globus.org/ftppub/gt6/installers/src/globus_toolkit-$pkgver.tar.gz
        globus.sysusers)
sha512sums=('b2963b9b99e962dd4ab7db8eb129e8b1e64cadffaca8a55276e26e9ee9fa8ce2052859d01e3fad1b54c5b70b3322d4669d1ff0e1ef62032e0017771296c65610'
            'd2283c775e549e6e72366887a592248b1ae46a83134034fd66c05982e2fb5fde8300e6f68a5b52818adfc53656e77086dcf767b93759868cb3797dae2777cb00')
install="globus.install"
options=(!emptydirs)

build() {
  cd "globus_toolkit-$pkgver"
  #./configure --prefix=/opt/globus --libdir=/opt/globus/usr/lib
  # "libtool: cannot install to a path not ending in /usr/lib"
  ./configure -C \
    --prefix=/usr                     \
    --sbindir=/usr/bin                \
    --sysconfdir=/etc/globus          \
    --includedir=/usr/include/globus  \
    --enable-myproxy                  ;
  make
}

package() {
  cd "globus_toolkit-$pkgver"
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir"/usr/share/doc/globus/
  mv "$pkgdir"/etc/globus/*.default "$pkgdir"/usr/share/doc/globus/
  mv "$pkgdir"/etc/globus/init.d    "$pkgdir"/usr/share/doc/globus/
  mv "$pkgdir"/usr/bin/sshd         "$pkgdir"/usr/bin/ssh.d/sshd
  mv "$pkgdir"/usr/doc/gsi_openssh  "$pkgdir"/usr/share/doc/

  cd "$srcdir"
  install -Dm 644 globus.sysusers "$pkgdir"/usr/lib/sysusers.d/globus.conf
}

# vim: ft=sh:ts=2:sw=2:et:nowrap
