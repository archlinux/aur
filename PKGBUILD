# Maintainer: la Fleur <lafleur@boum.org>
# Contributor: la Fleur <lafleur@boum.org>

pkgname=upycraft-git
pkgver=r69.68dfc44
pkgrel=1
pkgdesc="Qt IDE for micropython"
arch=("any")
url="https://dfrobot.gitbooks.io/upycraft/"
license=("unknown")
#depends=("python" "qt4" "python-pyqt4" "qwt-qt4" "qscintilla-qt4" "python-qscintilla-qt4")
# qt4 gets pulled by qscintilla-qt4
# qscintilla-qt4 gets pulled in by python-qscintilla-qt4
# python-pyqt4 gets pulled by python-qscintilla-qt4
depends=("python-qscintilla-qt4")
#makedepends=("git" "pyinstaller-git")
makedepends=("git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
#options=(!emptydirs)
source=("${pkgname%-git}::git+http://github.com/DFRobot/uPyCraft_src")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  # git, no tags available
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  #cd "${srcdir}/${pkgname%-git}"
  #pyinstaller -F uPyCraft.py

  # This program does not have any packaging system ; pyinstaller fails to create
  # a usable binary under Arch, so we'll just copy the script dir to /usr/share and
  # create a one liner to start it.

  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share
  cp -r ${pkgname%-git} ${pkgdir}/usr/share
  rm -r ${pkgdir}/usr/share/${pkgname%-git}/.git
  cat > ${pkgdir}/usr/bin/uPyCraft << EOF
#!/bin/sh

python /usr/share/${pkgname%-git}/uPyCraft.py "$@"
EOF
  chmod a+x ${pkgdir}/usr/bin/uPyCraft
}
