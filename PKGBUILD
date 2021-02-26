# Maintainer: John Regan <john@jrjrtech.com>
pkgname='vgmtools-git'
pkgver=r99.1f8a5eb
pkgrel=1
pkgdesc="A collection of tools for the VGM file format"
arch=(x86_64 i686)
url="https://github.com/vgmrips/vgmtools"
license=('GPL')
makedepends=('zlib' 'git' 'cmake')

source=('git+https://github.com/vgmrips/vgmtools.git')
md5sums=('SKIP')
_progs=(
'dro2vgm'
'imf2vgm'
'opl_23'
'optvgmrf'
'raw2vgm'
'vgm2txt'
'vgm_cmp'
'vgm_cnt'
'vgm_dbc'
'vgm_dso'
'vgm_facc'
'vgmlpfnd'
'vgmmerge'
'vgm_mono'
'vgm_ndlz'
'vgm_ptch'
'vgm_smp1'
'vgm_sptd'
'vgm_spts'
'vgm_sro'
'vgm_stat'
'vgm_tag'
'vgm_trim'
'vgm_tt'
'vgm_vol'
)

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    # leaving a note for patching
    #patch --forward --strip=1 --input="${srcdir}/vgmtools-example.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
    rm -rf build
    mkdir build
    cd build
    cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_SKIP_BUILD_RPATH=TRUE \
      -DCMAKE_INSTALL_PREFIX=/usr \
      ..
	make
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
    for p in "${_progs[@]}" ; do
        install -Dm755 ${p} "$pkgdir/usr/bin/${p}"
    done
	cd "$srcdir/${pkgname%-git}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

