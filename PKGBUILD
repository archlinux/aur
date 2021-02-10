# Maintainer: Anty0 <anty150 at gmail dot com>

pkgname='python-zulip-term-git'
_pkgname='zulip-terminal'
pkgver=0.6.0.r23.501fac4bbe
pkgrel=1
pkgdesc="An interactive terminal interface for Zulip"
url="https://github.com/zulip/zulip-terminal"
arch=('any')
license=('GPL')
depends=('python'
         'python-urwid'
         'python-urwid_readline'
         'python-lxml'
         'python-beautifulsoup4'
         'python-zulip-api'
         'python-typing_extensions'
         'python-dateutil'
         'python-tzlocal')
makedepends=('python-setuptools')
provides=('python-zulip-term')
conflicts=('python-zulip-term')
source=('git://github.com/zulip/zulip-terminal#branch=main')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "%s" "$(git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./')"
}

prepare() {
  cd "$srcdir/$_pkgname"
  # Remove version checks for dependant python packages
  #   (little hacky, but allows us to use
  #   zulip-term without downgrading packages)
  # This is no longer required
  #sed -ri "s/'(.+)[=><]=.+'/'\1'/" setup.py
}

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build_ext --inplace
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="${pkgdir}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
