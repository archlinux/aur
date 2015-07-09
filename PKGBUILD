# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
# Contributor: Thiago Yukio Kikuchi Oliveira <stratust@gmail.com>

pkgname=globus-toolkit
pkgver=6.0.1433516164
pkgrel=5
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
sha1sums=('2f6c451664d01d238906519ca33a4b4d9fb1217d'
          'ad9c17923fb85224cb134beb79c04871c3a18307'
          '48e2f95145dfa27b0fee81022e33039e8524399c')
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

# vim: ft=sh:ts=2:sw=2:et
