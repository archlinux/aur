# Maintainer: envolution
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Antoine Lubineau <antoine@lubignon.info>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=patator
pkgver=1.0
pkgrel=2
pkgdesc="multi-purpose bruteforcer"
arch=(any)
url="https://github.com/lanjelot/patator"
license=(GPL-2.0-only)
depends=(
  python
  python-pycurl
  python-dnspython
  python-pyasn1
  python-paramiko
  # python-ajpy # not in AUR
  python-ipy #currently orphaned
  impacket
  #  python-pysqlcipher3 # not in AUR
  python-pycryptodomex
  python-pyopenssl
  python-mysqlclient
  #  python-psycopg2-binary # not in AUR
  python-pysnmp
  #  python-cx_oracle # not in AUR
)
optdepends=(
  'impacket: SMB'
  'java-runtime: keystore files'
  'openldap: LDAP'
  'python-crypto: VNC'
  'python-ipy: NETx keywords'
  'python-mysqlclient: MySQL'
  'python-paramiko: SSH'
  'python-psycopg2: PostgreSQL'
  'python-pycurl: HTTP'
  'python-pysnmp: SNMP'
  'unzip: zip archives'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz" py313.patch)
sha256sums=('b3eb75170bec398c81219665a39feff1a756ee62f7104753e2a661a29c3324cf'
            '37a05eb28a46d567ea5f09e8349da7da7e53835975aebeb17f48b0263b09ae2f')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i ../py313.patch
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname.py" "$pkgdir/usr/bin/patator"

  _modules=(
    ssh_login
    telnet_login
    smtp_login
    smtp_vrfy
    smtp_rcpt
    finger_lookup
    http_fuzz
    rdp_gateway
    #  ajp_fuzz
    pop_login
    pop_passd
    imap_login
    ldap_login
    dcom_login
    smb_login
    smb_lookupsid
    rlogin_login
    vmauthd_login
    mssql_login
    #  oracle_login
    mysql_login
    mysql_query
    rdp_login
    #  pgsql_login
    vnc_login
    dns_forward
    dns_reverse
    ike_enum
    snmp_login
    unzip_pass
    keystore_pass
    sqlcipher_pass
    umbraco_crack
  )
  for module in "${_modules[@]}"; do
    ln -s /usr/bin/patator "$pkgdir/usr/bin/$module"
  done
}
# vim:set ts=2 sw=2 et:
