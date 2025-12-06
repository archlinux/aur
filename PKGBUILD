# Maintainer:
# Contributor: Maxime Poulin <maxpoulin64@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Damian Nowak <damian.nowak@atlashost.eu>
# Contributor: Kyle Fuller <inbox@kylefuller.co.uk>
# Contributor: jibi <jibi@paranoici.org>

_pkgname="inspircd"
pkgname="$_pkgname"
pkgver=4.9.0
pkgrel=1
pkgdesc='Modular Internet Relay Chat (IRC) server'
url="https://github.com/inspircd/inspircd"
license=('GPL-2.0-only')
arch=('x86_64' 'aarch64')

depends=(
  'perl'
)
optdepends=(
  'argon2: m_argon2'
  'gnutls: m_ssl_gnutls'
  'libldap: m_ldap'
  'libmaxminddb: m_geo_maxmind'
  'libpsl: m_cloak_sha256'
  'mariadb-libs: m_mysql'
  'openssl: m_ssl_openssl'
  'pcre2: m_regex_pcre2'
  'postgresql-libs: m_pgsql'
  're2: m_regex_re2'
  'sqlite: m_sqlite3'
  'yyjson: m_log_json'
)

for i in "${optdepends[@]}"; do
  makedepends+=("${i%%:*}")
done

install='inspircd.install'

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"https://github.com/inspircd/inspircd/archive/v$pkgver.$_pkgext")
sha256sums=('7bbc0bd0b17d99cf3343005310183885b3d2210e386729fe7f0d7b81ec88c04d')

build() {
  local _config_opts=(
    --prefix=/usr/lib/inspircd
    --binary-dir=/usr/bin
    --module-dir=/usr/lib/inspircd/modules
    --config-dir=/etc/inspircd
    --data-dir=/var/lib/inspircd
    --log-dir=/var/log/inspircd
    --distribution-label=archlinux
    --disable-auto-extras
    --disable-ownership
  )

  cd "$_pkgsrc"
  ./configure --enable-extras "argon2 geo_maxmind ldap log_json log_syslog mysql pgsql regex_pcre2 regex_posix regex_re2 sqlite3 ssl_gnutls ssl_openssl sslrehashsignal"
  ./configure ${_config_opts[@]}

  echo "Building inspircd..."
  INSPIRCD_TARGET=inspircd make

  echo "Building coremods..."
  INSPIRCD_TARGET=coremods make

  echo "Building modules..."
  INSPIRCD_TARGET=modules make
}

package() {
  cd "$_pkgsrc"
  make DESTDIR="$pkgdir" install

  install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/system/$_pkgname.service" << END
[Unit]
Description=InspIRCd IRC daemon
Requires=network.target
After=network.target
 
[Service]
Type=forking
PIDFile=/var/lib/inspircd/inspircd.pid
ExecStart=/usr/lib/inspircd/inspircd start
ExecReload=/usr/lib/inspircd/inspircd rehash
ExecStop=/usr/lib/inspircd/inspircd stop
Restart=always
User=inspircd
Group=inspircd

[Install]
WantedBy=multi-user.target
END

  install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf" << END
g inspircd /var/lib/inspircd
u inspircd - "inspircd user" /var/lib/inspircd /bin/false
END
}
