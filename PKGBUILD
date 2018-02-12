# Maintainer : Daniel Bermond < yahoo-com: danielbermond >

pkgbase=slimit-git
pkgname=('slimit-git' 'slimit2-git')
_srcname=slimit
pkgver=0.8.1.r9.gc41c737
pkgrel=1
pkgdesc='A JavaScript minifier written in Python'
arch=('any')
url='https://github.com/rspivak/slimit/'
license=('MIT')
makedepends=('git' 'python' 'python-setuptools' 'python-sphinx'
                   'python2' 'python2-setuptools' 'python2-sphinx')
source=("$pkgname"::'git+https://github.com/rspivak/slimit.git')
sha256sums=('SKIP')

prepare() {
    cp -a "$pkgbase" "${pkgbase}-py2"
}

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    msg2 "Building for Python3: running 'setup.py'..."
    cd "$pkgbase"
    python setup.py build
    cd docs
    msg2 "Building for Python3: making target 'html'..." && make html
    msg2 "Building for Python3: making target 'man'..."  && make man
    
    msg2 "Building for Python2: running 'setup.py'..."
    cd "${srcdir}/${pkgbase}-py2"
    python2 setup.py build
    cd docs
    sed -i '/sphinx-build/s/$/2/' Makefile
    msg2 "Building for Python2: making target 'html'..." && make html
    msg2 "Building for Python2: making target 'man'..."  && make man
}

package_slimit-git() {
    depends=('python' 'python-ply')
    provides=('slimit')
    conflicts=('slimit')
    
    # directories creation
    mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/"{_sources,_static}
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    mkdir -p "${pkgdir}/usr/share/man/man1"
    
    # main python install
    cd "$pkgbase"
    python setup.py install --prefix='/usr' --root="$pkgdir" --optimize='1'
    
    # html docs
    cd docs/build/html
    for _file in *
    do
        [ -d "$_file" ] && continue # skip directories
        install -D -m644 "$_file" "${pkgdir}/usr/share/doc/${pkgname}"
    done
    cd _sources
    install -D -m644 * "${pkgdir}/usr/share/doc/${pkgname}/_sources"
    cd ../_static
    install -D -m644 * "${pkgdir}/usr/share/doc/${pkgname}/_static"
    
    # man page
    cd ../../man
    install -D -m644 "${_srcname}.1" "${pkgdir}/usr/share/man/man1"
    gzip -9 -n -f "${pkgdir}/usr/share/man/man1/${_srcname}.1"
    
    # license
    cd "${srcdir}/${pkgbase}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_slimit2-git() {
    pkgdesc='A JavaScript minifier written in Python (python2 version)'
    depends=('python2' 'python2-ply')
    provides=('slimit2')
    conflicts=('slimit2')
    
    # directories creation
    mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/"{_sources,_static}
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    mkdir -p "${pkgdir}/usr/share/man/man1"
    
    # main python2 install
    cd "${pkgbase}-py2"
    python2 setup.py install --prefix='/usr' --root="$pkgdir" --optimize='1'
    mv "$pkgdir"/usr/bin/slimit{,2}
    
    # html docs
    cd docs/build/html
    for _file in *
    do
        [ -d "$_file" ] && continue # skip directories
        install -D -m644 "$_file" "${pkgdir}/usr/share/doc/${pkgname}"
    done
    cd _sources
    install -D -m644 * "${pkgdir}/usr/share/doc/${pkgname}/_sources"
    cd ../_static
    install -D -m644 * "${pkgdir}/usr/share/doc/${pkgname}/_static"
    
    # man page
    cd ../../man
    install -D -m644 "${_srcname}.1" "${pkgdir}/usr/share/man/man1/${_srcname}2.1"
    gzip -9 -n -f "${pkgdir}/usr/share/man/man1/${_srcname}2.1"
    
    # license
    cd "${srcdir}/${pkgbase}-py2"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
