# Maintainer: Alexandros Theodotou <alex@zrythm.org>
# `lilv` Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>

_pkgbase=lilv
pkgname=mingw-w64-lilv
pkgver=0.24.4
pkgrel=5
pkgdesc="A C library interface to the LV2 plug-in standard"
arch=('any')
url="https://drobilla.net/software/lilv/"
license=('custom:ISC')
depends=('mingw-w64-sratom')
makedepends=('mingw-w64-python')
optdepends=('bash-completion: completion for bash'
            'mingw-w64-libsndfile: for lv2apply')
options=('!libtool' '!strip' '!buildflags' '!makeflags')
source=("https://download.drobilla.net/${_pkgbase}-${pkgver}.tar.bz2"{,.sig})
sha512sums=('cb909c83dbac36b51a206fe508aec51e52ddf068f9a159d053888594402def8d140aae0d9e1e1866e722396f7ec8dea4b86d4c1b958f56eb3193b78307918a89'
            'SKIP')
validpgpkeys=('907D226E7E13FA337F014A083672782A9BF368F3')

_architectures=('i686-w64-mingw32' 'x86_64-w64-mingw32')

prepare() {
  cd "${_pkgbase}-${pkgver}"
  # don't run local ldconfig
  sed -i "/ldconfig/d" wscript

  patch src/util.c < "${srcdir}/../lilv_symlink.patch"
  patch wscript < "${srcdir}/../lilv_nobench.patch"
}

build() {
  cd "${srcdir}"

  for _arch in "${_architectures[@]}"; do
    rm -rf build-${_arch}
    cp -r "${_pkgbase}-${pkgver}" build-${_arch}
    pushd build-${_arch}

    CC="$_arch-gcc" CXX="$_arch-g++" python waf configure --prefix=/usr/"$_arch" \
                          --no-bash-completion \
                          --dyn-manifest #\
                          #--bindings \
                          #--test
    python waf build

    popd
  done
}

check() {
  cd "${_pkgbase}-${pkgver}"

  #python waf test
}

package() {
  cd "${srcdir}"

  for _arch in "${_architectures[@]}"; do
    pushd "build-${_arch}"

    python waf install --destdir="${pkgdir}"

    # license
    install -vDm 644 COPYING \
      "${pkgdir}/usr/$_arch/share/licenses/${_pkgbase}/LICENSE"
    # bash completion
    install -vDm 644 utils/lilv.bash_completion\
      "${pkgdir}/usr/$_arch/share/bash-completion/completions/${_pkgbase}"

    # move DLL to bin directory
    install -d $pkgdir/usr/${_arch}/bin
    mv "$pkgdir"/usr/${_arch}/lib/*.dll "$pkgdir"/usr/${_arch}/bin

    # strip
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a

    popd
  done
}

# vim:set ts=2 sw=2 et:
