# Maintainer: bobpaul

_pkgbase=matrix-puppet-hangouts
pkgname=${_pkgbase}-git
pkgver=r57.b055642
pkgrel=3
pkgdesc="Unmaintained, single user Node.js Hangouts bridge for Matrix-Synapse <1.10.x"
arch=(any)
conflicts=(matrix-puppet-hangouts
	       'matrix-synapse>=1.10.0')
license=(Apache)
depends=(nodejs hangups-git)
makedepends=(npm git)
url="https://github.com/matrix-hacks/matrix-puppet-hangouts"
optdepends=('python: for maintenance scripts'
	        'matrix-synapse<1.10.0: if also hosting a homeserver'
           )
source=("${_pkgbase}::git+https://github.com/matrix-hacks/${_pkgbase}"
	   "README"
	   "setup.sh"
	   "config-paths.patch"
	   "hangups_manual_login.py"
	    "sysusers-matrix-hangouts.conf"
	    "tmpfiles-matrix-hangouts.conf"
	   "${_pkgbase}@.service")
md5sums=('SKIP'
         '0d02b2c6ff05a1477e3e65aa242b064c'
         '09214cd85350e18a0ba2bb38c8420005'
         '1fa946f5f038d84121bea3d3e3b915ee'
         '7dd4e8eae5064114ff5f85bb94ce21c0'
         '5c2a8067f31008533e7c99817d8c7f7e'
         '6c86d68053b5c9eaab4559d2877857cc'
         '2d9a363877fef22a7fae46fef7669abf')

pkgver() {
  cd "$srcdir/${_pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${_pkgbase}"
  git reset --hard
  patch < ../config-paths.patch
}

build() {
  cd "$srcdir/${_pkgbase}"
  npm install
}

package() {
  cd "$srcdir/${_pkgbase}"
  npm install --cache ./npm-cache -g --user root --prefix "${pkgdir}"/usr

  # Apparently it now symlinks to the source folder…
  rm -f "${pkgdir}"/usr/lib/node_modules/${_pkgbase}
  mkdir -p "${pkgdir}"/usr/lib/node_modules/${_pkgbase}
  cp -r * "${pkgdir}"/usr/lib/node_modules/${_pkgbase}/
  chmod -R go-w "${pkgdir}"/usr/lib/
  chown -R root:root "${pkgdir}"/usr

  #TODO: make synapse user and chown these files so we aren't dependent on synapse package
  mkdir -p "${pkgdir}"/etc/synapse/"${_pkgbase}"/
  install -Dm644 config.sample.json -t "${pkgdir}"/etc/synapse/"${_pkgbase}"/

  cd "$srcdir/"
  install -Dm644 hangups_manual_login.py -t "${pkgdir}"/usr/lib/node_modules/${_pkgbase}/
  install -Dm644 README -t "${pkgdir}"/etc/synapse/"${_pkgbase}"/
  install -Dm644 setup.sh -t "${pkgdir}"/etc/synapse/"${_pkgbase}"/
  install -Dm644 ${_pkgbase}@.service -t  "${pkgdir}"/usr/lib/systemd/system/
  install -Dm644 "$srcdir"/sysusers-matrix-hangouts.conf "$pkgdir"/usr/lib/sysusers.d/matrix-puppet-hangouts.conf
  install -Dm644 "$srcdir"/tmpfiles-matrix-hangouts.conf "$pkgdir"/usr/lib/tmpfiles.d/matrix-puppet-hangouts.conf
}
