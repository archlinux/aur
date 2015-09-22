# Maintainer: imp0 <jan at siteworld dot be>
pkgname=apt-dater
pkgver=1.0.2
pkgrel=2
pkgdesc="Terminal-based remote package update manager"
arch=('i686' 'x86_64')
url="https://www.ibh.de/apt-dater"
license=('GPL')
depends=('glib2' 'libxml2' 'lockfile-progs' 'ncurses' 'openssh' 'perl' 'popt' 'tcl' 'tmux' 'util-linux')
makedepends=('pkg-config' 'vim')
backup=('etc/apt-dater/apt-dater.xml' 'etc/apt-dater/hosts.xml')
source=("https://github.com/DE-IBH/${pkgname}/archive/v${pkgver}.tar.gz"
'apt-dater.install')
sha256sums=('4d01e734f4dac32ff2eb279e6493a1019f2c2fce0e35cea48df027a593df0355'
'6f06dbc545d8a42b7ea0bb67f5c90514bbe9b793a3a36a3c3544072691ce0dc9')
install=apt-dater.install

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
	--disable-rpath \
	--enable-debug \
	--enable-xmlreport \
	--enable-autoref \
	--enable-history \
	--enable-clusters \
	--enable-tclfilter \
	--enable-tmux
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Fix permissions
  _aptd_etc="${pkgdir}/etc/apt-dater"
  chmod 644 $_aptd_etc/apt-dater.xml $_aptd_etc/hosts.xml
  for _d in post-con.d post-ins.d post-ref.d post-upd.d pre-con.d pre-ins.d pre-ref.d pre-upd.d; do
    chmod 755 $_aptd_etc/$_d
  done
}
