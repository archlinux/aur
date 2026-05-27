# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=gtkada
pkgdesc='Ada bindings for the Gtk+ library.'
pkgver=27.0w
pkgrel=1
epoch=1

url='https://github.com/AdaCore/gtkada'
arch=(x86_64)
license=(GPL-3.0-only LicenseRef-custom)
options=(!lto)

depends=(gcc-ada
         gtk3)
makedepends=(gprbuild-toolbox
             python-sphinx
             python-sphinx_rtd_theme
             texlive-meta
             gnatdoc)

_gtkada_src=gtkada-27.0w-20260409-163D3-src

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2026/gtkada-src.tar.gz
        Makefile.in-patch)
sha256sums=(217ca366be4dc581b3b04e942d8b36e29e41561fa9e8d1b03cd2e9adb85e52ab
            f525df1f7c319f1dc95ddafe1a73d961ce162c6171c97b0df3ae756122ca76d4)


prepare()
{
    cd "${srcdir}/${_gtkada_src}"

    patch -Np1 -i ../Makefile.in-patch

    sed -i 's/gnatdoc3/gnatdoc/g' docs/gtkada_rm/Makefile
}


build()
{
    cd "${srcdir}/${_gtkada_src}"

    ./configure --prefix=/usr

    ## Strip flags incompatible with GNAT.
    #
    local _ada_flags="${CFLAGS//-Wformat}"
    _ada_flags="${_ada_flags//-Werror=format-security}"

    # Disable RPATH usage with -R.
    # Only use a single job (-j1) to prevent the same file being compiled simultaneously
    # which results in build artifacts being overwritten.
    #
    make -j1 GPRBUILD_SWITCHES="-R -cargs ${_ada_flags} -largs ${LDFLAGS} -gargs"


    ## Make the documentation.
    #
    make docs > make_docs.log
}


package()
{
    cd "${srcdir}/${_gtkada_src}"

    make -j1 DESTDIR="${pkgdir}" install

    ## Install the reference manual documentation.
    #
    mv docs/gtkada_rm/doc_obj/gnatdoc/html \
       "${pkgdir}/usr/share/doc/${pkgname}/gtkada_rm"


    ## Install the license.
    #
    install -Dm644 COPYING3 \
        "${pkgdir}/usr/share/licenses/${pkgname}/COPYING3"


    ## Install the custom license.
    #
    install -Dm644 COPYING.RUNTIME \
        "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.RUNTIME"
}
