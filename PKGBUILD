# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: PepeSmith
# Contributor: Aron Asor <aronasorman at gmail.com>
# Contributor: Chris Brannon <chris@the-brannons.com>
# Contributor : Douglas Soares de Andrade <dsa@aur.archlinux.org>

# This is no longer a split package with ipython
# because 6.X will never support python2

_py=python2
_pkg=ipython
pkgname="${_pkg}2"
pkgver=5.9.0
pkgrel=1
pkgdesc="An enhanced Interactive Python2 shell."
arch=('any')
url="https://${_pkg}.org"
_url="https://github.com/${_pkg}/${_pkg}"
license=('BSD')
depends=(
  "${_py}"
  "${_py}-traitlets"
  "${_py}-pexpect"
  'sqlite'
  "${_py}-setuptools"
  "${_py}-pickleshare"
  "${_py}-pathlib"
  "${_py}-backports.shutil_get_terminal_size"
  "${_py}-prompt_toolkit1"
)
optdepends=(
  "wxpython: needed for ipython2 --gui=wx" # does this should be fixed?
  "${_py}-nose: for IPython's test suite"
)
makedepends=(
  "${_py}-setuptools"
)
provides=(
  "${_py}-${pkgname}=${pkgver}"
)
_pypi_url="https://files.pythonhosted.org/packages/source"
_packal_url="https://www.packal.org/sites/default/files/public/styles/icon_large/public/workflow-files"
source=(
  "${pkgname}-${pkgver}.tgz::${_url}/archive/${pkgver}.tar.gz"
  "${_pypi_url}/s/simplegeneric/simplegeneric-0.8.1.zip"
  "${_packal_url}/nkeimipynbworkflow/icon/icon.png")
md5sums=(
  'd8905868c8618494827b4546608540b8'
  'f9c1fab00fd981be588fc32759f474e3'
  '2901d65f1b1fe354e72850085cd1c072'
)

# simplegeneric (so old that it only comes in .zip and still refers to the cheeseshop)
# confirm that an update does not break sage?

prepare() {
  cd "${_pkg}-${pkgver}"
  find ./ -type f -exec sed -i -e 's/prompt_toolkit/prompt_toolkit1/g' {} \;
}

build() {
  cd "${srcdir}"
}

package() {
  cd "${srcdir}/${_pkg}-${pkgver}"

  "${_py}" setup.py install --prefix=/usr \
                            --root="${pkgdir}" \
                            --optimize=0

  cd "${srcdir}/simplegeneric-0.8.1"
  "${_py}" setup.py install --prefix=/usr \
                            --root="${pkgdir}" \
                            --optimize=0

  cd "${srcdir}/${_pkg}-${pkgver}"
  install -Dm644 docs/source/about/license_and_copyright.rst \
          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # hack to get around ipython collision
  cd "${pkgdir}/usr/share/man/man1/"
  for i in *; do
    mv $i ${i/%.1/2.1}
  done
  find "${pkgdir}/usr/bin/" -type f -regex '.*[^2]$' -delete

  cd "$srcdir/${_pkg}-${pkgver}/examples/IPython Kernel/"
  sed -i 's/ython/ython2/g' *.desktop
  sed -i "s/gnome-netstatus-idle/${pkgname}/" *.desktop
  install -Dm644 "${_pkg}.desktop" \
          "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  # install -Dm644 ipython-qtconsole.desktop \
  #         "$pkgdir/usr/share/applications/ipython2-qtconsole.desktop"
  install -Dm644 "${srcdir}/icon.png" \
          "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  #cd "$pkgdir/usr/share/man/man1/IPython/qt/console/resources/icon/"
  # install -Dm644 IPythonConsole.svg \
  #         "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
}

# vim:set sw=2 sts=-1 et:
