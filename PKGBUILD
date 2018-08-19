# Maintainer: Remi Gacogne <rgacogne at archlinux dot org>
pkgname=ixfrdist-git
pkgver=r14887.fcb311e4d
pkgrel=1
pkgdesc='AXFR to IXFR Distributor'
arch=('x86_64')
url='https://powerdns.com/'
license=('GPL2')
source=("${pkgname}::git+https://github.com/PowerDNS/pdns"
        sysusers.conf)
sha512sums=('SKIP'
            'a944f561065f245035e2347dba13c66bcffb7f3d18e56745c61adcb5e1b8ef2f0b9b3775e9c246acb9894e2cbdf9f4416d875494240159d41fda65e6b76421b5')
makedepends=('boost' 'git' 'pandoc' 'python-virtualenv' 'ragel' 'systemd')
depends=('boost-libs' 'openssl' 'yaml-cpp')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}/"
  autoreconf -i
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc/powerdns \
    --localstatedir=/var \
    --with-modules='' \
    --with-dynmodules='' \
    --enable-tools \
    --disable-dependency-tracking \
    --disable-silent-rules \
    --enable-reproducible \
    --enable-systemd \
    --enable-ixfrdist
  cd pdns/
  make ixfrdist ixfrdist.service
  sed -i 's,# uid: ixfrdist,uid: ixfrdist,' ixfrdist.example.yml
  sed -i 's,# gid: ixfrdist,gid: ixfrdist,' ixfrdist.example.yml
}

package() {
  cd "${pkgname}/"
  install -D -m755 pdns/ixfrdist "${pkgdir}/usr/bin/ixfrdist"
  install -D -m644 pdns/ixfrdist.service "${pkgdir}/usr/lib/systemd/system/ixfrdist.service"
  install -D -m644 pdns/ixfrdist.example.yml "${pkgdir}/etc/powerdns/ixfrdist.example.yml"

  cd "${srcdir}"
  install -D -m644 sysusers.conf "${pkgdir}/usr/lib/sysusers.d/ixfrdist.conf"
}
