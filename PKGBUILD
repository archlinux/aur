# Maintainer: Giacomo Vercesi <mrjackv@hotmail.it>

pkgname='python-cef'
_vermajor="66"
_verminor="0"
pkgname='python-cef'
_vermajor="66"
_verminor="0"
pkgver="${_vermajor}.${_verminor}"
pkgrel=1
pkgdesc="CEF python bindings (with bundled spotify-built CEF)"
arch=('x86_64')
url='https://github.com/cztomczak/cefpython'
depends=('python' 'nss' 'libgl' 'libxtst' 'alsa-lib' 'gtk2' 'libxss')
makedepends=('python-docopt' 'python-setuptools' 'python-wheel' 'cython')
license=('BSD')
_cefstring="cef66_3.3359.1774.gd49d25f_linux64"
source=("https://github.com/cztomczak/cefpython/archive/v${pkgver}.tar.gz"
        "https://github.com/cztomczak/cefpython/releases/download/v${_vermajor}-upstream/${_cefstring}.zip")
sha256sums=('d1592a7914ce1fd69f59bcc88a22e5c65bc0ff4944a7adfa7a408946efad844c'
            'a9ec9a72cc84f290cb985bbf06b9825312b7f84cb3e1ca3f4dcfeeeef338d84b')

prepare(){
    cd "${srcdir}/cefpython-${pkgver}"
    mkdir -p build
    cd build
    if [ ! -d "${_cefstring}" ]; then
        ln -s "$(realpath ../../${_cefstring})"
    fi
    cythonver="$(pacman -Q cython | cut -d' ' -f2 | cut -d'-' -f1)"
    pythonver="$(python -c 'import platform; print("".join(platform.python_version_tuple()[:2]))')"
    sed -i "s;0.28.4;$cythonver;g" ../tools/requirements.txt
    sed -i 's;print("ERROR: This version of Python is not supported");return "2015";g' ../tools/common.py
    sed -i 's; -Wall -Werror;;g' ../tools/build.py
    sed -i 's;    install_and_run();# &;g' ../tools/build.py
    sed -i "s;'/usr/lib/glib-2.0/include',;&'/usr/include/harfbuzz',;g" ../tools/cython_setup.py
    sed -i 's;-I/usr/lib/glib-2.0/include;& -I/usr/include/harfbuzz;g' ../src/client_handler/Makefile
    sed -i 's;-I/usr/lib/glib-2.0/include;& -I/usr/include/harfbuzz;g' ../src/subprocess/Makefile
    sed -i 's;-I/usr/lib/glib-2.0/include;& -I/usr/include/harfbuzz;g' ../src/subprocess/Makefile-libcefpythonapp
    echo "#include \"../../build/build_cefpython/cefpython_py${pythonver}_fixed.h\"" >> ../src/common/cefpython_public_api.h
}

build(){
    cd "${srcdir}/cefpython-${pkgver}/build"
    python ../tools/build.py "${pkgver}"
}

package(){
    cd "${srcdir}/cefpython-${pkgver}/build"
    python ../tools/make_installer.py --version "${pkgver}"
    cd "cefpython3_${pkgver}_linux64"
    sed -i 's;        post_install_hook();#&;g' setup.py
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    pythonver="$(python -c 'import platform; print(".".join(platform.python_version_tuple()[:2]))')"
    cp -r cefpython3 "${pkgdir}/usr/lib/python${pythonver}/site-packages/"
    cd "${pkgdir}/usr/lib/python${pythonver}/site-packages/cefpython3"
    pythonver="$(python -c 'import platform; print("".join(platform.python_version_tuple()[:2]))')"
    sed -i "s;    raise.*$;    from . import cefpython_py${pythonver} as cefpython\n#&;g" __init__.py
    chmod +x cefclient cefsimple ceftests subprocess
    find . -name '*.log' -exec chmod 666 {} \;
}
