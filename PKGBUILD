# Maintainer: satcom886
# PKGBUILD based on bobpaul's mautrix-facebook-git package
_pkgbase=maubot
pkgname=${_pkgbase}-git
pkgver=r395.bc166e7
pkgrel=1
pkgdesc="A plugin-based Matrix bot system"
arch=(any)
conflicts=(maubot)
license=(AGPLv3)
url="https://github.com/maubot/maubot"
depends=(
  python
  python-mautrix
  python-aiohttp
  python-sqlalchemy
  python-alembic
  python-commonmark
  python-ruamel-yaml
  python-attrs
  python-bcrypt
  python-packaging
  python-click
  python-colorama
  python-pyinquirer
  python-jinja
	sudo
)
makedepends=(git)
optdepends=(
  "python-psycopg2: PostgreSQL database support"
  "python-asyncpg: e2be"
  "python-olm: e2be"
  "python-pycryptodome: e2be"
  "python-unpaddedbase64: e2be"
)
source=("${_pkgbase}::git+https://github.com/maubot/${_pkgbase}"
	    "usr-share.patch"
	    "README"
	    "maubot-db-upgrade"
	    "sysusers-maubot.conf"
	    "tmpfiles-maubot.conf"
	    "${_pkgbase}.service")
sha256sums=('SKIP'
            '8b3efe8076219b3b32381c81712019b13eb143b0358b9635cb5eb5f1d4f771f0'
            '41058411d46124a56dc9063d8604530095766f3eefc21cbd5b0bca1858103e29'
            'f3849f10b32aea2819946524b423e55c392dd7efafe29f937b751f8e2a3056a3'
            'e2f01fd60338dd576bb72dee2f536210cb54540ace4a40aa94b5aebe6944ba0f'
            'b29dfcccd4012c117918e9210f01e7c28aa9b7e05c592811a71af0a4ba255770'
            'c9a5e4b4cbe9ea6cc5957ab7352e247daefa53cb90d340083553ea7170f72ee4')

pkgver() {
  cd "$srcdir/${_pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${_pkgbase}"
  git reset --hard
  echo 'Apply patch to follow fileplacement guidelines per `man heir`'
  patch < ../usr-share.patch
  echo 'Applying patch to permit use of newest mautrix version'
  sed -i 's/^mautrix==/mautrix>=/' requirements.txt
  # I don't think we need ^^^^ this
  # (actually we need that...)
}

package() {
  cd "$srcdir/${_pkgbase}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "$srcdir/"
  install -Dm644 "$srcdir"/README -t "$pkgdir"/etc/synapse/mautrix-facebook/
  install -Dm755 "$srcdir"/maubot-db-upgrade -t "$pkgdir"/usr/bin/
  install -Dm644 ${_pkgbase}.service -t  "${pkgdir}"/usr/lib/systemd/system/
  install -Dm644 "$srcdir"/sysusers-maubot.conf "$pkgdir"/usr/lib/sysusers.d/maubot.conf
  install -Dm644 "$srcdir"/tmpfiles-maubot.conf "$pkgdir"/usr/lib/tmpfiles.d/maubot.conf
}
