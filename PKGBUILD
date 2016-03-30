# Mantainer: Julio González <juliolokoo at gmail dot com>
# Contributor: Jose Valecillos <valecillosjg (at) gmail (dot) com>
# Contributor: Thiago Perrotta <echo dGhpYWdvcGVycm90dGE5NUBnbWFpbC5jb20K | base64 -d >
pkgname=xampp
pkgver=5.6.19
pkgrel=3
pkgdesc="A free and open source cross-platform web server package (LAMP Stack), consisting mainly of the Apache HTTP Server, MySQL database, and interpreters for scripts written in the PHP and Perl programming languages"
url="http://www.apachefriends.org/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('net-tools')
optdepends=('polkit: to run XAMPP Manager from menu')
makedepends=('proot-bin')
source_i686=( "xampp-installer"::"https://www.apachefriends.org/xampp-files/${pkgver}/${pkgname}-linux-${pkgver}-0-installer.run"
              "org.freedesktop.xampp-manager.policy"
              "xampp-manager_polkit")
source_x86_64=( "xampp-installer"::"https://www.apachefriends.org/xampp-files/${pkgver}/${pkgname}-linux-x64-${pkgver}-0-installer.run"
                "org.freedesktop.xampp-manager-x64.policy"
                "xampp-manager-x64_polkit")
source=("lampp.service" "xampp-manager.desktop" "xampp-manager.png")
options=(!strip)
install=xampp.install
md5sums_i686=('40af4db492478e6496e45f8d054680e7'
              '5732030b36a892696016481279706808'
              'bf75b016a5ce2deff1da3301013766cb')
md5sums_x86_64=('eeb99a5d00625b7cd3a3c57e492899f2'
                'ba7853fd8b3125b0a783753ca5e23447'
                '9d246102ea20f27a13d119e57741ce7d')
md5sums=( 'db1881f9564f18ed34d877035c28a4b8' 'cbf909c2c3ad89470463eed2ce003f97' 'f214711d95b8135f16974e36128f3a68')

package() {
  install -dm755 "${pkgdir}/opt/lampp"

  msg "Extracting package to a chroot..."
  chmod +x "${srcdir}/xampp-installer"
  echo "Y" | proot -b "${pkgdir}/opt/lampp:/opt/lampp" "${srcdir}/xampp-installer" --mode text
  chmod g-s -R "${pkgdir}"/opt/lampp

  # Licenses
  install -dm755 "${pkgdir}"/usr/share/licenses/xampp
  cp "${pkgdir}"/opt/lampp/licenses/* "${pkgdir}"/usr/share/licenses/xampp

  # /usr/bin executables
  install -dm755 "${pkgdir}"/usr/bin
  ln -sf /opt/lampp/lampp "${pkgdir}"/usr/bin/xampp
  ln -sf /opt/lampp/lampp "${pkgdir}"/usr/bin/lampp
  [ "$CARCH" = "i686" ] && install -Dm755 "${srcdir}/xampp-manager_polkit" "${pkgdir}/usr/bin/xampp-manager_polkit"
  [ "$CARCH" = "x86_64" ] && install -Dm755 "${srcdir}/xampp-manager-x64_polkit" "${pkgdir}/usr/bin/xampp-manager_polkit"


  # Systemd service
  mkdir -p ${pkgdir}/etc/systemd/system
  cp ${srcdir}/lampp.service ${pkgdir}/etc/systemd/system

  # Desktop launcher
  install -Dm755 "${srcdir}/xampp-manager.png" "${pkgdir}/usr/share/pixmaps/xampp-manager.png"
	install -Dm755 "${srcdir}/xampp-manager.desktop" "${pkgdir}/usr/share/applications/xampp-manager.desktop"

  # Install policy file for desktop launcher
  [ "$CARCH" = "i686" ] && install -Dm644 "${srcdir}/org.freedesktop.xampp-manager.policy" "${pkgdir}/usr/share/polkit-1/actions/org.freedesktop.xampp-manager.policy"
  [ "$CARCH" = "x86_64" ] && install -Dm644 "${srcdir}/org.freedesktop.xampp-manager-x64.policy" "${pkgdir}/usr/share/polkit-1/actions/org.freedesktop.xampp-manager-x64.policy"

}
