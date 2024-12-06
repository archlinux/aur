# Maintainer: Freddy Potargent <fpotargent at gmail dot com>
# Contributor: Lu Xu <oliver_lew at outlook dot com>

pkgbase=reduce
pkgname=(reduce-common reduce-csl reduce-psl reduce-addons)
pkgdesc="A Portable General-Purpose Computer Algebra System"
pkgver=6860
pkgrel=1
arch=('x86_64')
url="https://reduce-algebra.sourceforge.io/"
license=('BSD')
depends=('bash'
         'fontconfig'
         'gcc-libs'
         'glibc'
         'libx11'
         'libxcursor'
         'libxext'
         'libxft'
         'libxrandr'
         'ncurses'
         'zlib')
makedepends=('ccache'
             'rsync'
             'texlive-latex'
             'texlive-latexextra'
             'texlive-fontsrecommended'
             'texlive-plaingeneric')

_source_urlbase="https://master.dl.sourceforge.net/project/reduce-algebra/snapshot_2024-08-12"
source=("${_source_urlbase}/Reduce-svn6860-src.tar.gz"
        "fixes.patch"
        "build.patch")
sha256sums=('bf084f096839c1ed06207d56ae8e84d1097dce9f3a95d84adb26c9465a92718d'
            '6ccd5933b5f45312b05f41fb62d23d6f650b61a86f037425bda5e658dd1b1e16'
            'ff030116fd991213c951f9171e226d4b5ef3b0958077592ad77d61f02ee48ffd')

MAKEFLAGS+=" -j1 --no-keep-going"
CFLAGS+=" -Wno-error=format-security"
CXXFLAGS+=" -Wno-error=format-security"

prepare() {
    patch -p0 <fixes.patch
    patch -p0 <build.patch
}

build() {
    local BUILDTOPDIR="$(readlink -m $srcdir)/Reduce-svn${pkgver}-src"
    local INSTALLDIR="$(readlink -m $srcdir)/tmp"
    local DEBIANDIR="${BUILDTOPDIR}/debianbuild/reduce"

    rm -rf "$INSTALLDIR"
    mkdir -p "$INSTALLDIR"

    # cd "$DEBIANDIR"
    # make -f debian/rules BUILDTOPDIR="${BUILDTOPDIR}" configure
    # make -f debian/rules BUILDTOPDIR="${BUILDTOPDIR}" build
    ################
    cd "$BUILDTOPDIR"
    configure --prefix=/usr --with-csl --with-psl
    touch "${DEBIANDIR}/configure-stamp"
    make -j
    touch "${DEBIANDIR}/build-stamp"

    (cd doc/misc; make)
    (cd doc/manual; make)
    ################
    cd "$DEBIANDIR"
    make -f debian/rules BUILDTOPDIR="${BUILDTOPDIR}" INSTALLDIR="${INSTALLDIR}" install

    gzip "${BUILDTOPDIR}/debianbuild/reduce/debian/changelog"
    for d in reduce-common reduce-csl reduce-psl reduce-addons; do
        local _srcdir="${BUILDTOPDIR}/debianbuild/reduce/debian"
        local _tgtdir="${INSTALLDIR}/usr/share/doc/$d"
        mkdir -p "$_tgtdir"
        cp "${_srcdir}/changelog.gz" "${_srcdir}/copyright" "$_tgtdir"
    done

    gzip ${INSTALLDIR}/usr/share/doc/reduce/*.{tex,txt,pdf}
    gzip ${INSTALLDIR}/usr/share/doc/reduce-addons/breduce.{tex,pdf}
}

_package_filelist() {
    local file="$srcdir/Reduce-svn${pkgver}-src/debianbuild/reduce/debian/$1"

    tar -c -C "$srcdir/tmp" --files-from="$file" | tar -x -C "$pkgdir"
}

package_reduce-common() {
    pkgdesc="A Portable General-Purpose Computer Algebra System -- common files"
    arch=('any')
    depends=('bash')

    _package_filelist reduce-common.install
}

package_reduce-csl() {
    pkgdesc="A Portable General-Purpose Computer Algebra System -- CSL based"
    provides=('reduce')
    depends+=('reduce-common')
    optdepends=('gnuplot: for plotting graphs')

    _package_filelist reduce-csl.install
}

package_reduce-psl() {
    pkgdesc="A Portable General-Purpose Computer Algebra System -- PSL based"
    provides=('reduce')
    depends=('bash' 'glibc')
    depends+=('reduce-common')
    optdepends=('gnuplot: for plotting graphs')

    _package_filelist reduce-psl.install
}

package_reduce-addons() {
    pkgdesc="A Portable General-Purpose Computer Algebra System -- addons"
    depends=('bash' 'glibc' 'ncurses')
    depends+=('reduce')

    _package_filelist reduce-addons.install
}
