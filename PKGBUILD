### FIXME: Currently broken!, upstream installs executable to `/usr/HDRview`. Moving it to `/usr/bin/HDRview` results in segmentation fault since it does not find anymore the assets at `/usr/assets/`. Otherwise, setting `-DCMAKE_INSTALL_PREFIX=/usr/bin` must also not be done because otherwise fonts and images end up in `/usr/bin/`. See https://github.com/wkjarosz/hdrview/issues/130.
### TODO: If upstream does not fix it, change to installation into `/opt/hdrview/`.

# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Maintainer:  Afnan Enayet <afnan at afnan.io>
# Contributor: Eric Engestrom (https://aur.archlinux.org/account/1ace)

_pkgname=hdrview
pkgname="$_pkgname-git"
epoch=0
pkgver=2.0.1+34.r370.20241230.8306be8
pkgrel=1
pkgdesc='High dynamic range (HDR) image viewer and comparison tool'
url='https://github.com/wkjarosz/hdrview'
arch=('x86_64' 'i686')
license=('BSD-3-Clause')
makedepends=('git' 'cmake' 'ninja')
depends=('hicolor-icon-theme' 'libglvnd' 'zlib' 'glibc' 'gcc-libs' libx{i,randr,inerama,cursor,11})
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

prepare() {
  # Run cmake in `prepare()` since it will download stuff.
  cmake -S "$_pkgname" -B build \
    -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DFETCHCONTENT_QUIET=OFF \
    -DIMATH_INSTALL_PKG_CONFIG=OFF \
    -DIMATH_INSTALL_SYM_LINK=OFF \
    -DOPENEXR_INSTALL=OFF \
    -DOPENEXR_INSTALL_PKG_CONFIG=OFF \
    -DOPENEXR_INSTALL_TOOLS=OFF

  cd "$_pkgname"
  git log > "git.log"
}

pkgver() {
  cd "$srcdir/$_pkgname"

  _ver="$(git describe  --tags | sed -E 's|-g[0-9a-fA-F]*$||' | sed -E 's|^[vV]||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
      error "Version could not be determined."
  return 1
  else
      printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
   export MAKEFLAGS="-j1"
   cmake --build build -j 1
}

package() {
  ## Install main project
  DESTDIR="$pkgdir" cmake --install build

  ## Add a lowercase executable symlink
  ln -svr "${pkgdir}/usr/bin/HDRView" "${pkgdir}/usr/bin/hdrview"

  ## Project installs a copy of its own deps as well. Fixup.
  for dep in Imath # OpenEXR
  do
    rm -rf "$pkgdir/usr/include/$dep"/
    rm -rf "$pkgdir/usr/lib/cmake/$dep"/
  done
  # These don't have a filename trivially derived from the dep name, but
  # the project doesn't have any static lib of its own so let's just
  # blindly remove any.
  rm -f "$pkgdir"/usr/lib/lib*.a

  ## Delete directories that should be empty.
  #  If not empty: Raise an error in case there's every anything else added (either
  #  a new dep, or the project starts shipping libs). That's why we use `rmdir` and not `rm -rf`.
  if [ -d "$pkgdir"/usr/include/ ]; then
    rmdir "$pkgdir"/usr/include/
  fi
  if [ -d "$pkgdir"/usr/lib/cmake/ ]; then
    rmdir "$pkgdir"/usr/lib/cmake/
  fi
  if [ -d "$pkgdir"/usr/lib/pkgconfig/ ]; then
    rmdir "$pkgdir"/usr/lib/pkgconfig/
  fi
  if [ -d "$pkgdir"/usr/lib/ ]; then
    rmdir "$pkgdir"/usr/lib/
  fi

  ## Install documentation and license
  for _docfile in README.md TODO.md git.log; do
    install -D -m644 -v "$srcdir/$_pkgname/$_docfile" "$pkgdir/usr/share/doc/$_pkgname/$_docfile"
  done
  install -D -m644 -v "$srcdir/$_pkgname/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
