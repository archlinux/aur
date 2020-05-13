# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

pkgname=(conversejs-git conversejs-epiphany-git)
pkgver=6.0.0.r364.gefb486511
pkgrel=1
arch=('any')
url="https://conversejs.org/"
license=('MPL2')
makedepends=('git' 'npm')
source=('git+https://github.com/conversejs/converse.js'
        'launcher.sh'
        'launcher.desktop')
sha256sums=('SKIP'
            'c60e2d176324ac7438f8518e8ea5095255cd6a02d93c1bf62a0e76ff71d0eacc'
            'efa2f4cee2e33082936df006a9553bf5a276b6a1f85fee4d2bcfbcad0483effb')

pkgver() {
  cd converse.js
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd converse.js
  rm -rf dist
  make dist
  gzip -vfk9 dist/converse.min.js* \
    dist/converse.min.css* \
    dist/webfonts/*.svg \
    dist/locales/*.js* \
    dist/locales/dayjs/*.js*
}

package_conversejs-git() {
  pkgdesc='Web-based XMPP/Jabber chat client written in javascript'

  cd converse.js
  install -dm755 "$pkgdir"/usr/share/webapps/converse.js/images
  cp -r dist "$pkgdir"/usr/share/webapps/converse.js/
  cp -r sounds "$pkgdir"/usr/share/webapps/converse.js/
  cp -r images/favicon.ico "$pkgdir"/usr/share/webapps/converse.js/images/

  install -Dm644 fullscreen.html "$pkgdir"/usr/share/webapps/converse.js/
}

package_conversejs-epiphany-git() {
  depends=('epiphany' 'conversejs-git' 'python')
  pkgdesc='Desktop launcher for Converse.js'

  install -Dm755 ../launcher.sh "$pkgdir"/usr/bin/conversejs
  install -Dm644 ../launcher.desktop "$pkgdir"/usr/share/applications/conversejs.desktop
}
