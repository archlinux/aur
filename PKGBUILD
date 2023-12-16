# Maintainer:  Jason Kercher <jkercher 43 at gmail dot com>

pkgname=linuxcnc-git
pkgver=2.9.1.r1300.g1db56381a8
pkgrel=1
pkgdesc="Controls CNC machines. It can drive milling machines, lathes, 3d printers, laser cutters, plasma cutters, robot arms, hexapods, and more (formerly EMC2)"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://linuxcnc.org"
depends=(bc
    boost
    bwidget
    glibc
    glu
    gtk3
    libgpiod
    libxaw
    readline
    procps-ng
    psmisc
    python
    python-gobject
    python-pillow
    python-yapps2
    tkimg
#    python-gtkglext
    tclx
    xorg-server
)
makedepends=(
    asciidoc
    gettext
    git
    # texinfo
    intltool
    python-sphinx
    man-db)
provides=('linuxcnc')
conflicts=('linuxcnc' 'linuxcnc-bin')
options=('!strip')
source=("${pkgname}::git+https://github.com/LinuxCNC/linuxcnc"
        'libtirpc.patch')
sha256sums=('SKIP'
            'bc95bafd67fad1c1d3722261bc586cdc612ec9e1597fadb95fa825c10550ac2c')

pkgver() {
  cd "${srcdir}/${pkgname}"
  # Generate git tag based version. Count only proper (v)#.#* [#=number] tags.
  local _gitversion=$(git describe --long --tags --match '[v0-9][0-9.][0-9.]*' | sed -e 's|^v||' | tr '[:upper:]' '[:lower:]')

  # Format git-based version for pkgver
  # Expected format: e.g. 1.5.0rc2.r521.g99982a1c
  echo "${_gitversion}" | sed \
      -e 's|^\([0-9][0-9.]*\)-\([a-zA-Z]\+\)|\1\2|' \
      -e 's|\([0-9]\+-g\)|r\1|' \
      -e 's|-|.|g'
}

prepare() {
  cd "${srcdir}/${pkgname}/src"
  echo "export TCLLIBPATH=$TCLLIBPATH:/usr/lib/tcltk/linuxcnc" > ${pkgname}.sh
  find . -iname fixpaths.py -o -iname checkglade -o \
   -iname update_ini | xargs perl -p -i -e "s/python/python3/"
  patch -Np2 -i "${srcdir}/libtirpc.patch"
  sed -i 's|/usr/local/etc/emc2/configs|/etc/emc2/configs|g' Makefile.inc.in
  sed -i 's|$(DESTDIR)$(sysconfdir)/linuxcnc|$(DESTDIR)/etc/linuxcnc|g' Makefile.orig
  ./autogen.sh
  ./configure --with-realtime=uspace \
   --without-libmodbus --prefix=/usr \
   --with-python=/usr/bin/python3 \
   --enable-non-distributable=yes

  sed -i 's|$(DESTDIR)$(sysconfdir)/linuxcnc|$(DESTDIR)/etc/linuxcnc|g' Makefile
}

build () {
  cd "${srcdir}/${pkgname}/src"
  make
}

package() {
  cd "${srcdir}/${pkgname}/src"
  DESTDIR=${pkgdir} make install 
  cp -PR "${srcdir}/${pkgname}/share/applications" "${pkgdir}/usr/share"
  mkdir -p "${pkgdir}/etc/xdg"
  cp -PR "${srcdir}/${pkgname}/share/menus" "${pkgdir}/etc/xdg/"
  install -Dm755 "${srcdir}/${pkgname}/src/${pkgname}.sh" \
   "${pkgdir}/etc/profile.d/${pkgname}.sh"
  sed -i "s|${srcdir}||" "${pkgdir}/usr/share/linuxcnc/Makefile.modinc"
  install -Dm644 ${pkgdir}/usr/share/linuxcnc/linuxcncicon.png -t ${pkgdir}/usr/share/pixmaps
}
