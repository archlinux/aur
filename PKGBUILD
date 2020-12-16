# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=maxscale
pkgver=2.5.6
pkgrel=2
_tag=${pkgname}-${pkgver}
pkgdesc='An intelligent database proxy'
arch=('x86_64')
url='https://mariadb.com/'
license=('MariaDB Business Source License (BSL)')
makedepends=('cmake' 'git' 'nodejs' 'npm' 'systemd' 'tcl')
depends=('avro-c' 'curl' 'libcurl.so' 'gnutls' 'libxcrypt' 'libcrypt.so' 'openssl' 'pam'
         'libpam.so' 'sqlite' 'systemd-libs' 'libsystemd.so')
backup=('etc/maxscale.cnf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mariadb-corporation/MaxScale/archive/${_tag}.tar.gz"
        'sysusers.conf'
        'tmpfiles.conf')
sha512sums=('8377ab74362ec60a368d8542f2e90e917d061a7242c489e18524d589e5867792408b019083f50bf5255ec4a987622e3d560966be0cf56e2522bca660e5e5a592'
            'b72f1792be6b5ef6c691fa4681c5f5809f081cdf88f5a9fa8406c3d486bc28d1de65064b71926bd83b4021822b398b943b5437ce564d62b1e9e77169299238d7'
            '3fac452cfefe3ea906805862d4bb780d178e4f3f8eef8b761f7fb998b82431a52155456870ce093205fabc34dd8cef1f05a4ffbb2f4d008117b422b0f120bb3c')

prepare() {
  cd MaxScale-${_tag}/

  # check for shared library
  sed -i 's/libavro.a/libavro.so/' cmake/FindAvro.cmake
  sed -i 's/libjansson.a/libjansson.so/' cmake/FindJansson.cmake

  # do not fail if allied twice
  sed -i '/PATCH_COMMAND/s/$/ || true/' cmake/BuildJwtCpp.cmake

  # do not install directories, we do this from tmpfiles
  sed -i -e '/^ExecStartPre=/d' -e '/^PIDFile=/s|/var/run/|/run/|' etc/maxscale.service.in

  # write log to syslog only
  sed -i '/\[maxscale\]/asyslog=1\nmaxlog=0' server/maxscale.cnf.template
}

build() {
  mkdir -p $srcdir/build
  cd $srcdir/build

  cmake ../MaxScale-${_tag} \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install

  # move configuration to real path
  mv "${pkgdir}"/etc/maxscale.cnf{.template,}

  # install configuration for sysusers and tmpfiles
  install -D -m0644 sysusers.conf "${pkgdir}"/usr/lib/sysusers.d/maxscale.conf
  install -D -m0644 tmpfiles.conf "${pkgdir}"/usr/lib/tmpfiles.d/maxscale.conf

  # remove unused stuff
  rm -rf "${pkgdir}"/etc/{init.d,init,ld.so.conf.d,logrotate.d,prelink.conf.d}

  # install license files
  install -D -m0644 MaxScale-${_tag}/LICENSE.TXT "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -D -m0644 MaxScale-${_tag}/COPYRIGHT "${pkgdir}"/usr/share/licenses/${pkgname}/COPYRIGHT
}
