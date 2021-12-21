# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=ntop
pkgver=5.0.1
pkgrel=14
pkgdesc='A network traffic probe that shows the network usage.'
arch=('x86_64' 'i686')
url='https://www.ntop.org/'
license=('GPL')
depends=('libevent' 'libpcap' 'gd' 'rrdtool' 'geoip' 'lua' 'python2')
makedepends=('subversion' 'wget' 'ca-certificates')
options=('!makeflags')
install='ntop.install'
source=("https://sourceforge.net/projects/${pkgname}/files/${pkgname}/Stable/${pkgname}-${pkgver}.tar.gz"
        'ntop.service' ntop-rrdtool-1.6.0.patch)
sha512sums=('f52c40e6c00c8d2f46b68078c5f9aef8ed78670f92a0a81f66f2f44c71d41bc4c001b4550f19b71c546f7c07cbbed15e0aa1ee13873ac63a11678bf2b8483f2a'
            '890213e2f7ba03854a8dc11148da4f906e21d44c76f8aac185aeab2c91f64f0a94e82f9ed8c8b43324a4a3501795f6195535ecca7d14dbbca8b612c1526277a7'
            '3532acc6e54a1abdefeba42b3adb68cba1a0d1d2d6422e5b33fb9823b48481bb83696f097e65288c5811a6dd65ce20bff6d285d152776156b0690610d4026245')

prepare() {
  cd ${pkgname}-${pkgver}

  # Python2 fix
  find . -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'
  sed -i -e 's/python-config/python2-config/' \
    -e 's,-shared -flat_namespace,-shared,' \
    configure.in

  # Fix build with rrdtool 1.6 (Fedora)
  patch -p1 -i ../ntop-rrdtool-1.6.0.patch

}

build() {
  cd ${pkgname}-${pkgver}

  ./autogen.sh --prefix=/usr --sysconfdir=/usr/share --localstatedir=/var/lib --disable-snmp
  # Fight unused direct deps
  sed -i -e "s/ -shared / $LDFLAGS\0 /g" libtool
  make -j1 -C plugins libnetflowPlugin.la librrdPlugin.la libsflowPlugin.la
  make -j1
}

package() {
  cd ${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install

  install -dm0755 "${pkgdir}"/usr/lib/tmpfiles.d

  cat >"${pkgdir}"/usr/lib/tmpfiles.d/ntop.conf <<-EOF
	d /var/lib/ntop 755 nobody nobody
	d /var/lib/ntop/rdd 755 nobody nobody
EOF

  rm -fr "${pkgdir}"/usr/lib/plugins
  rm -fr "${pkgdir}"/var/lib/ntop

  for _f in "${pkgdir}/usr/lib/ntop/plugins/"*.so; do
    _plug="$(basename ${_f})"
    ln -sf "../../lib${_plug}" "${_f}"
  done

  install -Dm0644 "${srcdir}/ntop.service" "${pkgdir}/usr/lib/systemd/system/ntop.service"
}
