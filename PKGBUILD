# Maintainer:  taotieren <admin@taotieren.com>

pkgbase=minigui-git
pkgname=(minigui{,-{mgutils,mgplus,mgeff,mgncs,chipmunk,mgncs4touch,mg-tools,mg-tests,mg-samples,mg-demos,cell-phone-ux-demo,res,docs,ministudo}}-git)
pkgver=5.0.11.r12.g0d1f1f02
pkgrel=1
arch=('x86_64')
_url="https://github.com/VincentWei"
url="${_url}/MiniGUI"
license=('GPLv3')
depends=(
        freetype2
        gtk2
        harfbuzz
        libdrm
        libevdev
        libjpeg-turbo
        libtool
        libinput
        libwebp
        libxml2
        libpng
        kmod
        mtdev
        openssl
        util-linux
        sqlite
        systemd
        xorg-server-xvfb
        zlib)
optdepends=()
makedepends=(git
            autoconf
            automake
            cmake
            make
            pkgconf)
backup=()
options=('!strip')
install=
source=("${pkgbase}::git+${url}.git"
        "minigui-mgutils::git+${_url}/mgutils.git"
        "minigui-mgplus::git+${_url}/mgplus.git"
        "minigui-mgeff::git+${_url}/mgeff.git"
        "minigui-mgncs::git+${_url}/mgncs.git"
        "minigui-mgncs4touch::git+${_url}/mgncs4touch.git"
        "minigui-mg-tools::git+${_url}/mg-tools.git"
        "minigui-mg-tests::git+${_url}/mg-tests.git"
        "minigui-mg-samples::git+${_url}/mg-samples.git"
        "minigui-mg-demos::git+${_url}/mg-demos.git"
        "minigui-chipmunk::git+${_url}/chipmunk.git"
        "minigui-cell-phone-ux-demo::git+${_url}/cell-phone-ux-demo.git"
        "minigui-res::git+${_url}/minigui-res.git"
        "minigui-docs::git+${_url}/minigui-docs.git"
        "minigui-ministudio::git+https://github.com/FMSoftCN/ministudo-guibuilder.git")

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd "${srcdir}/${pkgbase}"
    git describe --long --tags | sed 's/ver-//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package_minigui-mgutils-git() {
    pkgdesc="A component of MiniGUI, provides users with a number of common dialog templates"
    url="${_url}/mgutils"
    depends=(minigui)
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})

    cd "${srcdir}/${pkgname%-git}"

    ./autogen.sh
    ./configure --prefix=/usr \
        --disable-static \
        --with-targetname=mstudio \
        --with-libsuffix=msd

    make -j$NR_JOBS
    make DESTDIR="$pkgdir" install
}

package_minigui-mgplus-git() {
    pkgdesc="A MiniGUI component which provides support for advanced 2D graphics functions"
    url="${_url}/mgplus"
    depends=(minigui)
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})

    cd "${srcdir}/${pkgname%-git}"

    ./autogen.sh
    ./configure --prefix=/usr \
        --disable-static \
        --with-targetname=mstudio \
        --with-libsuffix=msd

    make -j$NR_JOBS
    make DESTDIR="$pkgdir" install
}

package_minigui-mgeff-git() {
    pkgdesc="An animation framework for MiniGUI"
    url="${_url}/mgeff"
    depends=(
            minigui
            minigui-mgplus
            )
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})

    cd "${srcdir}/${pkgname%-git}"
    ./autogen.sh
    ./configure --prefix=/usr \
                --with-targetname=mstudio \
                --with-libsuffix=msd

    make -j$NR_JOBS
    make DESTDIR="$pkgdir" install
}

package_minigui-mgncs-git() {
    pkgdesc="mGNCS provides a new control set and a new framework for MiniGUI apps."
    url="${_url}/mgncs"
    depends=(
            minigui
            minigui-mgutils
            )
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})

    cd "${srcdir}/${pkgname%-git}"
    sed -i 's|$(prefix)/etc|/etc|g;s|	$(INSTALL_DATA)|#	$(INSTALL_DATA)|g' etc/Makefile.am
    ./autogen.sh
    ./configure --prefix=/usr \
        --disable-static \
        --with-targetname=mstudio \
        --with-libsuffix=msd  \
        --enable-guibuilder-support  \
        --enable-datasource          \
        --enable-old-mledit          \
        --enable-texteditor

    make -j$NR_JOBS
    make DESTDIR="$pkgdir" install
}

package_minigui-chipmunk-git() {
    pkgdesc="Chipmunk is a simple, lightweight, fast and portable 2D rigid body physics library written in C. "
    url="${_url}/chipmunk"
    depends=(
            cmake
            gtk2
            )
    provides=(${pkgname%-git} chipmunk)
    conflicts=(${pkgname%-git} chipmunk)
    replaces=(chipmunk)

    cd "${srcdir}/${pkgname%-git}"

# Ninja build
# see：https://wiki.archlinux.org/title/CMake_package_guidelines
#     cmake -DCMAKE_BUILD_TYPE=Release \
    cmake -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr

    make

    make DESTDIR="$pkgdir" install
}

package_minigui-mgncs4touch-git() {
    pkgdesc="A set of mGNCS-compliant controls for devices with a touch screen."
    url="${_url}/mgncs4touch"
    depends=(
            minigui
            minigui-mgutils
            minigui-mgplus
            minigui-mgeff
            minigui-mgncs
            minigui-chipmunk
            )
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})

    cd "${srcdir}/${pkgname%-git}"

    sed -i 's|$(prefix)/etc|/etc|g;s|	$(INSTALL_DATA)|#	$(INSTALL_DATA)|g' etc/Makefile.am
    ./autogen.sh
    ./configure --prefix=/usr \
        --disable-static \
        --with-targetname=mstudio \
        --with-libsuffix=msd  \
        --enable-guibuilder-support

    make -j$NR_JOBS
    make DESTDIR="$pkgdir" install
}

package_minigui-mg-tools-git() {
    pkgdesc="A modern and proven cross-platform window system for embedded systems or smart IoT devices."
    url="${_url}/mg-tools"
    depends=(
            freetype2
            openssl
            minigui
            minigui-mgutils
            )
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})

    cd "${srcdir}/${pkgname%-git}"
    ./autogen.sh
    ./configure --prefix=/usr

    make -j$NR_JOBS
    make DESTDIR="$pkgdir" install
}

package_minigui-mg-tests-git() {
    pkgdesc="Test code of MiniGUI Core"
    url="${_url}/mg-tests"
    depends=(
            minigui
            minigui-mgeff
            )
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})

    cd "${srcdir}/${pkgname%-git}"
    ./autogen.sh
    ./configure --prefix=/usr

    make -j$NR_JOBS
    make DESTDIR="$pkgdir" install
}

package_minigui-mg-samples-git() {
    pkgdesc="Basic Samples for MiniGUI Core and Key MiniGUI Components."
    url="${_url}/mg-samples"
    depends=(
            minigui
            minigui-mgutils
            minigui-mgplus
            minigui-mgeff
            minigui-mgncs
            )
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})

    cd "${srcdir}/${pkgname%-git}"
    ./autogen.sh
    ./configure --prefix=/usr

    make -j$NR_JOBS
    make DESTDIR="$pkgdir" install
}

package_minigui-mg-demos-git() {
    pkgdesc="A set of demos as supplements of cell-phone-ux-demo"
    url="${_url}/mg-demos"
    depends=(
            minigui
            minigui-mgutils
            minigui-mgplus
            minigui-mgeff
            minigui-mgncs
            minigui-mgncs4touch
            )
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})

    cd "${srcdir}/${pkgname%-git}"
    ./autogen.sh
    ./configure --prefix=/usr

    make -j$NR_JOBS
    make DESTDIR="$pkgdir" install
}

package_minigui-cell-phone-ux-demo-git() {
    pkgdesc="This UX demo shows the new features of MiniGUI core, mGEff, mGNCS, and mGNCS4Touch components."
    url="${_url}/cell-phone-ux-demo"
    depends=(
            minigui
            minigui-mgutils
            minigui-mgplus
            minigui-mgeff
            minigui-mgncs
            minigui-mgncs4touch
            minigui-chipmunk
            )
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})

    cd "${srcdir}/${pkgname%-git}"

    sed -i 's|$(prefix)/bin/etc|/etc|g' etc/Makefile.am
    ./autogen.sh
    ./configure --prefix=/usr

    make -j$NR_JOBS
    make DESTDIR="$pkgdir" install
}

package_minigui-res-git() {
    pkgdesc="Resources package for MiniGUI"
    url="${_url}/minigui-res"
    depends=(minigui)
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})

    cd "${srcdir}/${pkgname%-git}"
    sed -i 's|prefix = $(TOPDIR)/usr/local|prefix = $(prefix)|g' config.linux
    ./autogen.sh
    ./configure --prefix=/usr

    make -j$NR_JOBS
    make DESTDIR="$pkgdir" install
}

package_minigui-docs-git() {
    pkgdesc="Documents for MiniGUI Core and MiniGUI Components."
    url="${_url}/minigui-docs"
    depends=(minigui)
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})

    install -dm0755 ${pkgdir}/usr/share/doc
    cp -rv "${srcdir}"/${pkgname%-git}  "${pkgdir}"/usr/share/doc/
}

package_minigui-git() {
    pkgdesc="A modern and proven cross-platform window system for embedded systems or smart IoT devices."
    url="${_url}/MiniGUI"
#     depends=(
# #             chipmunk
#     )
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})

    cd "${srcdir}/${pkgbase}"

    sed -i 's|$(prefix)/etc|/etc|g' etc/Makefile.am
    ./autogen.sh

    ./configure \
        $prefix_config \
        --prefix=/usr \
        --disable-static \
        --with-targetname=mstudio \
        --with-libsuffix=msd \
        --enable-pcxvfb \
        --disable-qvfbial \
        --disable-consoleial \
        --disable-dummyial \
        --disable-autoial \
        --disable-videodummy \
        --disable-videoqvfb \
        --disable-videofbcon \
        --disable-videocommlcd \
        --with-ttfsupport=ft2 \
        --enable-qpfsupport \
        --enable-upfsupport \
        --enable-gb18030support \
        --enable-unicodesupport \
        --enable-aboutdlg \
        --disable-savescreen \
        --disable-splash \
        --disable-screensaver \
        --with-runmode=ths \
        --enable-ctrlstatic \
        --enable-ctrlbutton \
        --enable-ctrlsledit \
        --enable-ctrlbidisledit \
        --enable-ctrlnewtextedit \
        --enable-ctrllistbox \
        --enable-ctrlpgbar \
        --enable-ctrlcombobox \
        --enable-ctrlpropsheet \
        --enable-ctrltrackbar \
        --enable-ctrlscrollbar \
        --enable-ctrlnewtoolbar \
        --enable-ctrlmenubtn \
        --enable-ctrlscrollview \
        --enable-ctrltextedit \
        --enable-ctrlmonthcal \
        --enable-ctrltreeview \
        --enable-ctrltreeview-rdr \
        --enable-ctrlspinbox \
        --enable-ctrlcoolbar \
        --enable-ctrllistview \
        --enable-ctrliconview \
        --enable-ctrlgridview \
        --enable-ctrlanimation \
        --disable-watermark \
        --disable-pngsupport \
        --disable-videodrm

    sed -i 's|/local||g' etc/mvfb.cfg
    sed -i 's|/local||g' etc/MiniGUI.cfg

    make -j$NR_JOBS
    make DESTDIR="$pkgdir" install
}

package_minigui-ministudo-git() {
    pkgdesc="GUIBuilder of miniStudio."
    depends=(minigui{,-{mgutils,mgplus,mgeff,mgncs,mgncs4touch,mg-tools,mg-tests,mg-samples,mg-demos,cell-phone-ux-demo,chipmunk,res,docs}})
    url="https://github.com/FMSoftCN/ministudo-guibuilder"

    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})
    # build GUIBuilder
    cd "${srcdir}/${pkgname%-git}"
    ./autogen.sh
    ./configure --prefix=/usr \
        --enable-werror

    make
    make DESTDIR="$pkgdir" install

    # resourse
    cd "${srcdir}/${pkgname%-git}/etc"
    make
    make DESTDIR="$pkgdir" install

    # tools/mgcfg-trans
    cd "${srcdir}/${pkgname%-git}/tools/mgcfg-trans"
    rm -f mgcfg-trans
    gcc lex.yy.c -o mgcfg-trans
    install -Dm755 mgcfg-trans -t $pkgdir/bin/

    # tools/res2c
    cd "${srcdir}/${pkgname%-git}/tools/res2"
    make clean
    make
    install -Dm755 cfg2c.py -t $pkgdir/bin/
    install -Dm755 res2c -t $pkgdir/bin/
}
