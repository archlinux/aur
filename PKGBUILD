# Maintainer: Lettier <movie_monad_aur a@@at@t lettier dd.ot..t ccommm>

_hkgname="movie-monad"
_ver=0.0.3.0
_xrev=0
_tree_hash="0cf731e4b9a034cb27bac335018e29e6f1713499"

pkgname="movie-monad"
pkgver=${_ver}_${_xrev}
pkgrel=1
pkgdesc="A free and simple to use video player built with Haskell."
url="https://github.com/lettier/${pkgname}"
license=("BSD3")
arch=("x86_64")
makedepends=("make" "wget" "gobject-introspection" "git" "gmp" "zlib" "ncurses")
depends=("gtk3" "gstreamer" "gst-libav" "gst-plugins-base-libs" "gst-plugins-base" "gst-plugins-good" "gst-plugins-bad")
options=("strip" "staticlibs")
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${_ver}/${_hkgname}-${_ver}.tar.gz")
md5sums=('f3bad373d1fec761b7b135200168a835')

build() {
  mkdir -p "${HOME}/.local/bin"
  cd "${srcdir}"

  if [ ! `command -v stack` ]; then
    # https://github.com/commercialhaskell/stack/issues/257#issuecomment-241898802
    git clone https://aur.archlinux.org/libtinfo5.git
    cd libtinfo5
    makepkg -sic

    cd "${srcdir}"

    git clone https://aur.archlinux.org/stack-bin.git
    cd "stack-bin"
    makepkg -sic

    cd "${srcdir}"

    # https://github.com/commercialhaskell/stack/issues/3509#issuecomment-338786743
    mkdir -p "${HOME}/.stack/"
    touch "${HOME}/.stack/config.yaml"
    echo "ghc-build: nopie" >> "${HOME}/.stack/config.yaml"
  fi

  cd "${srcdir}/${_hkgname}-${_ver}"
  make cabal_install_relocatable_executable
}

package() {
  cd "${srcdir}/${_hkgname}-${_ver}"
  wget "https://raw.githubusercontent.com/lettier/${pkgname}/${_tree_hash}/packaging/linux/generic/${pkgname}.desktop" -O "${pkgname}.desktop"
  wget "https://raw.githubusercontent.com/lettier/${pkgname}/${_tree_hash}/packaging/linux/generic/${pkgname}.svg" -O "${pkgname}.svg"
  _GHC_VER=`stack ghc -- --numeric-version`
  mkdir -p \
    "${pkgdir}/usr/bin" \
    "${pkgdir}/usr/lib/x86_64-linux-ghc-${_GHC_VER}" \
    "${pkgdir}/usr/share/doc/${pkgname}" \
    "${pkgdir}/usr/share/x86_64-linux-ghc-${_GHC_VER}/${pkgname}-${_ver}" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps" \
    "${pkgdir}/usr/share/applications"
  cp ".cabal-sandbox/bin/${pkgname}" "${pkgdir}/usr/bin/"
  cp ".cabal-sandbox/lib/x86_64-linux-ghc-${_GHC_VER}/"*.so "${pkgdir}/usr/lib/x86_64-linux-ghc-${_GHC_VER}/"
  cp -R ".cabal-sandbox/share/x86_64-linux-ghc-${_GHC_VER}/${pkgname}-${_ver}" "${pkgdir}/usr/share/x86_64-linux-ghc-${_GHC_VER}/"
  cp -R ".cabal-sandbox/share/doc/x86_64-linux-ghc-${_GHC_VER}/"* "${pkgdir}/usr/share/doc/${pkgname}/"
  cp "${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
  cp "${pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
}
