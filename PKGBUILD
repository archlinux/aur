# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=alock
pkgver=2.5.0
pkgrel=3
pkgdesc="simple screen lock application for X server"
arch=('i686' 'x86_64')
url="https://github.com/Arkq/alock"
license=('MIT')
depends=('libx11' 'libxext' 'libxrender' 'libxcursor' 'libxpm' 'imlib2' 'pam' 'libgcrypt')
optdepends=('dunst' 'xorg-xbacklight')
provides=("${pkgname}")
conflicts=('alock-svn' 'alock-git')

source=(${pkgname}-${pkgver}.tar.gz::https://github.com/Arkq/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz
        'https://github.com/Arkq/alock/pull/14.patch'
        'https://github.com/Arkq/alock/pull/15.patch'
        'https://github.com/Arkq/alock/pull/16.patch'
        'https://github.com/Arkq/alock/pull/21.patch')
sha256sums=('c763107ec8716787b97b0e7a6aaa24320b6c1a495bf2c60949d3a2ce228096ac'
            'f9a7750108c7038cb7e715a102ffb46920d4a49185e87db8a72ad285b596f85d'
            'dbcaa48afcf1ee088d36ad5f1a871cfb15d2ac53c7932afb6a1a2808604a4117'
            '65ecb2989bea3909e8494d2f11ef1d77ff28c5419fbca435e016ae711108b8d8'
            'e1a6d987927a04d0fbbffad1e13893182d3ef44863a7d76e95910b949da11b02')

prepare() {
  cd "${pkgname}-${pkgver}"

  patch -p1 < ../14.patch
  patch -p1 < ../15.patch
  patch -p1 < ../16.patch
  patch -p1 < ../21.patch

  sed -i -e 's,"login","system-auth",' src/auth_pam.c
  autoreconf -fiv
}

build() {
  cd "${pkgname}-${pkgver}"

  # upstream bug: Configure ignores --prefix option
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-passwd \
    --enable-xcursor \
    --enable-pam \
    --enable-hash \
    --enable-xrender \
    --enable-imlib2 \
    --enable-xpm \
    --with-dunst \
    --with-xbacklight

  make V=0
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install

  # for passwd support
  chown root:root "${pkgdir}/usr/bin/alock"
  chmod 4111 "${pkgdir}/usr/bin/alock"

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
