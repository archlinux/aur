# Maintainer: mickele

pkgname=astk-hg
pkgver=2351
pkgrel=1
pkgdesc="ASTK (Mercurial version)"
license=('GPL')
arch=('i686' 'x86_64')
url="http://www.code-aster.org"
install=${pkgname}.install
depends=('python2' 'tk')
provides=('astk=1.13.4')
conflicts=('astk')
source=("astk::hg+https://bitbucket.org/code_aster/codeaster-frontend" "astk-ssh" "astk.png" "astk.desktop")

_installdir=/usr
_editor=/usr/bin/emacs

pkgver() {
    cd "${srcdir}"/astk
    hg identify -n
}

build(){
    cd "${srcdir}"/astk
}

package(){
    cd "${srcdir}"/astk

    python2 setup.py install --prefix="${pkgdir}${_installdir}"

    install -m 755 "${srcdir}/astk-ssh" "${pkgdir}${_installdir}/bin/astk-ssh"

    # python -> python2
    for _FILE in {"as_run","parallel_cp"}
    do
        sed -e "s|python|python2|" -i "${pkgdir}${_installdir}/bin/${_FILE}"
    done
    for _FILE in `grep -Rl "/usr/bin/env python" * `
    do
        sed -e "s|/usr/bin/env python|/usr/bin/env python2|" -i ${_FILE}
    done

    # defines var
    sed -e "s|#ctags_style : exuberant|ctags_style : exuberant|" \
        -e "s|?DEBUGGER_COMMAND?|gdb --command=@D @E|" \
        -e "s|?DEBUGGER_COMMAND_POST?|gdb -batch --command=@D @E @C|" \
        -e "s|?EDITOR?|${_editor}|" \
        -e "s|?IFDEF?|P_LINUX|" \
        -e "s|?MPIRUN?|/usr/bin/mpirun|" \
        -e "s|?PS_COMMAND_CPU?|/usr/bin/ps -e --width=512 -ocputime -ocommand|" \
        -e "s|?PS_COMMAND_PID?|/usr/bin/ps -e --width=512 -opid -ocommand|" \
        -e "s|?TERMINAL?|/usr/bin/xterm|" \
        -i "${pkgdir}${_installdir}/etc/codeaster/asrun"
    sed -e "s|?EDITOR?|${_editor}|" \
        -e "s|?TERMINAL?|/usr/bin/xterm|" \
        -i "${pkgdir}${_installdir}/etc/codeaster/astkrc/config_serveurs"
    sed -e "s|?EDITOR?|${_editor}|" \
        -e "s|?TERMINAL?|/usr/bin/xterm|" \
        -i "${pkgdir}${_installdir}/etc/codeaster/astkrc/prefs"

    # removes references to pkgdir
    for _FILE in etc/codeaster/astkrc/config_serveurs etc/codeaster/profile.csh
    do
        sed -e "s|${pkgdir}||g" -i "${pkgdir}${_installdir}/${_FILE}"
    done

    # defines outils
    sed -e "s|\$ASTER_ROOT/outils/eficas|/usr/bin/eficas|" -i "${pkgdir}${_installdir}/etc/codeaster/astkrc/outils"
    sed -e "s|\$ASTER_ROOT/outils/xmgrace|/usr/bin/xmgrace|" -i "${pkgdir}${_installdir}/etc/codeaster/astkrc/outils"
    sed -e "s|\$ASTER_ROOT/outils/gibi.x|/usr/bin/gibi|" -i "${pkgdir}${_installdir}/etc/codeaster/astkrc/outils"
    sed -e "s|\$ASTER_ROOT/outils/gmsh|/usr/bin/gmsh|" -i "${pkgdir}${_installdir}/etc/codeaster/astkrc/outils"

    echo "export TKPNG_ROOT=/usr/lib/tkpng0.9" >> "${pkgdir}${_installdir}/etc/codeaster/profile.sh"

    # moves etc from /usr to /
    mv "${pkgdir}${_installdir}/etc/" "${pkgdir}"

    # install desktop shortcuts
    install -m 755 -d "${pkgdir}/usr/share/pixmaps"
    cp "${srcdir}/astk.png" "${pkgdir}/usr/share/pixmaps/"
    desktop-file-install --dir="${pkgdir}/usr/share/applications" "${srcdir}/astk.desktop"
}
md5sums=('SKIP'
         '6fba5ebcdf75cccea2122c85df5a6306'
         '3d432dfac21b5351cf96ac80ae55811d'
         '79e3e1cf77a476d0b9e9d9aa21a1e723')
