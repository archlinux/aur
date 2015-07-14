# Maintainer: Mirco Tischler <mt-ml at gmx dot de>

pkgname=pesign
pkgver=0.110
pkgrel=2
pkgdesc='Tools for manipulating signed PE-COFF binaries'
arch=('i686' 'x86_64')
url='https://github.com/rhinstaller/pesign'
license=('GPL2')
depends=('efivar' 'nss' 'libutil-linux')
install='PKGBUILD'
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2"
        "http://pkgs.fedoraproject.org/lookaside/pkgs/pesign/rh-test-certs.tar.bz2/328db7cb27847cb610b7cf8f9c470455/rh-test-certs.tar.bz2"
        "efivar-const-correct.patch")
sha256sums=('a03499ffa181fea6086e1966476eccc05e3e014761ac300de1da27a44dba2281'
            '8932ff61a95a25def2551e5774b0fc16c126ed9ae3198ad5468e5a4d1b4f03b0'
            'c57523fbab55140ff629b320947f60319fb6f0083cc5ceba2712f61034c97c76')

prepare() {
  cd "${srcdir}"
  
  patch -p0 < ${source[2]}
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make LIBDIR=/usr/lib DESTDIR="${pkgdir}" install install_systemd
  rm -rf ${pkgdir}/var
  rm -rf ${pkgdir}/etc/rpm

  # no reason this shoulsn't be readable
  install -m 0755 -d "${pkgdir}/etc/pki/pesign"

  # install redhat test certificates
  cd "${srcdir}/rh-test-certs"
  for db in cert8.db key3.db secmod.db; do
    install -D "etc/pki/pesign/$db" "${pkgdir}/etc/pki/pesign/$db"
  done
}

post_install() {
  if ! getent group pesign >/dev/null; then
    groupadd --system pesign --gid 312
  fi
  if ! getent passwd pesign >/dev/null; then
    useradd --system --uid 312 -c 'pesign signing daemon' -g pesign -d / -s /bin/bash pesign
  fi
}

post_upgrade() {
  post_install $1
}

post_remove() {
  if getent passwd pesign >/dev/null; then
    userdel pesign
  fi
  if getent group pesign >/dev/null; then
    groupdel pesign
  fi
}
