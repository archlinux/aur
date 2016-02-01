# Maintainer: dreieck
# Contributor: Vasco Costa <vasco dot costa at geekslot dot com>
# Contributor: jaro3

pkgname=wwwoffle
pkgver=2.9i
pkgrel=7
pkgdesc="Simple caching proxy server with special features (request, recursive fetch, ...) for use with dial-up internet links. Includes startup scripts for OpenRC, System V init, systemd."
arch=('i686' 'x86_64' 'arm' 'arm64')
url="http://www.gedanken.org.uk/software/wwwoffle/"
license=('GPL')
depends=('zlib' 'gnutls' 'libgcrypt')
provides=(
  "wwwoffle-sysvinit=${pkgver}"
  "wwwoffle-openrc=${pkgver}"
  "wwwoffle-systemd=${pkgver}"
)
backup=('etc/wwwoffle/wwwoffle.conf')
install="${pkgname}.install"
source=(
  "http://www.gedanken.org.uk/software/wwwoffle/download/${pkgname}-${pkgver}.tgz"
  # 'certificates_4096-bits.patch'
  # 'certificates_2048-bits.patch'
  'conf_d_wwwoffle'
  'initscript_openrc'
  'initscript_systemd'
  'initscript_sysvinit'
  "${install}"
)

### NOTE: Higher key size for wwwoffle's root certificate and other algorithms are supported in the current SVN version of wwwoffle -- so consider installing the package 'wwwoffle-svn' instead.

sha256sums=(
  'e6341a4ec2631dc22fd5209c7e5ffe628a5832ad191d444c56aebc3837eed2ae'
  # '3997564510edd834df09b5d1ee560403e9432a1c1b3d72614113842a3d2d2a18'
  # '701ab0b7175a4aa8359608994614caaedd6052d588574bc3c25bd97e7705c0b8'
  'cd05738f73b109dd074f6dd919300eeae55c2aa812a15e0ae61b32622423c867'
  '0d5bfcd1e348f6bdad042f780b2ea8a235314d5750a66ae008a0ea391bc5cc11'
  '04fd88f2a100e3ff9a96da6a70e58457252722cbf6350ffdbf08f17e62b64869'
  '47f3df8ed05888452c00f8246f97456a4c55499b67e59c40da272b0e7fb1f2df'
  '87eb11ad6e43eb9ac866806e413b187196d2d3b9383de76139d4e4ff71ffe855'
)

build() {
  _unpackeddir="${srcdir}/${pkgname}-${pkgver}"
  cd "${_unpackeddir}"
  
  # patch -p1 < "${srcdir}/certificates_4096-bits.patch"
  # patch -p1 < "${srcdir}/certificates_2048-bits.patch"
  
  ./configure \
    --prefix=/usr \
    --exec-prefix=/usr \
    --with-zlib=/usr/include \
    --with-gnutls=/usr/include/gnutls \
    --with-gcrypt=/usr/include \
    --with-ipv6 \
    --with-spooldir=/var/spool/wwwoffle \
    --with-confdir=/etc/wwwoffle \
    --with-default-language=en \
    --bindir=/usr/bin \
    --sbindir=/usr/bin
  
  make || return 1
}

package() {
  _unpackeddir="${srcdir}/${pkgname}-${pkgver}"
  cd "${_unpackeddir}"
  
  # Install the software.
  make DESTDIR="${pkgdir}" install
  
  # Move documentation into the place we want it.
  mkdir -p "${pkgdir}/usr/share"
  mv -v "${pkgdir}/usr/doc" "${pkgdir}/usr/share/doc"

  # Symlink the HTML-Documentation under wwwoffle's spool directory to the documentation directory. Note: The html documentation needs to stay at wwwoffle's spool directory, since it serves it from there when it's webinterface is accessed.
  mkdir -p "${pkgdir}/usr/share/doc/wwwoffle/html"
  ln -sv "/var/spool/wwwoffle/html"/{de,en,es,fr,it,nl,pl,ru} "${pkgdir}/usr/share/doc/wwwoffle/html/"

  # Install startup scripts for different init systems.
  install -D -m755 "${srcdir}/initscript_sysvinit" "${pkgdir}/etc/rc.d/wwwoffle"
  install -D -m755 "${srcdir}/initscript_openrc" "${pkgdir}/etc/init.d/wwwoffle"
  install -D -m644 "${srcdir}/initscript_systemd" "${pkgdir}/usr/lib/systemd/system/wwwoffle.service"
  
  # Install a default configuration file.
  install -D -m644 "${srcdir}/conf_d_wwwoffle" "${pkgdir}/etc/conf.d/wwwoffle"

  # Change config such that wwwoffle runs as user wwwoffle and group wwwoffle. (Adding user and group is handled by the ${install}-script.)
  sed -i -e 's/^#run-uid.*/ run-uid           = wwwoffle/' \
    "${pkgdir}/etc/wwwoffle/wwwoffle.conf"
  sed -i -e 's/^#run-gid.*/ run-gid           = wwwoffle/' \
    "${pkgdir}/etc/wwwoffle/wwwoffle.conf"
}
