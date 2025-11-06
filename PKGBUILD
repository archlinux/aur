# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: jddolvin <jddolvin at atheist dot com>
# Contributor: arriagga <ramon.arriaga at gmail dot com>
# Contributor: dieghen89 <dieghen89 at gmail dot com>

pkgname=musique111-qt5
_pkgname=musique
pkgver=1.11
pkgrel=1
pkgdesc='A finely crafted music player'
arch=('x86_64')
url='https://flavio.tordini.org/musique'
_giturl='https://github.com/flaviotordini'
license=('GPL3')
depends=('qt5-declarative' 'taglib' 'mpv')
makedepends=('git' 'qt5-tools')
optdepends=('finetune')
conflicts=('musique')
source=("git+${_giturl}/musique.git#tag=${pkgver}"
        "git+${_giturl}/http.git"
        "git+${_giturl}/idle.git"
        "git+${_giturl}/media.git"
        "git+${_giturl}/updater.git"
        "git+${_giturl}/js.git"
        "git+${_giturl}/sharedcache.git"
        "taglib.patch")
sha256sums=('d75973694829a2ebce39c1669f60ed8f03c9565304f2619fe9159348b11d05b7'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'b130aa1adfe5973ca5ba9943b5fa30302d9db762c711ab86cd5e146a8db090fe')

prepare() {
  cd $_pkgname
  git submodule init
  git config submodule.lib/http.url "$srcdir/http"
  git config submodule.lib/idle.url "$srcdir/idle"
  git config submodule.lib/media.url "$srcdir/media"
  git config submodule.lib/updater.url "$srcdir/updater"
  git config submodule.lib/js.url "$srcdir/js"
  git config submodule.lib/sharedcache.url "$srcdir/sharedcache"
  git -c protocol.file.allow=always submodule update

  patch -Np1 <$srcdir/taglib.patch
}

build() {
  PATH="$PATH:/usr/lib/qt5/bin"
  qmake $_pkgname PREFIX=/usr
  make
}

package() {
  make INSTALL_ROOT="$pkgdir" install
}

