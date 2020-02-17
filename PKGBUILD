# Maintainer: bobpaul

_pkgbase=matrix-puppet-hangouts
pkgname=${_pkgbase}-git
pkgver=r57.b055642
pkgrel=2
pkgdesc="Single user Node.js Hangouts bridge for Matrix-Synapse <1.10.x"
arch=(any)
conflicts=(matrix-puppet-hangouts
	       'matrix-synapse>=1.10.0')
license=(Apache)
depends=(nodejs hangups-git)
makedepends=(npm git)
optdepends=('python: for maintenance scripts'
	        'matrix-synapse<1.10.0: if also hosting a homeserver'
           )
source=("${_pkgbase}::git+https://github.com/matrix-hacks/${_pkgbase}"
	   "README"
	   "setup.sh"
	   "config-paths.patch"
	   "hangups_manual_login.py"
	   "${_pkgbase}@.service")
sha256sums=('SKIP'
            '69aaa542079a8fa4a4ac73a0598acef5d2991a24b657af987c13014ee96e21e0'
            '19bc3e24513c0c580dc862f2fc14f40baff9b4d2b09280586014042af32881bf'
            '7e17b23c7f23558e1cdee0bd3e3c0820c91ac1f05a2b7ce7edcbc750413aa371'
            '39ef6f75eed3c743bafc3974e83a8916446120985a5e2b39f9c6aa70abfbe585'
            'e80f54718c308237eeae039326c69e6b599c6578db3ed72ab7b79d2f8e1c38d6')

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
  mkdir -p "${pkgdir}"/var/lib/${_pkgbase}/
 # touch "${pkgdir}"/var/lib/${_pkgbase}/.pkg
  chmod -R go-w "${pkgdir}"/var/lib/
  chown -R root:root "${pkgdir}"/var
  chown -R synapse:synapse "${pkgdir}"/var/lib/${_pkgbase}

  #TODO: make synapse user and chown these files so we aren't dependent on synapse package
  mkdir -p "${pkgdir}"/etc/synapse/"${_pkgbase}"/
  install -Dm644 config.sample.json -t "${pkgdir}"/etc/synapse/"${_pkgbase}"/

  cd "$srcdir/"
  install -Dm644 hangups_manual_login.py -t "${pkgdir}"/usr/lib/node_modules/${_pkgbase}/
  install -Dm644 README -t "${pkgdir}"/etc/synapse/"${_pkgbase}"/
  install -Dm644 setup.sh -t "${pkgdir}"/etc/synapse/"${_pkgbase}"/
  install -Dm644 ${_pkgbase}@.service -t  "${pkgdir}"/usr/lib/systemd/system/
}
