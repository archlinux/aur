# Maintainer: bobpaul

_pkgbase=mautrix-hangouts
pkgname=${_pkgbase}-git
pkgver=r49.1241db9
pkgrel=2
pkgdesc="A Matrix-Hangouts puppeting bridge with multi-user support"
arch=(any)
conflicts=(mautrix-hangouts)
license=(AGPLv3)
depends=(python
	     python-aiohttp
	     python-alembic
	     python-sqlalchemy
	     python-commonmark
	     python-ruamel-yaml
	     python-mautrix
	     python-magic-git
	     hangups
	     sudo
	    )
makedepends=(git)
optdepends=()
source=("${_pkgbase}::git+https://github.com/tulir/${_pkgbase}"
	    "usr-share.patch"
	    "README"
	    "mautrix-hangouts-db-upgrade"
	    "sysusers-mautrix-hangouts.conf"
	    "tmpfiles-mautrix-hangouts.conf"
	    "${_pkgbase}.service")
sha256sums=('SKIP'
            '627acf28bc80600abb3c0ddf4b0ed563bd77814687c96afabaf1779a55c335d9'
            'eefb2404ecc09eb1484ff3fb73986c9a44d92c5ae729e41269f82148b4299160'
            '918d04d07223c83324e18f44fc181abaadc49b747de76a9bcfd48e6bdda6bd05'
            '36aee765d66afa89778962432660ff49f711bf6982758e0c572d760568555758'
            'e078d74a16e9cbf8b7f6426274256e72f84ab34ed29c240cce3249985fb566da'
            '6cef4d60dbe05b92c8d5a2353de3e3ea8b3b34a25aad27c0b985f62e8942e833')

pkgver() {
  cd "$srcdir/${_pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${_pkgbase}"
  git reset --hard
  patch < ../usr-share.patch
}

package() {
  cd "$srcdir/${_pkgbase}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "$srcdir/"
  install -Dm644 "$srcdir"/README -t "$pkgdir"/etc/synapse/mautrix-hangouts/
  install -Dm755 "$srcdir"/mautrix-hangouts-db-upgrade -t "$pkgdir"/usr/bin/
  install -Dm644 ${_pkgbase}.service -t  "${pkgdir}"/usr/lib/systemd/system/
  install -Dm644 "$srcdir"/sysusers-mautrix-hangouts.conf "$pkgdir"/usr/lib/sysusers.d/mautrix-hangouts.conf
  install -Dm644 "$srcdir"/tmpfiles-mautrix-hangouts.conf "$pkgdir"/usr/lib/tmpfiles.d/mautrix-hangouts.conf
}
