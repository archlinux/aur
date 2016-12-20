# Maintainer: Michele Mocciola <mickele>

pkgname=astk
pkgver=1.13.8
pkgrel=1
pkgdesc="Tcl/Tk interface to run Code-Aster (prepare and start calculations)."
url="http://www.code-aster.org/"
license=("GPL")
depends=('python' 'tcl' 'tk' 'openssh')
makedepends=('desktop-file-utils' 'sed' 'patch')
optdepends=('inetutils: if you connect to code-aster server with rsh' 'openssh: if you connect to code-aster server with ssh' 'eficas>=2015.2: to edit Code_Aster command files' 'gibi>=2000: to generate and post-process meshes' 'gmsh: to generate and post-process mesh' 'gnuplot: to plot outputs to X11, PostScript, PNG, GIF, and others' 'grace: to plot outputs in 2D graphs' 'tkpng: to display better colors')
arch=('i686' 'x86_64')
_asterver=12.6.0
_astersubver=4
source=("http://www.code-aster.org/FICHIERS/aster-full-src-${_asterver}-${_astersubver}.noarch.tar.gz" "astk-ssh" "astk.png" "astk.desktop")

_installdir=/usr

build() {
    cd "${srcdir}/aster-full-src-${_asterver}"
    sed -e "s|should_continue()|# should_continue()|g" -i setup.py

    # Change this with your favorite editor
    echo "EDITOR='/usr/bin/emacs'" >> setup.cfg
}

package() {
    cd "${srcdir}/aster-full-src-${_asterver}"

    python2 setup.py install --prefix="${pkgdir}${_installdir}" astk

    install -d -m 755 "${pkgdir}/usr/bin/"
    install -m 755 "${srcdir}/astk-ssh" "${pkgdir}${_installdir}/bin/"

    for _FILE in {"etc/codeaster/astkrc/config_serveurs","etc/codeaster/profile.sh"}
    do
        sed -e "s|${pkgdir}||g" -i "${pkgdir}${_installdir}/${_FILE}"
    done

    sed -e "s|\$ASTER_ROOT/outils/xmgrace|/usr/bin/xmgrace|" -i "${pkgdir}${_installdir}/etc/codeaster/astkrc/outils"
    sed -e "s|\$ASTER_ROOT/outils/gmsh|/usr/bin/gmsh|" -i "${pkgdir}${_installdir}/etc/codeaster/astkrc/outils"

    echo "export TKPNG_ROOT=/usr/lib/tkpng0.9" >> "${pkgdir}${_installdir}/etc/codeaster/profile.sh"

    install -m 755 -d "${pkgdir}/usr/share/pixmaps"
    cp "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/"
    desktop-file-install --dir="${pkgdir}/usr/share/applications" "${srcdir}/${pkgname}.desktop"

    # mv etc from /usr to /
    mv "${pkgdir}${_installdir}/etc/" "${pkgdir}"
}
md5sums=('1603b6f94fdbdec2977b2e864b3b0f4a'
         'd1c0da1ae3d8f38f2d09094e2f498b6e'
         '3d432dfac21b5351cf96ac80ae55811d'
         '79e3e1cf77a476d0b9e9d9aa21a1e723')
