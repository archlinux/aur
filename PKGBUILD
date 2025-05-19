# Maintainer: imp0 <jan at siteworld dot be>
pkgname=apt-dater
pkgver=1.0.4.r57.g9a13bbd
_commit=9a13bbd1456d2f0faa8e6eaac9d753ef91760ecc
pkgrel=1
pkgdesc="Terminal-based remote package update manager"
arch=('x86_64')
url="https://github.com/DE-IBH/apt-dater"
license=('GPL')
depends=('glib2' 'libxml2' 'lockfile-progs' 'ncurses' 'openssh' 'perl' 'popt' 'tcl' 'tmux' 'util-linux')
makedepends=('pkg-config' 'vim' 'meson' 'libxslt' 'gi-docgen' 'docbook-xsl')
backup=('etc/apt-dater/apt-dater.xml' 'etc/apt-dater/hosts.xml')
source=("https://github.com/stbuehler/${pkgname}/archive/${_commit}.tar.gz"
    'apt-dater.install'
    '001-meson-man-xsl.patch')
sha256sums=('88780304d715795249007ffd9479278d86bd26fa68b712710be9d017876e6a13'
    '6f06dbc545d8a42b7ea0bb67f5c90514bbe9b793a3a36a3c3544072691ce0dc9'
    '0536c71efed0679530dbab5b594f5cd271fb21b36489072cfb17b0d958902903')
install=apt-dater.install

prepare() {
  cd "${pkgname}-${_commit}"
  patch -Np1 -i ../001-meson-man-xsl.patch
}

build() {
  arch-meson "${pkgname}-${_commit}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"

  # Fix permissions
  _aptd_etc="${pkgdir}/etc/apt-dater"
  chmod 644 $_aptd_etc/apt-dater.xml $_aptd_etc/hosts.xml
  for _d in post-con.d post-ins.d post-ref.d post-upg.d pre-con.d pre-ins.d pre-ref.d pre-upg.d; do
    chmod 755 $_aptd_etc/$_d
  done
}
