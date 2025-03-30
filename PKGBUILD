# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
_imapver='2007f'
pkgname=mailsync
pkgdesc='Synchronizes a collection of mailboxes using a 3-way diff'
url=http://mailsync.sourceforge.net/
pkgver=5.2.7
pkgrel=1
license=(GPL-2.0-only)
arch=(x86_64 i686)
depends=(pam)
makedepends=(autoconf automake)
options=(zipman)
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}_${pkgver}-1.tar.gz"
        "http://ftp.ntua.gr/pub/net/mail/imap/imap-${_imapver}.tar.gz"
        1006_openssl1.1_autoverify.patch
        c-client-2006k_GENTOO_amd64-so-fix.patch
		c-client-static-link.patch)
sha512sums=('d0379071fa77380d295e1fbbc0fd0e9401c49893d5d6079d4a59fbaf62011ae6870a1ee25672e9f0557f410555827a4ffc53c3b93507b589a4916569c04ee8cf'
            '7c3e1d9927872001e768ff2ddbcf3af74078243efe58dd70e01d966856b7611134e4b579818691a954bade9acaeeda6f2f30f40d812b8aa20990de5cb90d5d35'
            '7ecbe52adc6e3d1deee05790745642f794150ffaebf51c0cf689dc036eea9c7d80e643648aac37bf0aa83ac138b8bb63abfad3b540bc9440de3456162dfabae5'
            '213f06e133704ed2bb9fc6900edb7a4505bf6965409ecf76502bf9cafdf7c981bca552479f8ffaa1a355d2f1c1c08dbe0453fa5bce06590f6627d0e622c70879'
            '0a005f179eff42778160e7d43d6ec1a5c571db194eec8259e4e41efb3ffa5d7473677b1d41d6e242e348cc2561cea55b67ba5e04befcb851214b312386bd691a')

prepare () {
  cd "${srcdir}/imap-${_imapver}"

  # Straight out of the "imap" PKGBUILD.
  sed \
    -e "s:-g -fno-omit-frame-pointer -O6:\${CFLAGS}:" \
    -e "s:SSLDIR=/usr/local/ssl:SSLDIR=/usr:" \
    -e "s:SSLCERTS=\$(SSLDIR)/certs:SSLCERTS=/etc/ssl/certs:" \
    -i src/osdep/unix/Makefile

  patch -p1 -i "${srcdir}/c-client-2006k_GENTOO_amd64-so-fix.patch"
  patch -p1 -i "${srcdir}/1006_openssl1.1_autoverify.patch"

  cd "$srcdir/$pkgname"
  patch -p1 -i "$srcdir/c-client-static-link.patch"
  autoreconf -fvi
}

build () {
  # Needed with modern compilers that have more of those turned on by default.
  local wflags=(
    -Wno-error=implicit-function-declaration
    -Wno-error=incompatible-pointer-types
    -Wno-error=format-security
  )
  local ldlibs=(
    -lgssapi_krb5
    -lkrb5
    -lk5crypto
    -lcom_err
    -lpam
	-lssl
	-lcrypto
  )

  # Ditto, from the "imap" PKGBUILD.
  cd "${srcdir}/imap-${_imapver}"
  yes "y" | make -j1 lnp \
      EXTRAAUTHENTICATORS=gss \
      PASSWDTYPE=pam \
      SPECIALAUTHENTICATORS=ssl \
      SSLTYPE=unix \
      EXTRACFLAGS="${CFLAGS} -fPIC ${wflags[*]}" \
      EXTRALDFLAGS="${LDFLAGS} ${ldlibs[*]}"

  cd "${srcdir}/${pkgname}"
  ./configure --with-c-client="${srcdir}/imap-${_imapver}" --prefix=/usr --sysconfdir=/etc LDFLAGS="${ldlibs[*]}"
  make
}

package () {
  cd "${srcdir}/${pkgname}"
  make install DESTDIR="${pkgdir}"

  # Move manual page to a proper location
  install -m755 -d "${pkgdir}/usr/share/man/man1"
  mv "${pkgdir}/usr/share/doc/mailsync/mailsync.1" \
     "${pkgdir}/usr/share/man/man1"
}
