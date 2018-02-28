# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
# A HUGE THANKS goes to ajdiaz for maintaining the SKS package:
# https://aur.archlinux.org/packages/sks/
# The VAST majority of this PKGBUILD is based on his work. Buy him a drink of his choice.
# 2018-02-08: currently not building due to this bug:
# https://bitbucket.org/skskeyserver/sks-keyserver/issues/55/unbound-module-nat-in-cryptokit-on-ocaml
pkgname=sks-local
pkgver=1.1.6
pkgrel=3
pkgdesc="A modified version of AUR/sks that can be used in tandem to perform localized keydumps"
arch=('i686' 'x86_64')
url="https://bitbucket.org/skskeyserver/sks-keyserver/"
license=('GPL')
optdepends=('sks: for running a public instance (to be peered with)')
# See https://bitbucket.org/skskeyserver/sks-keyserver/issues/55/unbound-module-nat-in-cryptokit-on-ocaml
# Currently doesn't build on ocaml 4.06
makedepends=('ocaml<=4.05.0' 'db' 'camlp4<4.06')
_pkgname=sks
install=sks-local.install
backup=('etc/sks-local/sksconf'
        'etc/sks-local/forward.exim'
        'etc/sks-local/forward.postfix'
        'etc/sks-local/mailsync'
        'etc/sks-local/membership'
        'etc/sks-local/procmail')
source=("https://bitbucket.org/skskeyserver/sks-keyserver/downloads/${_pkgname}-${pkgver}.tgz"
	"500_debian_fhs.patch"
	"sks-db-local.service"
	"sks-recon-local.service"
	"cryptokit-1.7-sks-uint32.patch"
	"debian_eventloopfix.patch"
        "${_pkgname}-${pkgver}.tgz.sig"
	"500_debian_fhs.patch.sig"
	"sks-db-local.service.sig"
	"sks-recon-local.service.sig"
	"cryptokit-1.7-sks-uint32.patch.sig"
	"debian_eventloopfix.patch.sig")
sha512sums=('f7c54194274834840b9701bf827b81add0f807dd4c6019968a6b0c755c9117519433ebb1161da38d23c465b163dd31a766700023afa13174e4dc82542fa98099'
	    '0fd57ccd86f289cf51638995555988a572ee00d6f28f3797092ffda19a0f668ee950be1ef381e94c64301db2dd1ad308834a45b7eaec148e9d8c01ed0a1829bc'
	    '41560dd89cb19c482af4352ee5e1c661428e61521e2cdfd307be23af6f3729a4c1a8db266391fba643a7ec0fb6f2ae936b56b889f02c7faf294e40b1ee54d73c'
	    '516d3e3ca515bafcf50e20712bebe3dc198cd7ea8e0779ec750220fceffd3deeb20f4113080fda2a168e353d848cf3ee924118195daf0f7415009102e69d969c'
	    '6ee333ce8aec0b103a36be376da43a569ed455f554fe853d007afc1d2e3a30d29735f515d22646832a8b4efa1ffdbfadb4a85ec22f2e5159180fc8373252c171'
	    '9463538f5668cdd41b25c43e31a2621e1c0953430b8dde84e54be4a45aa3f9ffbfcd270c83583df2a5462163eaf014fee3c3ed49f436faf71db7e87db88626b4'
	    'SKIP'
	    'SKIP'
	    'SKIP'
	    'SKIP'
	    'SKIP'
            'SKIP')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  for f in $(find ${srcdir} -maxdepth 1 -type l -name '*.patch');
  do
    sed -re 's@/var/lib/sks@/var/lib/sks-local@g' ${f} > ${f}.local
  done
  patch -Np1 -i "${srcdir}/500_debian_fhs.patch.local"
  patch -Np1 -i "${srcdir}/debian_eventloopfix.patch.local"
  cp Makefile.local.unused Makefile.local
  echo "OCAMLOPT=ocamlopt -runtime-variant _pic" >> Makefile.local
  sed -i -e 's#LIBDB=-ldb-4.6#LIBDB=-ldb-5.3#g' Makefile.local
  sed -i -e "s#/usr/local#${pkgdir}/usr#g" Makefile.local
  sed -i -e "s#/usr/share/man#${pkgdir}/usr/share/man#g" Makefile.local
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  unset MAKEFLAGS
  make dep
  make "cryptokit-1.7/README.txt"
  patch -Np0 -i "${srcdir}/cryptokit-1.7-sks-uint32.patch.local"
  # XXX Parallel compiling not supporting for Bdb module, force -j1 always.
  make CFLAGS="${CFLAGS} -I`ocamlc -where` -I ." -j1 all
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make PREFIX="${pkgdir}/usr" MANDIR="${pkgdir}/usr/share/man" install
  install -Dm644 "${srcdir}/sks-db-local.service" "${pkgdir}/usr/lib/systemd/system/sks-db-local.service"
  install -Dm644 "${srcdir}/sks-recon-local.service" "${pkgdir}/usr/lib/systemd/system/sks-recon-local.service"
  mv ${pkgdir}/usr/bin/${_pkgname} ${pkgdir}/usr/bin/${pkgname}
  mv ${pkgdir}/usr/bin/sks_add_mail ${pkgdir}/usr/bin/sks-local_add_mail
  mv ${pkgdir}/usr/bin/sks_build.sh  ${pkgdir}/usr/bin/sks-local_build.sh
  sed -i -e 's#/usr/sbin/sks#/usr/bin/sks-local#g' -e 's#/var/lib/sks#/var/lib/sks-local#g' ${pkgdir}/usr/bin/sks-local_build.sh
  # directories
  for d in etc/${pkgname} var/run/${pkgname} var/log/${pkgname} var/lib/${pkgname} var/spool/${pkgname};
  do
    install -d -m0755 ${pkgdir}/${d}
  done
  # tweaks
  chmod 0775 ${pkgdir}/var/run/${pkgname}

  cp -a ${srcdir}/${_pkgname}-${pkgver}/sampleWeb/OpenPKG "${pkgdir}/var/lib/${pkgname}"

  for f in sksconf forward.postfix forward.exim mailsync membership procmail;
  do
    install -D -m0644 ${srcdir}/${_pkgname}-${pkgver}/sampleConfig/debian/${f} ${pkgdir}/etc/${pkgname}/${f}
  done

  sed -i -e 's#/usr/lib/sendmail#/usr/sbin/sendmail#g' "${pkgdir}/etc/${pkgname}/sksconf"
  sed -i -e 's#/usr/lib/sks/sks_add_mail#/usr/bin/sks-local_add_mail#g' "${pkgdir}/etc/${pkgname}/procmail"
}

