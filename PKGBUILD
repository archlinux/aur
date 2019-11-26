# Maintainer: Patrice Lacouture <archlinux at lacouture.org>
# Contributor: Chris Billington <chrisjbillington at gmail.com>
# Contributor: Anshuman Bhaduri <anshuman at bhadurian dot com>
# Contributor: Adam Russell <adamlr6+arch@gmail.com>
# Contributor: halim <sagikliwon@gmail.com>
# Contributor: Alexey "Mr.Cat" Bakhirkin <abakhirkin(at)gmail.com>
# Contributor: André Klitzing <aklitzing () online () de>
# Contributor: Yumi Nanako <yumileroy [at] yahoo.com>

_pkgname=thg
pkgname=tortoisehg-hg
pkgver=5.1.19038
pkgrel=1
pkgdesc="Mercurial GUI front end"
arch=('i686' 'x86_64')
url="https://bitbucket.org/tortoisehg/thg"
license=('GPL2')
depends=('python' 'mercurial' 'python-pyqt5' 'python-qscintilla-qt5' 'python-iniparse')
optdepends=('python-pygments: syntax highlighting'
            'python-nautilus: Python binding for Nautilus components')
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
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="${pkgdir}"
  install -Dm 644 "contrib/mergetools.rc" \
    "${pkgdir}/etc/mercurial/hgrc.d/thgmergetools.rc"
  install -Dm 644 "contrib/thg.desktop" \
    "${pkgdir}/usr/share/applications/thg.desktop"
  install -Dm 644 "icons/svg/thg_logo.svg" \
    "${pkgdir}/usr/share/pixmaps/thg_logo.svg"

  PYTHONMINOR=$(python -c 'import sys; print(sys.version_info.minor)')
  SITEPACKAGES="${pkgdir}/usr/lib/python3.${PYTHONMINOR}/site-packages"
  # Remove files conflicting with Mercurial.
  # https://bitbucket.org/tortoisehg/thg/issues/4629/
  rm -f "${SITEPACKAGES}/hgext3rd/__init__.py" \
    "${SITEPACKAGES}/hgext3rd/__pycache__/__init__.cpython-3${PYTHONMINOR}.pyc" \
    "${SITEPACKAGES}/hgext3rd/__pycache__/__init__.cpython-3${PYTHONMINOR}.opt-1.pyc"

  # Remove VCS leftovers.
  find "${pkgdir}" -type d -name .hg -exec rm -r '{}' +
}
