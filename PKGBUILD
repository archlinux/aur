# Maintainer: Alexandros Theodotou <alex@zrythm.org>
# `lilv` Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=mingw-w64-lilv
pkgver=0.24.4
pkgrel=1
pkgdesc="A C library interface to the LV2 plug-in standard"
arch=('any')
url="https://drobilla.net/software/lilv/"
license=('custom:ISC')
depends=('mingw-w64-sratom')
makedepends=('mingw-w64-python')
optdepends=('bash-completion: completion for bash'
            'mingw-w64-libsndfile: for lv2apply')
source=("https://download.drobilla.net/${pkgname}-${pkgver}.tar.bz2"{,.sig})
sha512sums=('cb909c83dbac36b51a206fe508aec51e52ddf068f9a159d053888594402def8d140aae0d9e1e1866e722396f7ec8dea4b86d4c1b958f56eb3193b78307918a89'
            'SKIP')
validpgpkeys=('907D226E7E13FA337F014A083672782A9BF368F3')

_architectures=('i686-w64-mingw32' 'x86_64-w64-mingw32')

prepare() {
  cd "${pkgname}-${pkgver}"
  # don't run local ldconfig
  sed -i "/ldconfig/d" wscript
}

build() {
  cd "${pkgname}-${pkgver}"

  for _arch in "${_architectures[@]}"; do
    python waf configure --prefix=/usr/"$_arch" \
                          --bindings \
                          --no-bash-completion \
                          --dyn-manifest \
                          --test
    python waf build
  done
}

check() {
  cd "${pkgname}-${pkgver}"

  python waf test
}

package() {
  cd "${pkgname}-${pkgver}"
  python waf install --destdir="${pkgdir}"
  # license
  install -vDm 644 COPYING \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # bash completion
  install -vDm 644 utils/lilv.bash_completion\
    "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
}

# vim:set ts=2 sw=2 et:
