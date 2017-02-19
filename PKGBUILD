# Maintainer: Anshuman Bhaduri <anshuman at bhadurian dot com>
# Contributor: Adam Russell <adamlr6+arch@gmail.com>
# Contributor: halim <sagikliwon@gmail.com>
# Contributor: Alexey "Mr.Cat" Bakhirkin <abakhirkin(at)gmail.com>
# Contributor: André Klitzing <aklitzing () online () de>
# Contributor: Yumi Nanako <yumileroy [at] yahoo.com>

_pkgname=thg
pkgname=tortoisehg-hg
pkgver=4.0.2.18140
pkgrel=1
pkgdesc="Mercurial GUI front end"
arch=('i686' 'x86_64')
url="http://tortoisehg.bitbucket.org/"
license=('GPL2')
depends=('python2' 'mercurial' 'python2-pyqt4' 'python2-qscintilla')
optdepends=('python2-iniparse: ini file support'
            'python2-pygments: syntax highlighting'
            'python2-nautilus: Python binding for Nautilus components')
provides=('tortoisehg')
conflicts=('tortoisehg')
source=("hg+https://bitbucket.org/tortoisehg/${_pkgname}#branch=stable"
        'config.py')
md5sums=('SKIP'
         '2e04ba5fdcb361cd68e9ef7ed4c987a5')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  # Version string will be similar to 2.7.2.14004
  # Use the last tag when latesttag returns a list of tags
  echo $(hg parents --template '{word(-1,latesttag,":")}').$(hg identify -n)
}

build() {
  cd "${srcdir}/${_pkgname}"
  cp "${srcdir}/config.py" "${srcdir}/${_pkgname}/tortoisehg/util"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"
  python2 setup.py install --root="${pkgdir}"
  install -Dm 644 "contrib/mergetools.rc" \
    "${pkgdir}/etc/mercurial/hgrc.d/thgmergetools.rc"
  install -Dm 644 "contrib/thg.desktop" \
    "${pkgdir}/usr/share/applications/thg.desktop"
  install -Dm 644 "icons/svg/thg_logo.svg" \
    "${pkgdir}/usr/share/pixmaps/thg_logo.svg"

  # Remove files conflicting with Mercurial.
  # https://bitbucket.org/tortoisehg/thg/issues/4629/
  rm -f "${pkgdir}/usr/lib/python2.7/site-packages/hgext3rd/__init__.py" \
    "${pkgdir}/usr/lib/python2.7/site-packages/hgext3rd/__init__.pyc" \
    "${pkgdir}/usr/lib/python2.7/site-packages/hgext3rd/__init__.pyo"

  # Remove VCS leftovers.
  find "${pkgdir}" -type d -name .hg -exec rm -r '{}' +
}
