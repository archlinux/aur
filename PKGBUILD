# Maintainer: tuxayo <victor (replace by @) tuxayo DOT net>
# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Brenton Horne <brentonhorne77 at gmail dot com>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: t3ddy  <t3ddy1988 "at" gmail {dot} com>
# Contributor: Adrián Chaves Fernández (Gallaecio) <adriyetichaves@gmail.com>
pkgname=('0ad-git' '0ad-data-git')
_pkgname=0ad
epoch=1
pkgver=a26.r2085.ga32a28a5e3
pkgrel=1
pkgdesc="Cross-platform, 3D and historically-based real-time strategy game (git version)"
arch=('i686' 'x86_64')
url="https://play0ad.com"
license=('GPL-2.0-or-later' 'CC-BY-NC-SA-3.0')
makedepends=('boost' 'cmake' 'mesa' 'zip' 'libsm' 'rust' 'git' 'enet' 'fmt'
             'gloox' 'libminiupnpc.so' 'libpng' 'libsodium' 'libvorbis'
             'miniupnpc' 'openal' 'sdl2' 'wxwidgets-gtk3' 'which' 'subversion'
             'makepkg-git-lfs-proto' 'python' 'llvm' 'cbindgen')
options=('!lto' '!debug') # lto breaks spidermonkey linking (https://bugs.gentoo.org/746947)
source=(
  "git-lfs+https://gitea.wildfiregames.com/0ad/0ad"
)
md5sums=(
  'SKIP'
)

pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # https://gitea.wildfiregames.com/0ad/0ad/issues/8571
  export CXXFLAGS="${CXXFLAGS/-fexceptions/}"

  export CMAKE_POLICY_VERSION_MINIMUM=3.5
  cd "$srcdir/${_pkgname}/libraries"
  ./build-source-libs.sh
  cd "$srcdir/${_pkgname}/build/workspaces"
  ./update-workspaces.sh \
      --with-lto \
      --without-pch \
      --bindir=/usr/bin \
      --libdir=/usr/lib/0ad \
      --datadir=/usr/share/${pkgname}/data

#  cd "$srcdir/${_pkgname}/libraries/source/fcollada/src"
#  make # always keep uncommented
#  # OPTIONAL: uncomment for a debug build, it's a 2nd executable named
#  # `pyrogenesis_dbg`
#  # It's independent from the debug symbols and not as important as them.
#  # https://trac.wildfiregames.com/wiki/Debugging#CallstackonLinuxmacOS
#  # It's likely a small increase of build time.
#  # And up to a 1.2 GiB in total used space. (inc. package build files)
#  # Note there is something else to uncomment below in package_0ad-git()
#  # make config=debug

  cd gcc
  make # always keep uncommented
  # OPTIONAL: uncomment for a debug build, see above
  # make config=debug
}

package_0ad-git() {
  depends=('0ad-data' 'boost-libs' 'curl' 'enet' 'libpng' 'libvorbis'
           'libxml2' 'openal' 'sdl2' 'wxwidgets-gtk3' 'zlib' 'fmt'
           'gloox' 'miniupnpc' 'libminiupnpc.so' 'icu' 'libsodium' 'which')
  conflicts=('0ad')
  provides=('0ad')

  install -d "${pkgdir}"/usr/{bin,lib/0ad,share/"${_pkgname}"/data}
  cd "$srcdir/${_pkgname}"

  install -Dm755 binaries/system/pyrogenesis "${pkgdir}/usr/bin"
  # OPTIONAL: uncomment below for debug build. See the comments around the `make` calls
  #install -Dm755 binaries/system/pyrogenesis_dbg "${pkgdir}/usr/bin"

  install -Dm755 binaries/system/*.so "${pkgdir}/usr/lib/0ad"

  cp -r binaries/data/l10n/ "${pkgdir}/usr/share/${_pkgname}/data/"

  install -Dm755 build/resources/${_pkgname}.sh "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 build/resources/${_pkgname}.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 build/resources/${_pkgname}.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}

package_0ad-data-git() {
  pkgdesc+=" (data files)"
  conflicts=('0ad-data')
  provides=('0ad-data')
  mkdir -p ${pkgdir}/usr/share/${_pkgname}-git
  cd "$srcdir/${_pkgname}"
  cp -r "binaries/data" "${pkgdir}/usr/share/${_pkgname}-git"
}
