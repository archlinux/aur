# Maintainer: Jack O'Sullivan <jackos1998 at gmail dot com>

_pkgbase=riot
_pkgname=riot-web
pkgname=riot-web-develop-git
pkgver=r6845.8630d031
pkgrel=1
pkgdesc="A glossy Matrix collaboration client for the web (develop branch)."
arch=('any')
url="https://riot.im"
_url="https://github.com/vector-im/riot-web"
license=('Apache')
makedepends=('npm' 'git')
source=("git+${_url}#branch=develop"
		"fetch-deps.patch")
sha256sums=('SKIP'
            'd6428c19067f447a051bedf49a28686c5e60ab3bbb3534065889584e28f61cf5')
provides=('vector-web')  # @vith
replaces=('vector-web')  # @vith
conflicts=('vector-web')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${_pkgname}
  patch -Np0 < ../fetch-deps.patch
}

build() {
  cd ${_pkgname}
  GIT_BRANCH=develop scripts/fetch-develop.deps.sh
  npm run build --cache ../npm-cache
}

package() {
  cd ${_pkgname}

  install -d "${pkgdir}"/{usr/share/webapps,etc/webapps}/${_pkgbase}

  cp -r webapp/* "${pkgdir}"/usr/share/webapps/${_pkgbase}/
  install -Dm644 config.sample.json -t "${pkgdir}"/etc/webapps/${_pkgbase}/
  ln -s /etc/webapps/${_pkgbase}/config.json "${pkgdir}"/usr/share/webapps/${_pkgbase}/
  echo "${pkgver}" > "${pkgdir}"/usr/share/webapps/${_pkgbase}/version
}
