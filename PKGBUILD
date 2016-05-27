# Contributor: JulioJu  < juanes  0890  at google mail dot com >
# Maintainer : JulioJu  < juanes  0890  at google mail dot com >

# Inspirated from :
# http://bazaar.launchpad.net/~marionnet-drivers/marionnet/trunk/view/head:/useful-scripts/marionnet_from_scratch
# Copyright (C) 2010 2011 2012 2013  Jean-Vincent Loddo Copyright (C) 2010
# 2011 2012 2013  Université Paris 13 
# (LGPL)

pkgname=('marionnet-trunk')
pkgver=1
pkgrel=2
pkgdesc="Educational software. It is a virtual network laboratory: it allows
users to define, configure and run complex computer networks without any need
for physical setup. Trunk version (with UML kernel Debian Wheezy)."
arch=('i686' 'x86_64')
url="https://www.marionnet.org/"
makedepends=('wget' 'optipng')
license=('LGPL')
depends=('xorg-server' 'xorg-xinit' 'xorg-server-utils' 'gtksourceview2' 'libglademm' 'graphviz' 'xterm' 'vde2' 'uml_utilities' 'net-tools' 'bridge-utils')
if test "$CARCH" == x86_64; then
  depends+=('lib32-glibc')
fi
# Not depends of camlp4 and ocaml-findlib.
conflicts=('marionnet')
source=("http://caml.inria.fr/pub/distrib/ocaml-3.12/ocaml-3.12.1.tar.gz"
        'http://wwwfun.kurims.kyoto-u.ac.jp/soft/lsl/dist/lablgtk-2.14.2.tar.gz'
        "https://www.marionnet.org/download/marionnet_from_scratch/mirror/ocamlbricks-trunk.tar.gz"
        "https://www.marionnet.org/download/marionnet_from_scratch/mirror/marionnet-trunk.tar.gz"
        "https://raw.githubusercontent.com/JulioJu/Marionnet-trunk_ArchLinux-installer/master/Makefile.patch"
)
sha256sums=('4f81ab86258be0eea1507dd5338c8670490f8616249821e731f8ac1c64caa4a7'
            '4981abedabdc462303f345104042c88af227ccd50fd30a9bf48fd353ab02d0ba'
            '646b6de59a555b2e41960708cf4edfed571d88369d850a50e23bf4a4b17ed329'
            '610c806e595be4d56ff6cded02e8d8a3091fe211487073c02ddb5132c3b4ffb6'
            'efb09389cc67a88b16509dec3ca3fb32f1da1f4c5808b8f2e7e2f050376bf691')
install=marionnet.install

# ################
# MAKEDEPENDS : CREATED DURING COMPILATION but not keep
# pkgname=ocaml
# pkgver=3.12.1
# Do not use older package (see :
# https://bugs.launchpad.net/marionnet/+bug/1580349 )
# pkgdesc="A functional language with OO extensions"
# license=('LGPL2.1' 'custom: QPL-1.0')
# url="http://caml.inria.fr/"
#
# pkgname=lablgtk2
# It seems we can use older package.
# pkgdesc="An Objective Caml interface to gtk2"
# license=('LGPL')
# url="http://lablgtk.forge.ocamlcore.org/"
# license=('GPL')
#
# pkgname=ocamlbricks
# pkgver=0.90.3
# pkgdesc="Miscellaneous utility functions in OCaml for Marionnet"
# conflicts=('ocamlbricks_trunk')
# url="https://launchpad.net/ocamlbricks/"
# license=('GPL')

build () {
    OUR_MIRROR="https://www.marionnet.org/download/marionnet_from_scratch/mirror/"
    PREFIX="${srcdir}/usr/local"
    mkdir -p "${PREFIX}/usr/local"
    OCAML_DIR="${srcdir}/ocaml-3.12.1"
    LABLGTK2_DIR="${srcdir}/lablgtk-2.14.2"
    MARIONNET_DIR="${srcdir}/marionnet"
    OCAMLBRICK_DIR="${srcdir}/ocamlbricks"
    export PATH="${PREFIX}/bin:${PATH}"
    LIB_OCAML="${PREFIX}/lib/ocaml/"

    ### OCAML ###

    cd "${OCAML_DIR}"

    ./configure -prefix "${PREFIX}" -no-curses -no-tk
    make world.opt &&
    make install

    make -C tools/ objinfo

    if [[ ! -e "${PREFIX}/bin/ocamlobjinfo" ]]; then
        cp tools/objinfo ${PREFIX}/bin/ &&
            [[ -e ${PREFIX}/bin/ocamlobjinfo ]] || ln -s objinfo \
        ${PREFIX}/bin/ocamlobjinfo
    fi

    # #### Liblgtk2 ###
    cd "${LABLGTK2_DIR}"
    ./configure --prefix="${PREFIX}" \
    --with-glade --without-gl --without-rsvg --without-gnomecanvas --without-gnomeui \
    --without-panel --without-gtkspell --without-gtksourceview --with-gtksourceview2 \
    --without-quartz &&
    make &&
    make opt &&
    make install


    #### OCAMLBRICKS ##########
    cd "${OCAMLBRICK_DIR}"
cat > CONFIGME <<EOF
ocaml_libraryprefix="${LIB_OCAML}"
libraryprefix="${LIB_OCAML}"
prefix="${PREFIX}"
configurationprefix="\${prefix}/etc"
documentationprefix="\${prefix}/share/doc"
localeprefix="\${prefix}/share/locale"
ocaml_sources="${LIB_OCAML}/caml"
ocaml_version=`ocamlc -version`
EOF

    make clean &&
    make &&
    make install
    ############ MARIONNET ###########


    cd "${MARIONNET_DIR}"

    # Makefile patch 

    patch Makefile < ../Makefile.patch

    # Configure CONFIGME
cat > CONFIGME <<EOF
ocaml_libraryprefix="${LIB_OCAML}"
libraryprefix="${LIB_OCAML}"
prefix="/usr"
prefixInstall="${pkgdir}/usr"
configurationprefix="${pkgdir}/etc"
documentationprefix="\${prefixInstall}/share/doc"
localeprefix="\${prefixInstall}/share/locale"
ocaml_sources="${LIB_OCAML}/caml"
ocaml_version=`ocamlc -version`
EOF

    make clean native
}


package() {

    # Fakeroot, so redifine them.
    PREFIX="${srcdir}/usr/local"
    MARIONNET_DIR="${srcdir}/marionnet"
    export PATH="${PREFIX}/bin:${PATH}"

    cd ${MARIONNET_DIR}
    make install

    # Sanitize files

    mv "${pkgdir}/usr/sbin/"* "${pkgdir}/usr/bin"
    rmdir "${pkgdir}/usr/sbin/"

    rm -f "${pkgdir}/usr/bin/marionnet.byte"
    rm -f "${pkgdir}/usr/bin/marionnet-daemon.byte"
    mv "${pkgdir}/usr/bin/marionnet.native" "${pkgdir}/usr/bin/marionnet"

    # Build ${pkgdir}/etc/marionnet/marionnet.conf
    echo "* Generating ${pkgdir}/etc/marionnet/marionnet.conf"

    MARIONNET_DOT_CONF=${pkgdir}/etc/marionnet/marionnet.conf

    function first_installed_binary_of_list {
    local i
    for i in "$@"; do
        if type -t $i &>/dev/null; then
            echo $i
            return 0
        fi
    done
    # otherwise return the first:
    echo $1
    }

    MARIONNET_KEYBOARD_LAYOUT=$(echo $LANG | grep -o '^[a-z]*')
    MARIONNET_KEYBOARD_LAYOUT=${MARIONNET_KEYBOARD_LAYOUT=:-us}
    MARIONNET_PDF_READER=$(first_installed_binary_of_list evince okular kpdf xpdf gv)
    MARIONNET_POSTSCRIPT_READER=$MARIONNET_PDF_READER
    MARIONNET_DVI_READER=$MARIONNET_PDF_READER
    MARIONNET_HTML_READER=$(first_installed_binary_of_list firefox epiphany galeon konqueror rekonq chromium opera)
    MARIONNET_TEXT_EDITOR=$(first_installed_binary_of_list emacs gedit kate kwrite xemacs)

    for i in MARIONNET_{PDF,POSTSCRIPT,DVI,HTML}_READER MARIONNET_TEXT_EDITOR MARIONNET_KEYBOARD_LAYOUT; do
        v=$(eval echo \$$i);
        sed -i -e "s/$i=\(.*\)/$i=$v/" $MARIONNET_DOT_CONF
    done

    #### Generate Daemon ####

    mkdir -p "${pkgdir}/usr/lib/systemd/system/"
    cd "${pkgdir}/usr/lib/systemd/system/"

cat > marionnetdaemon.service <<EOF
# Generating by makepkg from PKGBUILD
# (LGPL)
[UNIT]
Description="Marionnet daemon for graphics on virtual machines and host sockets"

[Service]
Type=simple
ExecStart=/usr/bin/marionnet-daemon.native
KillMode=process
Restart=on-failure

[Install]
WantedBy=graphical.target
EOF

    ### Fix bug https://bugs.launchpad.net/marionnet/+bug/1580349 ###

    optipng -quiet -fix ${pkgdir}/usr/share/marionnet/images/launcher-icons/marionnet-launcher.png
    optipng -quiet -fix ${pkgdir}/usr/share/marionnet/images/ico.cable-serial.small.png
    optipng -quiet -fix ${pkgdir}/usr/share/marionnet/images/ico.script-analyse-3.med.png
    optipng -quiet -fix ${pkgdir}/usr/share/marionnet/images/marionnet-launcher.png
    optipng -quiet -fix ${pkgdir}/usr/share/marionnet/images/ico.cable-serial-left-right.small.png
    optipng -quiet -fix ${pkgdir}/usr/share/marionnet/images/ico.uml-gray.small.png
    optipng -quiet -fix ${pkgdir}/usr/share/marionnet/images/ico.dado.24.png
    optipng -quiet -fix ${pkgdir}/usr/share/marionnet/images/ico.resource-2.med.png
    optipng -quiet -fix ${pkgdir}/usr/share/marionnet/images/ico.dado-no.24.png
    optipng -quiet -fix ${pkgdir}/usr/share/marionnet/images/ico.xml-16.inv.png
    optipng -quiet -fix ${pkgdir}/usr/share/marionnet/images/ico.script-finish.med.png
    optipng -quiet -fix ${pkgdir}/usr/share/marionnet/images/ico.software-gray.small.png
    optipng -quiet -fix ${pkgdir}/usr/share/marionnet/images/ico.script-start-2.med.png
    optipng -quiet -fix ${pkgdir}/usr/share/marionnet/images/ico.cable-serial.xxl.png
    optipng -quiet -fix ${pkgdir}/usr/share/marionnet/images/ico.diffuser.orig.png
    optipng -quiet -fix ${pkgdir}/usr/share/marionnet/images/ico.hardware-gray.small.png
    optipng -quiet -fix ${pkgdir}/usr/share/marionnet/images/ico.cable-serial-left-right.large.png


}

# vim: ft=sh:
