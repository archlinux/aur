# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_gitname="meshcore-open"
_pkgname="${_gitname}"
pkgname="${_pkgname}-git"
pkgver=alpha9+217.r962.20260903.dbd7f2aa
pkgrel=2
pkgdesc="Open-source Flutter client for MeshCore LoRa mesh networking devices."
groups=('meshcore')
arch=(
  'i686'
  'x86_64'
  'aarch64'
)
_githost='github.com'
_gituser='zjs81'
url="https://${_githost}/${_gituser}/${_gitname}"
license=("MIT")
depends=(

  # glib2
  libglib-2.0.so
  libgio-2.0.so
  libgobject-2.0.so

  # gtk3
  libgdk-3.so
  libgtk-3.so

  glibc
  libgcc_s.so
  libatk-1.0.so  # at-spi2-core
  libfontconfig.so
  libstdc++.so
  libcairo.so
  libepoxy.so
  libpango-1.0.so
  libpangocairo-1.0.so
)
makedepends=(
  # To retrieve the source:
  'git'

  # Used for packaging
  'cmake'
  'ninja'

  ## Flutter and dart recommendations:
  # 
  #  Recommended in 2026-09:
  #  Use aur/flutter-bin (https://aur.archlinux.org/packages/flutter-bin) or chaotic-aur/flutter-bin (https://aur.chaotic.cx/ | https://aur.chaotic.cx/stats/search?search=flutter-bin | https://builds.garudalinux.org/repos/chaotic-aur/x86_64/#:~:text=flutter-bin).
  # 
  #  Recommended in beginning of 2026:
  #  Use 'arch4edu' repository (https://wiki.archlinux.org/title/Unofficial_user_repositories#arch4edu).
  #  This later errored out with "Wrong full snapshot version, expected '0451907c2eaa8467e848c0067bfe8ed4' found '78da37fed6bf1489361a312568249f3f'" or so.
  'flutter-tool'         # >=3.41. # Should be a versioned dependency, but not specifying now since `flutter-bin` does not has a versioned provides entry as of 2026-09-05, see https://aur.archlinux.org/packages/flutter-bin#comment-1084386.
  'dart'                 # >=3.11. # Should be a versioned dependency, but not specifying now since `flutter-bin` does not has a versioned provides entry as of 2026-09-05, see https://aur.archlinux.org/packages/flutter-bin#comment-1084386.
  # the Flutter linux files
  'flutter-target-linux' # >=3.41. # Should be a versioned dependency, but not specifying now since `flutter-bin` does not has a versioned provides entry as of 2026-09-05, see https://aur.archlinux.org/packages/flutter-bin#comment-1084386.

  # dependency libraries
  'glib2'
  'gtk3'
  'libgcc'
  'at-spi2-core'
  'fontconfig'
  'libstdc++'
  'cairo'
  'libepoxy'
  'pango'

  ## To reduce the size of PNG images
  #'parallel'
  #'zopfli'
)
optdepends=(
  'hicolor-icon-theme: For hicolor theme hierarchy.'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)

source=(
  "${_pkgname}::git+https://${_githost}/${_gituser}/${_gitname}.git"
  "flserial_once_flag_fix.patch::https://github.com/MeshEnvy/flserial/pull/1.patch"
  "${_pkgname}.desktop"
)
sha256sums=(
  'SKIP'                                                              # Main 'meshcore-open' source.
  '0a870e4ca333c53457948cdc6cf31597f090a8291209314c9ac74660d8d8dc08' # 'flserial_once_flag_fix.patch'
  '693903df45168de884191be566334fad4c5bd829b36f7e6c33440cf2efa79c5a'  # '.desktop' file.
)

case "${CARCH}" in
  "i686")
    export _dartarch="x86"
  ;;
  "x86_64")
    export _dartarch="x64"
  ;;
  "aarch64")
    export _dartarch="arm64"
  ;;
  *)
    error "Architecture '$CARCH' not supported."
    false
  ;;
esac

prepare() {
  cd "${srcdir}/${_pkgname}"
  export PUB_CACHE="${srcdir}/.pub_cache"

  git log > "${srcdir}/git.log"

  printf '%s\n' " --> downloading flutter/ dart dependencies ..."
  flutter -v --disable-analytics
  flutter -v pub get # --enforce-lockfile

  # Patch this after downloading flutter dependencies -- since it patches a dependency:
  local _patch='flserial_once_flag_fix.patch'
  printf '%s\n' " --> Applying patch '${_patch}' ..."
  patch -Np1 --follow-symlinks -i "${srcdir}/${_patch}" -d "${PUB_CACHE}/git"/flserial-[0-9a-f]*

  #printf '%s\n' " --> size-optimising PNG images ..."
  #find -name '*.png' -type f | parallel -j "${_nproc}" zopflipng -m -y {} {}
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  #_ver="$(grep -E '^[[:space:]]*version[[:space:]]*=' pyproject.toml  | head -n1 | awk -F= '{print $2}' | tr -d \'\"[[:space:]])"
  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+' | awk '{ print tolower($0) }')"
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
  cd "${srcdir}/${_pkgname}"
  export PUB_CACHE="${srcdir}/.pub_cache"

  printf '%s\n' " --> building ..."

  # build in release mode without running pub
  flutter -v build linux --no-pub --release
}

check() {
  cd "${srcdir}/${_pkgname}"
  export PUB_CACHE="${srcdir}/.pub_cache"

  printf '%s\n' " --> testing ..."

  flutter -v test
}

package() {
  cd "${srcdir}/${_pkgname}"
  export PUB_CACHE="${srcdir}/.pub_cache"

  printf '%s\n' " --> installing ..."

  # enter the output directory of the Flutter build
  cd "build/linux/${_dartarch}/release"
  cmake . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr/lib/${_pkgname}
  # install the Flutter project using cmake
  cmake -P cmake_install.cmake

  # link executable into PATH
  install -dvm755 "${pkgdir}/usr/bin"
  ln -sv "/usr/lib/${_pkgname}/meshcore_open" "${pkgdir}/usr/bin/meshcore_open"
  cd "${pkgdir}/usr/bin"
  ln -sv meshcore_open meshcore-open


  printf '%s\n' " --> installing icon and desktop file ..."

  cd "${srcdir}/${_pkgname}"
  install -Dvm644  assets/images/mesh-icon.png    "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${_pkgname}.png"
  install -dvm755  "${pkgdir}/usr/share/pixmaps"
  ln -sv "/usr/share/icons/hicolor/1024x1024/apps/${_pkgname}.png"  "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dvm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  _docfiles=(
    "${srcdir}/git.log"
    AGENTS.md
    README.md
    CLAUDE.md
    TESTFLIGHT_GUIDE.md
  )
  _docdirs=(
    assets
    docs
  )
  _manfiles=()
  _infofiles=()
  _licensefiles=(
    LICENSE
  )
  printf '%s\n' " --> installing documentation ..."
  for _docfile in "${_docfiles[@]}"; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done
  for _docdir in "${_docdirs[@]}"; do
    cp -rv "${_docdir}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docdir}")"
  done
  for _manfile in "${_manfiles[@]}"; do
    _section="$(basename "${_manfile}" .gz | sed -E -e 's|^.*\.([^.]*)$|\1|')"
    install -D -v -m644 "docs/build/man/${_manfile}" "${pkgdir}/usr/share/man/man${_section}/$(basename "${_manfile}")"
  done
  for _infofile in "${_infofiles[@]}"; do
    install -D -v -m644 "${_infofile}" "${pkgdir}/usr/share/info/$(basename "${_infofile}")"
  done
  printf '%s\n' " --> installing license ..."
  for _licensefile in "${_licensefiles[@]}"; do
    install -D -v -m644 "${_licensefile[@]}" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_licensefile}")"
  done
}

# vim: set sw=2 ts=2 et:
