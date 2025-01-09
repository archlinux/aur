# Maintainer: Freddy Potargent <fpotargent at gmail dot com>
# Contributor: Lu Xu <oliver_lew at outlook dot com>

pkgbase=reduce
pkgname=(reduce-common reduce-csl reduce-psl reduce-addons)
pkgdesc="A Portable General-Purpose Computer Algebra System"
pkgver=6860
pkgrel=1
arch=('x86_64')
url="https://reduce-algebra.sourceforge.io/"
license=('BSD-2-Clause' 'LGPL-2.1-only')
depends=('bash' 'fontconfig' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libx11'
         'libxcursor' 'libxext' 'libxft' 'libxrandr' 'ncurses' 'zlib')
makedepends=('rsync' 'texlive-fontsrecommended' 'texlive-latex'
             'texlive-latexextra' 'texlive-plaingeneric')
options=('!makeflags' 'strip' 'zipman')

_source_urlbase="https://master.dl.sourceforge.net/project/reduce-algebra/snapshot_2024-08-12"
source=("${_source_urlbase}/Reduce-svn6860-src.tar.gz"
        "fixes.patch"
        "build.patch")
sha256sums=('bf084f096839c1ed06207d56ae8e84d1097dce9f3a95d84adb26c9465a92718d'
            'd630ec524525a38cf744920b185aac95b580eeb6b405a85dfe7dcbe17daa3a1b'
            '4bd5a8c7b4cf77c728a0086c09fa6ab2975756e710dc14381f0ab201ea166833')

CFLAGS+=" -Wno-error=format-security"
CXXFLAGS+=" -Wno-error=format-security"

prepare() {
    echo "$pkgver" >"$srcdir/Reduce-svn${pkgver}-src"/svnversion.txt
    patch -p0 <fixes.patch
    patch -p0 <build.patch
}

build() {
    local SRCDIR="$(readlink -m $srcdir)"
    local BUILDTOPDIR="$SRCDIR/Reduce-svn${pkgver}-src"
    local STAGINGDIR="$SRCDIR/staging"
    local DEBIANDIR="$BUILDTOPDIR/debianbuild/reduce"

    rm -rf "$STAGINGDIR"
    mkdir -p "$STAGINGDIR"

    cd "$DEBIANDIR"
    make -f debian/rules BUILDTOPDIR="${BUILDTOPDIR}" configure
    make -f debian/rules BUILDTOPDIR="${BUILDTOPDIR}" build
    make -f debian/rules BUILDTOPDIR="$BUILDTOPDIR" INSTALLDIR="$STAGINGDIR" install

    for docdir in reduce-common reduce-csl reduce-psl reduce-addons; do
        local docsharedir="$STAGINGDIR/usr/share/doc/$docdir"
        mkdir -p "$docsharedir"
        cp "$DEBIANDIR/debian/changelog" "$DEBIANDIR/debian/copyright" "$docsharedir"
    done
}

_package_filelist() {
    local file="$srcdir/Reduce-svn${pkgver}-src/debianbuild/reduce/debian/$1"

    tar -c -C "$srcdir/staging" --files-from="$file" | tar -x -C "$pkgdir"
}

package_reduce-common() {
    pkgdesc="A Portable General-Purpose Computer Algebra System -- common files"
    arch=('any')
    depends=('bash' 'hicolor-icon-theme')

    _package_filelist reduce-common.install
}

package_reduce-csl() {
    pkgdesc="A Portable General-Purpose Computer Algebra System -- CSL based"
    provides=('reduce')
    depends=('reduce-common' 'bash' 'fontconfig' 'gcc-libs' 'glibc' 'libx11'
             'libxcursor' 'libxext' 'libxft' 'libxrandr' 'ncurses' 'zlib')
    optdepends=('gnuplot: for plotting graphs')

    _package_filelist reduce-csl.install
}

package_reduce-psl() {
    pkgdesc="A Portable General-Purpose Computer Algebra System -- PSL based"
    provides=('reduce')
    depends=('reduce-common' 'bash' 'glibc')
    optdepends=('gnuplot: for plotting graphs')

    _package_filelist reduce-psl.install
}

package_reduce-addons() {
    pkgdesc="A Portable General-Purpose Computer Algebra System -- addons"
    depends=('reduce' 'bash' 'glibc' 'ncurses')

    _package_filelist reduce-addons.install
}
