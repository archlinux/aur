# Maintainer: Jon Gjengset <jon@tsp.io>
# Contributor: Alfredo Palhares <masterkorp@masterkorp.net>
# Contributor: Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>

pkgname=bugseverywhere-git
_gitname="be"
pkgver=1.5.r1671.4980830
pkgrel=3
epoch=2
pkgdesc="A distributed bugtracker"
arch=('any')
url="http://bugseverywhere.org/"
license=('GPL')
depends=("python2" "python2-jinja")
makedepends=('git' 'ed' 'python2-docutils')
optdepends=(
  'python2-cherrypy: HTTPS support'
  'python2-yaml: upgrading of BE directories < v1.5'
)
provides=('bugseverywhere')
conflicts=('bugseverywhere' 'bugseverywhere-bzr')
options=(!emptydirs)
source=("$_gitname::git://gitorious.org/be/be.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  echo $(cat .be/version | sed 's/^.*v\([0-9\.]*\)/\1/').r$(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$_gitname"
  sed -i 's/	python /	python2 /' Makefile
  sed -i 's/	python /	python2 /' doc/Makefile
  make libbe/_version.py
  make RST2MAN=/usr/bin/rst2man2.py DOC=man build
}

package() {
  cd "$_gitname"
  make RST2MAN=/usr/bin/rst2man2.py DOC=man INSTALL_OPTIONS="--prefix=${pkgdir}/usr" install
  install -Dm 644 misc/completion/be.bash "${pkgdir}"/usr/share/bash-completion/completions/be
  install -Dm 644 misc/completion/be.zsh "${pkgdir}"/usr/share/zsh/site-functions/_be
}

# vim:set ts=2 sw=2 et:
