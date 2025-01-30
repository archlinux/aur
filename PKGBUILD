# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Moritz Maxeiner <moritz@ucworks.org>

pkgname=j4status-git
pkgver=472.b6a6abe
pkgrel=1
pkgdesc='Plugin-based status line generator to use with bar programs (like i3bar)'
arch=(i686 x86_64)
url='https://sardemff7.github.io/j4status/'
license=(GPL-3.0)
provides=(j4status)
depends=(dbus yajl networkmanager upower lm_sensors systemd libnl libpulse libmpdclient)
makedepends=(git docbook-xsl meson ninja)
options=('!libtool')
source=('j4status::git+https://github.com/sardemff7/j4status'
        'libgwater::git+https://github.com/sardemff7/libgwater'
        'libnkutils::git+https://github.com/sardemff7/libnkutils')
sha256sums=(SKIP SKIP SKIP)

pkgver()
{
  cd j4status
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare()
{
  cd j4status
  git submodule init
  git config submodule.libgwater.url "${srcdir}/libgwater"
  git config submodule.libnkutils.url "${srcdir}/libnkutils"
  git -c protocol.file.allow=always submodule update
}

build()
{
  rm -rf build
  arch-meson j4status build -Devp=disabled
  ninja -C build
}

package()
{
  DESTDIR="${pkgdir}" ninja -C build install
  install -D -m644 j4status/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
