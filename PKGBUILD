# Maintainer: ThePirate42 <aur at thepirate42.org>
# Contributor: Bernhard Nornes Lotsberg <bernhard.lotsberg at bouvet.no>
# Contributor: lyoko, Tom Nguyen

pkgname=networkmanager-ssh
pkgver=1.4.2
pkgrel=1
pkgdesc="OpenSSH VPN support for NetworkManager"
arch=('x86_64')
url="https://github.com/danfruehauf/NetworkManager-ssh"
license=('GPL-2.0-or-later')
depends=('gtk3' 'libnm' 'libnma' 'libsecret' 'networkmanager' 'openssh' 'sshpass')
makedepends=('git' 'intltool')
optdepends=()

source=(${pkgname}::"git+https://github.com/danfruehauf/NetworkManager-ssh.git#tag=${pkgver}"
        "nm-ssh-service.name")
md5sums=('af163df4f8ade5d26a7eeed1b1414acf'
         'df217faa2823494c3fd83e778540e880')

prepare() {
  cd "${srcdir}/${pkgname}"
  autoreconf -fvi --include=/usr/share/gettext/m4
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib/NetworkManager \
    --disable-static \
    --disable-dependency-tracking \
    --enable-more-warnings=no \
    --without-libnm-glib
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}"
  install -Dm644 nm-ssh-service.name "$pkgdir/usr/lib/NetworkManager/VPN/nm-ssh-service.name"
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}/" INSTALL="install -p" CP="cp -p" install
}

