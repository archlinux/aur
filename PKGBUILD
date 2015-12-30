# Maintainer: Mirco Tischler <mt-ml at gmx dot de>

pkgname=pesign
pkgver=0.111
pkgrel=1
pkgdesc='Tools for manipulating signed PE-COFF binaries'
arch=('i686' 'x86_64')
url='https://github.com/rhinstaller/pesign'
license=('GPL2')
depends=('efivar' 'nss' 'libutil-linux')
install='PKGBUILD'
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2"
	"http://pkgs.fedoraproject.org/lookaside/pkgs/pesign/rh-test-certs.tar.bz2/328db7cb27847cb610b7cf8f9c470455/rh-test-certs.tar.bz2"
	"pthread-flags.patch"
	"fix-double-prefix-when-installing-to-docdir.patch")
sha256sums=('c6d52cbf1d8551be94497a96380d3b0497be331f9eb0af6250a854c0bc2225b9'
            '8932ff61a95a25def2551e5774b0fc16c126ed9ae3198ad5468e5a4d1b4f03b0'
            'ca76e60405fe8d382dc867da018f3d8ec6f2faef014e503b9329bff642debcbb'
            'a34c8bac179b9e742db6854d8e86da36e314317290dfabbf44ad8850addd1008')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -p1 < ${srcdir}/${source[2]}
  patch -p1 < ${srcdir}/${source[3]}
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make libdir=/usr/lib libexecdir=/usr/lib DESTDIR="${pkgdir}" install install_systemd
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
