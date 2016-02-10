# Mantainer: Julio González <juliolokoo at gmail dot com>
# Contributor: Jose Valecillos <valecillosjg (at) gmail (dot) com>
# Contributor: Thiago Perrotta <echo dGhpYWdvcGVycm90dGE5NUBnbWFpbC5jb20K | base64 -d >
pkgname=xampp
pkgver=5.6.15
pkgrel=2
pkgdesc="A free and open source cross-platform web server package (LAMP Stack), consisting mainly of the Apache HTTP Server, MySQL database, and interpreters for scripts written in the PHP and Perl programming languages"
url="http://www.apachefriends.org/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('net-tools')
makedepends=('proot-bin')
[ "$CARCH" = "i686" ] && source=("xampp-installer"::"https://www.apachefriends.org/xampp-files/${pkgver}/${pkgname}-linux-${pkgver}-1-installer.run" "lampp.service")
[ "$CARCH" = "x86_64" ] && source=("xampp-installer"::"https://www.apachefriends.org/xampp-files/${pkgver}/${pkgname}-linux-x64-${pkgver}-1-installer.run" "lampp.service")
options=(!strip)
install=xampp.install
[ "$CARCH" = "i686" ] && md5sums=('23ab874b81cc1db6cf33e5d87e64ee35' 'db1881f9564f18ed34d877035c28a4b8')
[ "$CARCH" = "x86_64" ] && md5sums=('15a591f524051c1fdeefff5a1689dd74' 'db1881f9564f18ed34d877035c28a4b8')

package() {
  install -dm755 "${pkgdir}/opt/lampp"

  msg "Extracting package to a chroot..."
  chmod +x "${srcdir}/xampp-installer"
  echo "Y" | proot -b "${pkgdir}/opt/lampp:/opt/lampp" "${srcdir}/xampp-installer" --mode text
  chmod g-s -R "${pkgdir}"/opt/lampp

  # licenses
  install -dm755 "${pkgdir}"/usr/share/licenses/xampp
  cp "${pkgdir}"/opt/lampp/licenses/* "${pkgdir}"/usr/share/licenses/xampp

  # /usr/bin executables
  install -dm755 "${pkgdir}"/usr/bin
  ln -sf /opt/lampp/lampp "${pkgdir}"/usr/bin/xampp
  ln -sf /opt/lampp/lampp "${pkgdir}"/usr/bin/lampp

  # systemd service
  mkdir -p $pkgdir/etc/systemd/system
  cp $srcdir/lampp.service $pkgdir/etc/systemd/system
}
