# Maintainer: Valeriy Huz <ghotrix@gmail.com>
pkgname='lucaschess-git'
_pkgname=lucaschess
pkgver=99
pkgrel=1
pkgdesc="Play Train Compete"
arch=('i686' 'x86_64')
url="http://lucaschess.pythonanywhere.com/"
license=('GPL2')
depends=('python2-pyaudio' 'swig' 'python2-psutil' 'python2-chardet' 'python2-pygal' 
         'python2-pyqt4' 'python2-sip-pyqt4' 'python2-pillow' 'python2-chess' 'python2-scandir') 
makedepends=('git' 'cython2')
optdepends=('crafty' 'cutechess' 'fairymax' 'fruit' 'gnuchess' 'hoichess' 'pychess'
            'stockfish' 'toga2' 'xboard' 'scid_vs_pc')
provides=('lucaschess')
conflicts=('lucaschess')
source=("${_pkgname}::git+https://github.com/lukasmonk/lucaschess")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git rev-list --count HEAD
}

build() {
    cd "${srcdir}/${_pkgname}"
    rm -f Lucas
    echo "#!/bin/bash" >> Lucas
    echo "cd /opt/${_pkgname}" >> Lucas
    echo "python2 Lucas.py" >> Lucas
    cd "$srcdir/${_pkgname}/LCEngine/irina"
    bash ./xmk_linux.sh
    cd "$srcdir/${_pkgname}/LCEngine"
    sed -i s/python/python2/g xcython_linux.sh
    sed -i s/LCEngine2/LCEngine3/g xcython_linux.sh
    bash ./xcython_linux.sh
}

package() {
    if uname -m |grep 86_64
    then
        _arch=64
    else
        _arch=32
    fi
    install -d "${pkgdir}"/usr/{lib,bin}
    install -m777 -d "${pkgdir}/opt/${_pkgname}"
    install -Dm755 "$srcdir/${_pkgname}"/LCEngine/{LCEngine3,libirina}.so "${pkgdir}/usr/lib"
    install -Dm755 "$srcdir/${_pkgname}"/Lucas "${pkgdir}/usr/bin"
    install -Dm755 "$srcdir/${_pkgname}"/Lucas.py "${pkgdir}/opt/${_pkgname}"
    install -m777 -d "${pkgdir}/opt/${_pkgname}/Code"
    install -m777 -d "${pkgdir}/opt/${_pkgname}/Engines/Linux${_arch}/_tools"
    install -m777 -d "${pkgdir}/opt/${_pkgname}/GenIconos"
    install -m777 -d "${pkgdir}/opt/${_pkgname}/GM"
    install -m777 -d "${pkgdir}/opt/${_pkgname}/Imgs"
    install -m777 -d "${pkgdir}/opt/${_pkgname}/IntFiles"
    install -m777 -d "${pkgdir}/opt/${_pkgname}/Locale"
    install -m777 -d "${pkgdir}/opt/${_pkgname}/Openings"
    install -m777 -d "${pkgdir}/opt/${_pkgname}/Pieces"
    install -m777 -d "${pkgdir}/opt/${_pkgname}/Tactics"
    install -m777 -d "${pkgdir}/opt/${_pkgname}/Themes"
    install -m777 -d "${pkgdir}/opt/${_pkgname}/Trainings"
    cp -r "$srcdir/${_pkgname}"/Code/* "${pkgdir}/opt/${_pkgname}/Code"
    cp -r "$srcdir/${_pkgname}"/Engines/Linux"${_arch}"/_tools/*.so "${pkgdir}/opt/${_pkgname}/Engines/Linux${_arch}/_tools"
    cp -r "$srcdir/${_pkgname}"/GenIconos/* "${pkgdir}/opt/${_pkgname}/GenIconos"
    cp -r "$srcdir/${_pkgname}"/GM/* "${pkgdir}/opt/${_pkgname}/GM"
    cp -r "$srcdir/${_pkgname}"/Imgs/* "${pkgdir}/opt/${_pkgname}/Imgs"
    cp -r "$srcdir/${_pkgname}"/IntFiles/* "${pkgdir}/opt/${_pkgname}/IntFiles"
    cp -r "$srcdir/${_pkgname}"/Locale/* "${pkgdir}/opt/${_pkgname}/Locale"
    cp -r "$srcdir/${_pkgname}"/Openings/* "${pkgdir}/opt/${_pkgname}/Openings"
    cp -r "$srcdir/${_pkgname}"/Pieces/* "${pkgdir}/opt/${_pkgname}/Pieces"
    cp -r "$srcdir/${_pkgname}"/Tactics/* "${pkgdir}/opt/${_pkgname}/Tactics"
    cp -r "$srcdir/${_pkgname}"/Themes/* "${pkgdir}/opt/${_pkgname}/Themes"
    cp -r "$srcdir/${_pkgname}"/Trainings/* "${pkgdir}/opt/${_pkgname}/Trainings"
}
