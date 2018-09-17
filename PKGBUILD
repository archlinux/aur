# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Forked from aur/buildbot. Original contributors:
# Contributor: xRemaLx <anton.komolov@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgbase=buildbot-www-git
pkgname=('python-buildbot-www-git' 'python-buildbot-waterfall-view-git'
         'python-buildbot-console-view-git' 'python-buildbot-grid-view-git'
         'python-buildbot-wsgi-dashboards-git' 'python-buildbot-badges-git'
         )
pkgver=1.3.0.r168.g4680f8e25
pkgrel=2
arch=('any')
url="https://buildbot.net"
license=("GPL2")
makedepends=('git' 'buildbot-git' 'python-buildbot-pkg-git' 'python-mock')
source=(git+https://github.com/buildbot/buildbot.git
        cairosvg2.patch)
sha256sums=('SKIP'
            'efb460cb040cfd2438d63df51cc7ffd93444dd9d6e1b172f870f4ffce5bafda8')

pkgver() {
  cd buildbot
  ( set -o pipefail
    git describe --long --tag 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
  )
}

prepare() {
  cd buildbot

  patch -Np1 -i ../cairosvg2.patch

  # registry.yarnpkg.com is going to be deprecated, and sometimes this domain
  # name fails to resolve
  # https://github.com/yarnpkg/yarn/issues/5891
  sed -i 's#registry.yarnpkg.com#registry.npmjs.org#' www/*/yarn.lock
}

build() {
  for module in base waterfall_view console_view grid_view wsgi_dashboards badges
  do
    cd "$srcdir/buildbot/www/$module"
    python setup.py build
  done
}

package_python-buildbot-www-git() {
  pkgdesc="Buildbot UI"
  depends=('buildbot-git')
  provides=("python-buildbot-www=$pkgver")
  conflicts=('python-buildbot-www')
  optdepends=(
    'python-buildbot-waterfall-view'
    'python-buildbot-console-view'
    'python-buildbot-grid-view'
    'python-buildbot-badges'
  )

  cd buildbot/www/base
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python-buildbot-waterfall-view-git() {
  pkgdesc="Buildbot Waterfall View plugin"
  depends=('buildbot-git')
  provides=("python-buildbot-waterfall-view=$pkgver")
  conflicts=('python-buildbot-waterfall-view')

  cd buildbot/www/waterfall_view
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python-buildbot-console-view-git() {
  pkgdesc="Buildbot Console View plugin"
  depends=('buildbot-git')
  provides=("python-buildbot-console-view=$pkgver")
  conflicts=('python-buildbot-console-view')

  cd buildbot/www/console_view
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python-buildbot-grid-view-git() {
  pkgdesc="Buildbot Grid View plugin"
  depends=('buildbot-git')
  provides=("python-buildbot-grid-view=$pkgver")
  conflicts=('python-buildbot-grid-view')

  cd buildbot/www/grid_view
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python-buildbot-wsgi-dashboards-git() {
  pkgdesc="Buildbot plugin to integrate flask or bottle dashboards to buildbot UI"
  depends=('buildbot-git')
  provides=("python-buildbot-wsgi-dashboards=$pkgver")
  conflicts=('python-buildbot-wsgi-dashboards')

  cd buildbot/www/wsgi_dashboards
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python-buildbot-badges-git() {
  pkgdesc="Buildbot badges"
  depends=('buildbot-git' 'python-klein' 'python-cairosvg' 'python-cairocffi' 'python-jinja')
  provides=("python-buildbot-badges=$pkgver")
  conflicts=('python-buildbot-badges')

  cd buildbot/www/badges
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim: set et ts=2 sw=2:
