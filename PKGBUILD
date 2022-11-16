# Maintainer: Curve <curve.platin at gmail.com>
pkgname=olive-nightly-bin
_pkgname=olive

pkgver=0.2.0_433645162
pkgrel=3

license=('GPL3')
pkgdesc="Free non-linear video editor"
url="https://www.olivevideoeditor.org/"

provides=("olive")
conflicts=("olive")

arch=('x86_64')
options+=('!strip')
makedepends=(unzip patchelf findutils)
depends=('openexr' 'ffmpeg' 'openimageio' 'opencolorio' 'portaudio' 'qt5-base' 'opentimelineio')

source=(
  Olive_$pkgver.AppImage.zip::$(curl --request POST --url https://www.olivevideoeditor.org/ghret.php --header 'Content-Type: multipart/form-data' --form id=$(echo "$pkgver" | grep -o -E "_[[:digit:]]+" | grep -o -E "[[:digit:]]+"))
  'olive-editor'
)

sha256sums=(
  'SKIP'
  '2c2d00be80ce1495e9c2ece8be3aae05fe41d7e052420bf04f737419306b014b'
)

pkgver() {
  echo "0.2.0_$( curl "https://olivevideoeditor.org/nightly.php" | grep -o -a -E "<a[^h]+href='go.php\?id=([[:digit:]]+)'[^>]+>Download</a>" | head -1 | grep -o -E "[[:digit:]]+" )"
}

prepare() {
  chmod +x Olive*-x86_64.AppImage
  ./Olive*-x86_64.AppImage --appimage-extract
}

# RED='\033[0;31m'
# GREY='\033[0;90m'
# YELLOW='\033[0;33m'
# RESET='\033[0m'

# check_dependencies() {
#   local pkgdir="$1"
#   local srcdir="$2"
#   local binary="$3"
#
#   local unment_deps=($(ldd "$binary" | grep "not found"))
#
#   for dependency in "${unment_deps[@]}"; do
#     if [[ "$dependency" == *".so"* ]]; then
#       echo -e "${YELLOW}Unmet Dependency:${RESET} $dependency"
#       local replacement=$(find . -name "$dependency")
#
#       if [[ $replacement ]]; then
#         echo -e "${GREY}Replacement: $replacement${RESET}"
#         install -m755 "${srcdir}/$replacement" "${pkgdir}/opt/${_pkgname}/"
#         check_dependencies "$1" "$2" "${pkgdir}/opt/${_pkgname}/$(basename "$replacement")"
#       else
#         echo -e "${RED}ERROR: ${RESET}Failed to find replacement for $dependency"
#       fi
#     fi
#   done
# }

package() {
  # Missing Directories

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt/${_pkgname}"
  install -d "${pkgdir}/opt/${_pkgname}/libs"
  install -d "${pkgdir}/usr/share/applications"

  # Binaries

  install -m755 "olive-editor" "${pkgdir}/usr/bin/"
  install -m755 "${srcdir}/squashfs-root/usr/bin/"${_pkgname}-editor "${pkgdir}/opt/${_pkgname}/"
  install -m755 "${srcdir}/squashfs-root/usr/bin/"${_pkgname}-crashhandler "${pkgdir}/opt/${_pkgname}/"

  # Desktop File

  install -m644 "${srcdir}/squashfs-root/org.olivevideoeditor.Olive.desktop" "${pkgdir}/usr/share/applications/"

  # Other files

  chmod -R 755 "${srcdir}/squashfs-root/usr/share"
  cp -p -r "${srcdir}/squashfs-root/usr/share" "${pkgdir}/usr/"

  # Check if workaround is required
  # > There are some dependencies that are older than what is supplied through the repositories

  # check_dependencies "$pkgdir" "$srcdir" "${pkgdir}/opt/${_pkgname}/${_pkgname}-editor"

  # Copy all shared libraries
  # > The previous workaround which just copied the umnet libraries will fail due to not being able to ensure all required symbols are present.

  local libraries=($(find . -type f \( -name '*.so*' ! -iname '*qt*' \)))

  for file in "${libraries[@]}"; do
    install -m755 "${srcdir}/${file}" "${pkgdir}/opt/${_pkgname}/libs"
  done
}
