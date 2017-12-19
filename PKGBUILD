# Maintainer: Lettier <movie_monad_aur a@@at@t lettier dd.ot..t ccommm>

_hkgname="movie-monad"
_ver=0.0.2.0
_xrev=0
_tree_hash="44a705fc46e66dc9e585625e535b8c7d2473af15"
_ghc_ver="8.0.2"

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
sha256sums=('3cb2b58c6513c52e7620d0bd64196a105928259c2ce71f070b9c993f5586c431')

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
  wget "https://raw.githubusercontent.com/lettier/movie-monad/${_tree_hash}/makefile" -O "makefile"
  make cabal_install_relocatable_executable
}

package() {
  cd "${srcdir}/${_hkgname}-${_ver}"
  wget "https://raw.githubusercontent.com/lettier/${pkgname}/${_tree_hash}/packaging/linux/generic/${pkgname}.desktop" -O "${pkgname}.desktop"
  wget "https://raw.githubusercontent.com/lettier/${pkgname}/${_tree_hash}/packaging/linux/generic/${pkgname}.svg" -O "${pkgname}.svg"
  mkdir -p \
    "${pkgdir}/usr/bin" \
    "${pkgdir}/usr/lib/x86_64-linux-ghc-${_ghc_ver}" \
    "${pkgdir}/usr/share/doc/${pkgname}" \
    "${pkgdir}/usr/share/x86_64-linux-ghc-${_ghc_ver}/${pkgname}-${_ver}" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps" \
    "${pkgdir}/usr/share/applications"
  cp ".cabal-sandbox/bin/${pkgname}" "${pkgdir}/usr/bin/"
  cp ".cabal-sandbox/lib/x86_64-linux-ghc-${_ghc_ver}/"*.so "${pkgdir}/usr/lib/x86_64-linux-ghc-${_ghc_ver}/"
  cp -R ".cabal-sandbox/share/x86_64-linux-ghc-${_ghc_ver}/${pkgname}-${_ver}" "${pkgdir}/usr/share/x86_64-linux-ghc-${_ghc_ver}/"
  cp -R ".cabal-sandbox/share/doc/x86_64-linux-ghc-${_ghc_ver}/"* "${pkgdir}/usr/share/doc/${pkgname}/"
  cp "${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
  cp "${pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
}
