# Maintainer: dreieck

_gitname="freetz-ng"
_pkgname='fritzbox-push-firmware'
pkgname="${_pkgname}-git"
pkgver=ng25030+1112.r26142.20250907.73de17a28
pkgrel=1
pkgdesc="Pushes firmware files to AVM Fritz!Box routers via their bootloader FTP interface. Tool taken from the \"Freetz-NG\" project."
arch=(
  'i486'
  'i586'
  'i686'
  'x86_64'
  'aarch64'
  'armv6h'
  'armv7h'
  'riscv'
  'riscv64'
)
url="https://github.com/Freetz-NG/freetz-ng/tools"
license=('GPL-2.0-or-later')
groups=()
depends=(
  'bash'
  'coreutils'  # for 'basename', 'cat', 'chmod', 'dd', 'echo', 'mktemp', 'mv', 'realpath', 'rm', 'stat', 'uname', '['.
  'dos2unix'
  'dtc'        # for 'fdtdump'
  'glibc'
  'grep'
  'inetutils'  # for 'ftp', 'telnet'.
  'iproute2'   # for 'ip'
  'iputils'    # for 'ping'.
  'sed'
  'tar'
  'util-linux' # for 'hexdump'.
)
makedepends=(
  'git'
  'freetz-ng-devel'
  #'ccache'  # As of 2024-07-25, this is not part of the dependency list of 'freetz-ng-devel', but needed. See https://aur.archlinux.org/packages/freetz-ng-devel#comment-983800.
  #'glib2-devel'  # As of 2024-07-25, this is not part of the dependency list of 'freetz-ng-devel', but needed. See https://aur.archlinux.org/packages/freetz-ng-devel#comment-983799.
)
optdepends=(
  "ncftp: For alternative (more elaborate??) FTP client over inetutils' 'ftp'."
  "net-tools: To use 'ifconfig' instead of 'ip'."
)
provides=(
  "${_pkgname}=${pkgver}"
  "tichksum-git=${pkgver}"
  "tichksum=${pkgver}"
  "uimg-git"
  "uimg"
)
conflicts=(
  "${_pkgname}"
  "tichksum"
  "uimg"
)
replaces=()
backup=()
source=(
  "${_gitname}::git+https://github.com/Freetz-NG/freetz-ng.git"
  "make_paths_archconforming.patch"
)
sha256sums=(
  'SKIP'
  '1ec8eda0be68931d10134e5071f97407c48a5ed1632c8da11e94718ebc1bb9ba'
)

prepare() {
  cd "${srcdir}/${_gitname}"

  for _patch in 'make_paths_archconforming.patch'; do
    printf '%s\n' "  --> Applying patch '${_patch}' ..."
    patch -N -p1 --follow-symlinks -i "${srcdir}/${_patch}"
  done

  mkdir -pv "${SRCDEST}/freetz-dl"
  if [ -e dl ]; then
    rm -Rf dl
  fi
  ln -sv "${SRCDEST}/freetz-dl" dl # manually make download directory to force download into specified location. Otherwise, a symlink dl -> ~/.freetz-dl will be created, cluttering the build user's home directory.
}

pkgver() {
  cd "${srcdir}/${_gitname}"

  _ver="$(git describe --tags | sed 's|^[vV]||' | sed 's|-[^-]*$||' | tr '-' '+')"
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
  cd "${srcdir}/${_gitname}"

  ### TODO: Unfortunately, those 'make' calls download source. It seems not easy to do the download-only step separately in 'prepare()' or the 'source' array.

  #make tools-push_firmware  ## Use the other three builds only what is really required.
  make tichksum-host  # builds tools/tichksum
  make uimg-host      # builds tools/uimg
  # make dtc-host       # builds tools/fit/fdtdump  # Provided by dependency 'dtc'.
}

package() {
  cd "${srcdir}/${_gitname}"

  install -Dvm755 -t "${pkgdir}/usr/bin"             "tools"/{push_firmware,tichksum,uimg}

  install -Dvm644 -t "${pkgdir}/usr/share/licenses"  "COPYING"
}
