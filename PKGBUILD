# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: quomoow <quomoow@gmail.com>

pkgname=python-pg8000
# https://github.com/tlocke/pg8000#release-notes
pkgver=1.29.4
pkgrel=3
pkgdesc="Pure-Python PostgreSQL database driver, DB-API compatible"
arch=(any)
url='https://github.com/tlocke/pg8000'
license=(BSD)
makedepends=(python-setuptools python-build python-installer python-versioningit python-wheel)
checkdepends=(python-pytest python-pytest-mock python-pytest-benchmark
              python-pytz postgresql)
depends=(python python-scramp python-dateutil)
source=("https://files.pythonhosted.org/packages/source/p/pg8000/pg8000-$pkgver.tar.gz"{,.asc})
sha256sums=('76d2aa1757a30bc71e0307dae18c374e336a69123e6b046e206a96611fa2a330'
            'SKIP')
validpgpkeys=(
  'D5681B7EC7292511C4CC1450892B00AB699851E8'  # Tony Locke <tlocke@tlocke.org.uk>, proven by https://keybase.io/tlocke
)

build() {
  cd pg8000-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd pg8000-$pkgver

  export PGDATA="$srcdir/postgres-testdata"
  export PGHOST=127.0.0.1
  export PGPORT=$((49152+$RANDOM%10000))

  # See https://github.com/tlocke/pg8000#tests about database initialization steps for testing
  initdb --username=postgres --auth=trust
  openssl req -subj "/CN=self-signed" -nodes -x509 -newkey rsa:4096 -days 1 -keyout "$PGDATA/self-signed.key" -out "$PGDATA/self-signed.crt"
  cat <<EOF >> "$PGDATA/postgresql.conf"
ssl = on
ssl_cert_file = 'self-signed.crt'
ssl_key_file = 'self-signed.key'
password_encryption = 'scram-sha-256'
EOF

  pg_ctl start -o "-k '' -h $PGHOST -p $PGPORT" -l "$srcdir/postgresql.log"
  # Change the password for postgres after password_encryption is specified, so that the role has a valid SCRAM secret
  psql -U postgres -c "
    CREATE EXTENSION hstore;
    ALTER ROLE postgres PASSWORD 'pw';
  "

  # should overwrite pg_hba.conf, or unexpected matches may happen against existing entries
  cat <<EOF > "$PGDATA/pg_hba.conf"
host    pg8000_md5      all             127.0.0.1/32            md5
host    pg8000_gss      all             127.0.0.1/32            gss
host    pg8000_password all             127.0.0.1/32            password
host    pg8000_scram_sha_256 all        127.0.0.1/32            scram-sha-256
host    all             all             127.0.0.1/32            trust
EOF
  pg_ctl reload
  # Upstream tests require LANG=en_GB.UTF-8 or LANG=C.UTF-8 :/
  # https://github.com/tlocke/pg8000/blob/1.19.2/test/native/test_typeconversion.py#L455-L458
  # test_readme: skipped as many tests need a postgresql instance listening on the default port
  # localhost:5432, which may cause conflicts until devtools supports a separate network namespace [1]
  # [1] https://gitlab.archlinux.org/archlinux/devtools/-/issues/72
  PYTHONPATH="$PWD" LANG=C.UTF-8 pytest test -k 'not test_readme'
  pg_ctl stop
}

package() {
  cd pg8000-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
