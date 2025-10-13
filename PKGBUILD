# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-sherpa
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=4.18.0
pkgrel=1
pkgdesc="Modeling and fitting package for scientific data analysis"
arch=('i686' 'x86_64')
url="http://cxc.cfa.harvard.edu/contrib/sherpa"
license=('GPL-3.0-or-later')
makedepends=('python-setuptools'
             'python-build'
             'python-installer'
             'python-numpy'
             'fftw')
#            'python-sphinx-astropy'
#            'python-sphinx_rtd_theme'
#            'python-matplotlib'
#            'python-nbsphinx>=0.8.6'
#            'pandoc'
#            'python-arviz'
#            'python-astropy'
#            'python-bokeh'
#            'python-optimagic'
#            'graphviz'
#)  # wheel required by new setuptools
#'gcc-fortran')
#checkdepends=('python-pytest-xdist'
#              'python-pytest-xvfb'
#              'xorg-server-xvfb'
#              'python-pytest-doctestplus'
#              'python-arviz'
##              'python-typing_extensions'
#               'python-bokeh'
#               'python-astropy'
#               'python-optimagic'
#              ds9
##             libxml2-legacy
##             xpa
#              'python-matplotlib'
#              )
#             'ds9'
#             'stk')-xvfb   # bokeh already in makedepends, scipy,typing_extensions <- arviz,optimagic
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
#       "sherpa-test-data-${pkgver}.tar.gz::https://github.com/sherpa/sherpa-test-data/archive/refs/tags/4.17.1.tar.gz"
        "${pkgver}-setup.cfg::https://github.com/sherpa/sherpa/raw/refs/tags/${pkgver}/setup.cfg"
        'sherpa_local_fftw.patch')
md5sums=('6342a97253fb0e65298379c061d6b2fe'
         '089ef5cc28f1702d2f58989bd422d006'
         '4f6a822dd67d19c0170521bad3f30b4f')

#get_pyver() {
#    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
#}

get_pyinfo() {
    [[ $1 == "site" ]] && python -c "import site; print(site.getsitepackages()[0])" || \
        python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    mv setup.cfg pypi-setup.cfg
    cp {${srcdir}/${pkgver}-,}setup.cfg
    sed -n '/egg_info/,$p' pypi-setup.cfg >> setup.cfg
    patch -Np1 -i "${srcdir}/sherpa_local_fftw.patch"
    rm -r extern/fftw-*
#   sed -i -e '/^import\ setuptools/c from setuptools import setup' -e '/distutils/d' setup.py
#   sed -i -e '/setuptools.command/s/^#\ //' -e '/distutils/d' helpers/__init__.py
#   sed -i -e "/^sherpa_inc/s/]/, numpy.get_include()]/" \
#          -e '/^from/a import numpy' helpers/extensions/__init__.py
#   sed -e '/'\'nbsphinx\''/a \    '\'IPython\.sphinxext\.ipython_console_highlighting\','' \
#       -i docs/conf.py
}

build() {
#   unset LDFLAGS
    cd ${srcdir}/${_pyname}-${pkgver}
#   CC=gcc-14 CXX=g++-14 python -m build --wheel --no-isolation --skip-dependency-check
    CFLAGS="${CFLAGS} -std=gnu17" python -m build --wheel --no-isolation --skip-dependency-check
#   cp build/{lib/python$(get_pyinfo .)/site-packages/*.so,lib.linux-${CARCH}-cpython-$(get_pyinfo)}

#   # Take more than 10 min, needs >100M testdata
#   msg "Building Docs"
#   ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname/-/_}*egg-info \
#       build/lib.linux-${CARCH}-cpython-$(get_pyinfo)/${_pyname/-/_}-${pkgver}-py$(get_pyinfo .).egg-info
#   PYTHONPATH="${srcdir}/sherpa-test-data-4.17.1:../build/lib.linux-${CARCH}-cpython-$(get_pyinfo):../$(get_pyinfo site | sed 's:/usr:build:')" make -C docs html
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#    # Take more than 10 min, needs >100M testdata
#    ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname/-/_}*egg-info \
#        build/lib.linux-${CARCH}-cpython-$(get_pyinfo)/${_pyname/-/_}-${pkgver}-py$(get_pyinfo .).egg-info
##   PYTHONPATH="${srcdir}/sherpa-test-data-4.17.1:$(get_pyinfo site | sed 's:/usr:build:')" \
##       pytest --pyargs "build/lib.linux-${CARCH}-cpython-$(get_pyinfo)/sherpa" --runslow --runzenodo --runsession --runcores -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 \
##       --deselect=build/lib.linux-${CARCH}-cpython-$(get_pyinfo)/sherpa/tests/test_sherpa.py::test_todo_latest_success #--dist=loadgroup -n 4 #|| warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count --dist=loadgroup -n auto --runspeed
#    PYTHONPATH="${srcdir}/sherpa-test-data-4.17.1:$(get_pyinfo site | sed 's:/usr:build:')" \
#        pytest --pyargs "build/lib.linux-${CARCH}-cpython-$(get_pyinfo)/sherpa/astro/ui/tests/test_astro_session_image.py" --runslow --runzenodo --runsession --runcores -vv -l -ra --color=yes -o console_output_style=count --xvfb-backend xvfb
#}

package_python-sherpa() {
    depends=('python>=3.10' 'python-numpy>=1.21.0' 'fftw')
    optdepends=('python-matplotlib: Graphical output'
                'python-astropy>=3.2.1: Data I/O support'
                'python-arviz: sherpa.sim.MCMC results'
                'python-optimagic: sherpa.optmethods.optoptmagic'
                'ds9: Imaging requires'
                'xpa: Imaging requires'
                'python-sherpa-doc: Documentation for Sherpa')
    install=python-sherpa.install
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 {README.md,CITATION} -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -D -m644 notebooks/SherpaQuickStart.ipynb -t "${pkgdir}/usr/share/doc/${pkgname}/notebooks"
    install -D -m644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
#   mv ${pkgdir}/{usr/*.so,$(get_pyinfo site)}
#   rm ${pkgdir}/usr/lib/python$(get_pyver)/site-packages/sherpa-${pkgver}-py$(get_pyver).egg-info/SOURCES.txt
}

#package_python-sherpa-doc() {
#    pkgdesc="Documentation for Sherpa"
#    arch=('any')
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
