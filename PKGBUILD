# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>

pkgname=python38-matplotlib
pkgver=3.6.2
pkgrel=1
pkgdesc="A python plotting library, making publication quality plots"
arch=(x86_64)
url="https://matplotlib.org"
license=(custom)
depends=(freetype2 python38-contourpy python38-cycler python38-dateutil python38-fonttools python38-kiwisolver python38-numpy
         python38-packaging python38-pillow python38-pyparsing qhull)
optdepends=('tk: Tk{Agg,Cairo} backends'
            'pyside2: alternative for Qt5{Agg,Cairo} backends'
            'pyside6: alternative for Qt6{Agg,Cairo} backends'
            'python38-pyqt5: Qt5{Agg,Cairo} backends'
            'python38-pyqt6: Qt6{Agg,Cairo} backends'
            'python38-gobject: for GTK{3,4}{Agg,Cairo} backend'
            'python38-wxpython: WX{Agg,Cairo} backend'
            'python38-cairo: {GTK{3,4},Qt{5,6},Tk,WX}Cairo backends'
            'python38-cairocffi: alternative for Cairo backends'
            'python38-tornado: WebAgg backend'
            'ffmpeg: for saving movies'
            'imagemagick: for saving animated gifs'
            'ghostscript: usetex dependencies'
            'texlive-bin: usetex dependencies'
            'texlive-latexextra: usetex usage with pdflatex'
            'python38-certifi: https support')
makedepends=(git python38-setuptools-scm-git-archive python38-certifi)
checkdepends=(python38-pytest python38-pytest-xdist python38-pytest-runner python38-pytest-rerunfailures xorg-server-xvfb
              texlive-bin texlive-core texlive-latexextra texlive-pictures ghostscript inkscape ffmpeg imagemagick
              gtk4 python38-cairo python38-cairocffi python38-gobject python38-pyqt5 pyside2 python38-pyqt6 pyside6 python38-tornado python38-wxpython tk
              jupyter-nbconvert jupyter-nbformat python38-ipykernel python38-pandas python38-pikepdf python38-pytz)
_tag=4a8e97684d016a1624b2977977aaeae29210a46e # git rev-parse v${pkgver}
_ftver=2.12.1
source=(git+https://github.com/matplotlib/matplotlib.git#tag=${_tag}?signed
        https://github.com/QuLogic/mpl-images/archive/v${pkgver}-with-freetype-${_ftver}/mpl-images-${pkgver}-ft${_ftver}.tar.gz
        freetype.patch)
b2sums=('SKIP'
        '278ee8efcdf7b0eb0767d9d5478deac8565ef44510f3714f86396fb6255c7a2c509ea7881aed40463681a4c77ef57a323c5cde4f9ebc322a0a3c5048014fb59d'
        'b821f938cace434932a43b15b42b93d0f8eaffea4e28fbf1d5a7263ec947c26252bafccaea60c1a1cb2fad4c71280ca2cf62527994f270af2467a242287470bb')
validpgpkeys=(23CAB59E3332F94D26BEF0378D86E7FAE5EB0C10) # Elliott Sales de Andrade <quantum.analyst@gmail.com>

prepare() {
  cd matplotlib
  # Fix SCM detected version
  rm -r .git
  echo "Version: ${pkgver}" > PKG-INFO
  # Use system freetype and qhull
  sed -e 's|#system_freetype = False|system_freetype = True|' -e 's|#system_qhull = False|system_qhull = True|' mplsetup.cfg.template > mplsetup.cfg
  patch -p1 < ../freetype.patch # From Fedora/upstream
  sed -e 's|2_000_000|2_500_000|' -i lib/matplotlib/tests/test_backends_interactive.py
  # Install tests for check()
  sed -i 's|#tests = False|tests = True|' mplsetup.cfg
  # Use appropriate baseline images for tests
  for _module in matplotlib mpl_toolkits
  do
    cp -r ../mpl-images-${pkgver}-with-freetype-${_ftver}/${_module}/* lib/${_module}/tests/baseline_images/
  done
}

build() {
  cd matplotlib
  python3.8 setup.py build
}

check() {
  cd matplotlib
  python3.8 -m venv --system-site-packages test-env
  test-env/bin/python setup.py install --skip-build
  # test_ipynb: https://github.com/matplotlib/matplotlib/issues/21654 fixed but `ModuleNotFoundError: No module named 'matplotlib'`
  # test_cross_Qt_imports https://github.com/matplotlib/matplotlib/issues/23004
  xvfb-run -a -s "-screen 0 640x480x24" \
    test-env/bin/python -m pytest -ra -n auto -v --color=yes --pyargs matplotlib mpl_toolkits.tests -k 'not test_ipynb and not test_cross_Qt_imports'
}

package() {
  cd matplotlib
  python setup.py install --root "${pkgdir}" --prefix=/usr --optimize=1 --skip-build
  install -Dm644 doc/users/project/license.rst -t "${pkgdir}"/usr/share/licenses/${pkgname}/
  # Remove tests
  rm -r "${pkgdir}"$(python3.8 -m "import site; print(site.getsitepackages()[0])")/{matplotlib,mpl_toolkits}/tests/
}
