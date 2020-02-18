# Maintainer: bobpaul

_pkgbase=mautrix-facebook
pkgname=${_pkgbase}-git
pkgver=r128.0a972cd
pkgrel=1
pkgdesc="A Matrix-Facebook puppeting bridge with multi-user support"
arch=(any)
conflicts=(mautrix-facebook)
license=(AGPLv3)
depends=(python
	     python-aiohttp
	     python-alembic
	     python-sqlalchemy
	     python-commonmark
	     python-ruamel-yaml
	     python-mautrix
	     python-magic-git
	     python-fbchat-asyncio
	     sudo
	    )
makedepends=(git)
optdepends=()
source=("${_pkgbase}::git+https://github.com/tulir/${_pkgbase}"
	    "usr-share.patch"
	    "README"
	    "mautrix-facebook-db-upgrade"
	    "sysusers-mautrix-facebook.conf"
	    "tmpfiles-mautrix-facebook.conf"
	    "${_pkgbase}.service")
sha256sums=('SKIP'
            '2b4d54734bb9cdbd7cd4995cba519c05acf5c76dec8f93b2f7596e85c2c0c01e'
            'f02378ab2d0d4e83ce33ad24c09b2171292423a3fc96481523a735196ef4751e'
            '793016de273d6dc0a2fdfd1090942aa2ec3cc75c0cad333ed231bb8561fddfd0'
            'd981fb6fef944b83a4089683075ab2ae1cf095a6814e4d3bdce500d3309cb617'
            '9e7d00ea24067447fde0f3c4c08ea70760db85975d93496ed82f597cd8c863d6'
            '9ce98679d5ec0cf73ecf70a5f92c3240ae7ef35f82691bb58bf06a03c893bfbd')

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
  install -Dm644 "$srcdir"/README -t "$pkgdir"/etc/synapse/mautrix-facebook/
  install -Dm755 "$srcdir"/mautrix-facebook-db-upgrade -t "$pkgdir"/usr/bin/
  install -Dm644 ${_pkgbase}.service -t  "${pkgdir}"/usr/lib/systemd/system/
  install -Dm644 "$srcdir"/sysusers-mautrix-facebook.conf "$pkgdir"/usr/lib/sysusers.d/mautrix-facebook.conf
  install -Dm644 "$srcdir"/tmpfiles-mautrix-facebook.conf "$pkgdir"/usr/lib/tmpfiles.d/mautrix-facebook.conf
}
