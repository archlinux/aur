# Maintainer: bobpaul

_pkgbase=mautrix-facebook
pkgname=${_pkgbase}-git
pkgver=r963.86a9763
pkgrel=1
pkgdesc="A double puppeting Facebook bridge with multi-user support for Hangouts"
arch=(any)
conflicts=(mautrix-facebook)
license=('AGPL-3.0-or-later')
url="https://github.com/mautrix/facebook"
depends=(
  python
  python-aiohttp
  python-aiohttp-socks
  python-attrs
  python-asyncpg
  python-commonmark
  python-magic
  python-mautrix
  python-olm
  python-paho-mqtt
  python-pillow
  python-pycryptodome
  python-python-socks
  python-ruamel-yaml
  python-setuptools
  python-unpaddedbase64
  python-yarl
  python-zstandard
)
makedepends=(git)
optdepends=('python-aiosqlite: for sqlite database backend')
source=("${_pkgbase}::git+https://github.com/tulir/${_pkgbase}"
	    "usr-share.patch"
	    "README"
	    "sysusers-mautrix-facebook.conf"
	    "tmpfiles-mautrix-facebook.conf"
	    "${_pkgbase}.service")
sha256sums=('SKIP'
            'd513b67b7ed70a7d4b19aece23d820e309629bc25131caf136101bb2508fc075'
            'ee0cd11812d2c3e4d57cfb534a9302374d1477c05c55bfbfeb5816aefc0a593f'
            'd981fb6fef944b83a4089683075ab2ae1cf095a6814e4d3bdce500d3309cb617'
            '9e7d00ea24067447fde0f3c4c08ea70760db85975d93496ed82f597cd8c863d6'
            'a405ddaff8d16e09caae4346b4721727c1d3e86ca3d8325c54e0180b771bc12f')

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
}

package() {
  cd "$srcdir/${_pkgbase}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "$srcdir/"
  install -Dm644 "$srcdir"/README -t "$pkgdir"/etc/synapse/mautrix-facebook/
  install -Dm644 ${_pkgbase}.service -t  "${pkgdir}"/usr/lib/systemd/system/
  install -Dm644 "$srcdir"/sysusers-mautrix-facebook.conf "$pkgdir"/usr/lib/sysusers.d/mautrix-facebook.conf
  install -Dm644 "$srcdir"/tmpfiles-mautrix-facebook.conf "$pkgdir"/usr/lib/tmpfiles.d/mautrix-facebook.conf
}
