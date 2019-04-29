# Maintainer: Konstantin Gizdov < arch at kge dot pw >
# Contributor: Joshua Ellis < josh at jpellis dot me >
# Contributor: Stefano Campanella < stefanocampanella1729 at gmail dot com >

_pkgbase=pythia8
pkgname=python2-pythia8
pkgver=8.2.40
_pkgid="${_pkgbase:0:-1}${pkgver//./}"
pkgrel=7
pkgdesc="High-energy physics events generator (Python2 bindings)"
arch=('x86_64')
url="http://home.thep.lu.se/Pythia/"
license=('GPL')
depends=('python')
makedepends=('python2' 'fastjet' 'hepmc' 'lhapdf>=6.2' 'root')
source=("http://home.thep.lu.se/~torbjorn/pythia8/${_pkgid}.tgz"
        'pythia8.sh'
        'change_to_python2.patch'
        'fix_lhapdf_build.patch'
        'respect_lib_suffix.patch')
sha256sums=('d27495d8ca7707d846f8c026ab695123c7c78c7860f04e2c002e483080418d8d'
            '4e373b685960e410024b4e33e22c2dea360dfedd7962837087332f428c974ae5'
            'bae1a65399cd2ee599db1758d60da2a1c93335ec4dbd30e323250c156f491086'
            'f7c70b069b350005ac7e9028617713dece9b82c1e8b0dc5fb1f2870abec1d94c'
            '4eb15725cfb5e287fdd9520cb4211b88ebc38a690b7522690ba0664d50bc8669')
get_py2ver () {
    python2 -c 'import sys; print(str(sys.version_info[0]) + "." + str(sys.version_info[1]))'
}

prepare() {
    cd "${srcdir}/${_pkgid}"
    patch -p1 -i "${srcdir}/respect_lib_suffix.patch"
    patch -p1 -i "${srcdir}/fix_lhapdf_build.patch"
    patch -p1 -i "${srcdir}/change_to_python2.patch"
}

build() {
    _inc=/usr/include
    _lib=/usr/lib
    _share=/usr/share/${_pkgbase}

    # with Python2
    cd "${srcdir}/${_pkgid}"
    # # no such package yet
    # --with-evtgen \
    # --with-evtgen-include=${_inc} \
    # --with-evtgen-lib=${_lib} \
    # # no such package yet
    # --with-hepmc3 \
    # --with-hepmc3-include=${_inc} \
    # --with-hepmc3-lib=${_lib} \
    # # no such package yet
    # --with-powheg \
    # --with-powheg-include=${_inc} \
    # --with-powheg-lib=${_lib} \
    # # no such package yet
    # --with-promc \
    # --with-promc-include=${_inc} \
    # --with-promc-lib=${_lib} \
    ./configure --prefix=/usr \
                --prefix-include=${_inc} \
                --prefix-lib=${_lib} \
                --prefix-share=${_share} \
                --cxx-common="${CXXFLAGS} -fPIC" \
                --cxx-shared="-shared ${LDFLAGS} -ldl" \
                --enable-shared \
                --with-fastjet3 \
                --with-fastjet3-include=${_inc} \
                --with-fastjet3-lib=${_lib} \
                --with-gzip \
                --with-gzip-include=${_inc} \
                --with-gzip-lib=${_lib} \
                --with-hepmc2 \
                --with-hepmc2-include=${_inc} \
                --with-hepmc2-lib=${_lib} \
                --with-lhapdf5 \
                --with-lhapdf5-include=${_inc} \
                --with-lhapdf5-lib=${_lib} \
                --with-lhapdf6 \
                --with-lhapdf6-include=${_inc} \
                --with-lhapdf6-lib=${_lib} \
                --with-python \
                --with-python-include="/usr/include/python$(get_py2ver)" \
                --with-python-lib="/usr/lib/python$(get_py2ver)" \
                --with-root \
                --with-root-include=/usr/include/root \
                --with-root-lib=/usr/lib/root
    make
}

package() {
    pkgdesc="Python2 bindings for Pythia"
    depends=('python2' 'pythia8')
    cd "${srcdir}/${_pkgid}"

    install -Dm755 lib/_pythia8.so "${pkgdir}/usr/lib/python$(get_py2ver)/site-packages/_pythia8.so"
    install -Dm755 lib/pythia8.py "${pkgdir}/usr/lib/python$(get_py2ver)/site-packages/pythia8.py"
    install -Dm644 lib/pythia8.pyc "${pkgdir}/usr/lib/python$(get_py2ver)/site-packages/pythia8.pyc"
}
