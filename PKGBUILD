pkgname=postfix-mysql
_pkgname=postfix
pkgver=3.5.8
pkgrel=0
url="http://www.postfix.org/"
pkgdesc='Fast, easy to administer, secure mail server'
license=('EPL')
arch=('x86_64')
depends=('db' 'glibc' 'libldap' 'libnsl' 'libsasl' 'openssl' 'pcre'
'postgresql-libs' 'sqlite' 'tinycdb' 'zlib')
makedepends=('icu' 'libmysqlclient')
optdepends=('perl: for postfix-collate.pl and qshape')
conflicts=('smtp-server' 'smtp-forwarder' 'postfix-tools' 'postfix')
provides=('smtp-server' 'smtp-forwarder' 'postfix-tools' 'postfix')
replaces=('postfix-tools')
backup=('etc/postfix/'{access,aliases,canonical,generic,header_checks,main.cf,master.cf,relocated,transport,virtual})
source=("http://ftp.porcupine.org/mirrors/postfix-release/official/${_pkgname}-${pkgver}.tar.gz"
        "${_pkgname}-3.5.8-main_defaults.patch"
        "${_pkgname}.service"
        "${_pkgname}.sysusers"
        "${_pkgname}.tmpfiles"
)
sha512sums=('0abb07d99e343b76e6a26b4a090af9d592f4dfd03c8c737cc72bfb0f4267dafcbb0cb0aa7b6255f8b834c9289d89a5c47b167be3758239309937cb77e0d9464b'
            '7b2785aa8120ca3ff91b405baf675e9e11f8d58b18a9b842672e7ae30932febddac10556a70823d8746fcb160bceb4dbabdee45cf46b02fc0127057656fb85c4'
            '27f54747ad480d65b560c9dbc97e12c6353e4bceca0ffe3e358e31de56db0ad79928164c9f8790c73a9f791daa378253d2ee29b5a766661778553ec889b2cf97'
            'a7f15970f613ae7b98ce1b84ca0a6034ce3cc7b2b9ce7160dad9731f740fb762f4a54f44acceb5f06f8744fa9e952b088086af8a69da388a600b742a3cda37f2'
            'd08574a6acd595fc146513c92dc1bb341c3432d67de1e93ab73a7ce60e385dd34f3a55e3d3d7aec5f358ac4aae260f028599ac47650ebc663cea3043a760a7bc')
b2sums=('13166e854f70987f981bb5e7e5dabfaa73b3170ab16fc1ff8f70f6b98a0697ac980bdf74bbfb39fdfd1972f922a31a28882b1575b79fd8f01d81e08e68d756bc'
        'b5f19e0619f1fb017cd889c14e341c21146b3afe7b9eefcdb7fb1eb83a357434b899d1e92f3ab0023c78ef8f2de6ae54c4599ee0f0bd04d257f4ca0a4dc9a16c'
        '02dd441cf6e4a7c2bc0de876f020b0784d811f77a5c6102dd075d67b07158dbc53c8b4d62bc8035283d4f349008574b1c3fac03f4519d56ffd809cb5bcfb7bea'
        'db58b7deb24cea16fb84f56680f0000683f72e11a95039969878e3819607aad5e65af9d9f50007e7710609065c0e3ebb9b30c1d929162b74eca5e74434d82cf1'
        'de31693cea5f452a9c8c0d1cf5210a6e67c0176f8b1a4d74106f2e803911569e9fdbb2301b3b5dc7ad6a6da285026b1a3ed3de52117d216b030cf0d92348909d')

prepare() {
  cd "${_pkgname}-${pkgver}"
  # add distribution defaults to main.cf (alias_maps and alias_database)
  patch -Np1 -i ../"${_pkgname}-3.5.8-main_defaults.patch"
}

build() {
  local _ccargs=(
    '-fPIC' '-fcommon'
    '-DUSE_SASL_AUTH'
    '-DUSE_CYRUS_SASL' '-I/usr/include/sasl'
    '-DHAS_LDAP'
    '-DUSE_TLS'
    '-DHAS_MYSQL' '-I/usr/include/mysql'
    '-DHAS_PGSQL' '-I/usr/include/postgresql'
    '-DHAS_SQLITE'
    '-DHAS_CDB'
    '-DDEF_COMMAND_DIR=\"/usr/bin\"'
    '-DDEF_DAEMON_DIR=\"/usr/lib/postfix/bin\"'
    '-DDEF_SENDMAIL_PATH=\"/usr/bin/sendmail\"'
    '-DDEF_README_DIR=\"/usr/share/doc/postfix\"'
    '-DDEF_MANPAGE_DIR=\"/usr/share/man\"'
  )

  cd "${_pkgname}-${pkgver}"
  # NOTE: descriptions of variables in makedefs
  make makefiles \
    DEBUG='' \
    pie=yes \
    shared=yes \
    dynamicmaps=yes \
    CCARGS="${_ccargs[*]}" \
    AUXLIBS="$(pkgconf --libs openssl libsasl2) -lnsl" \
    AUXLIBS_LDAP='-lldap -llber' \
    AUXLIBS_LMDB="$(pkgconf --libs lmdb)" \
    AUXLIBS_PCRE="$(pkgconf --libs pcre)" \
    AUXLIBS_MYSQL="$(pkgconf --libs libmysqlclient)" \
    AUXLIBS_PGSQL="$(pkgconf --libs libpq)" \
    AUXLIBS_SQLITE="$(pkgconf --libs sqlite3)" \
    AUXLIBS_CDB='-lcdb' \
    SHLIB_RPATH="-Wl,-rpath,/usr/lib/postfix ${LDFLAGS}" \
    OPT="${CFLAGS} ${CPPFLAGS} ${LDFLAGS}"

  make
}

package() {
  local _name
  depends+=('libicuuc.so' 'libmysqlclient')

  cd "${_pkgname}-${pkgver}"
  LD_LIBRARY_PATH="lib:$LD_LIBRARY_PATH" \
  sh postfix-install -non-interactive install_root="${pkgdir}"

  # additional man pages and scripts
  for _name in posttls-finger {smtp,qmqp}-{sink,source}; do
    install -vDm 644 "man/man1/${_name}.1" -t "${pkgdir}/usr/share/man/man1/"
    install -vDm 755 "bin/${_name}" -t "${pkgdir}/usr/bin/"
  done
  install -Dm 644 "man/man1/qshape.1" -t "${pkgdir}/usr/share/man/man1/"
  install -Dm 755 "auxiliary/qshape/qshape.pl" "${pkgdir}/usr/bin/qshape"
  install -Dm 755 "auxiliary/collate/collate.pl" "${pkgdir}/usr/bin/postfix-collate.pl"
  # license
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
  # systemd service
  install -vDm 644 "../${_pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system/"
  # sysusers.d
  install -vDm 644 "../${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  # tmpfiles.d
  # NOTE: follow setup in conf/postfix-files
  install -vDm 644 "../${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
  # remove non-reproducible file, that only lists what the build circumstances were
  rm -v "${pkgdir}/etc/${_pkgname}/makedefs.out"
}
