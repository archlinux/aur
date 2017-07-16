# Maintainer: Tom Wadley <tom@tomwadley.net>

pkgname=buildnotify-hg
pkgver=0.3.5.r136.585a05ab77f8
pkgrel=1
pkgdesc="Cruise Control build monitor for Windows/Linux/Mac"
arch=('any')
url="http://bitbucket.org/Anay/buildnotify/"
license=('GPL3')
depends=('python2' 'python2-pyqt4' 'python2-pytz' 'python2-dateutil' 'python2-keyring')
makedepends=('mercurial' 'python2-setuptools')
source=("hg+https://bitbucket.org/Anay/buildnotify"
        "buildnotify.desktop")
md5sums=('SKIP'
         '2f25214b688c6eb571ad2bb52c13beec')

_installmodule() {
  pushd "${srcdir}/buildnotify"
  /usr/bin/python2 setup.py install --root="${pkgdir}/" --optimize=1
  popd
}

pkgver() {
  _installmodule > /dev/null 2>&1

  version=$(PYTHONPATH="${srcdir}/buildnotify/" /usr/bin/python2 <<EOF
import pkg_resources
print pkg_resources.require('buildnotify')[0].version
EOF
  )

  cd "${srcdir}/buildnotify"
  printf "%s.r%s.%s" "$version" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  _installmodule

  cd "${srcdir}"

  install -D -m 644 buildnotify.desktop "${pkgdir}/usr/share/applications/buildnotify.desktop"

  cd buildnotify

  install -D -m 644 icons/buildnotify.svg "${pkgdir}/usr/share/pixmaps/buildnotify.svg"
}

# vim:set ts=2 sw=2 et:
