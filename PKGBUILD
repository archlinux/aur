# Maintainer: George Snyder <snydergd91@gmail.com>

pkgname=nextpvr-bin
pkgver=7.0.1
pkgrel=1
pkgdesc="NextPVR binary distribution"
arch=('arm64' 'arm32' 'x86_64')
url="https://forums.nextpvr.com/forumdisplay.php?fid=18"
license=('custom:commercial')
depends=(
	# detected by namcap
	'lib32-gcc-libs' 'lib32-systemd' 'lib32-glibc' 'curl' 'glib2' 'gcc-libs' 'systemd-libs' 'libzen' 'libmms' 'zlib' 'fontconfig'
	# From install instructions
	'mediainfo' 'libmediainfo' 'glibc' 'libgdiplus' 'v4l-utils' 'dtv-scan-tables' 'ffmpeg' 'dotnet-host'
	# Discovered while trying to run
	'aspnet-runtime-6.0' 'dotnet-runtime-6.0')
makedepends=('coreutils')
provides=('nextpvr')
conflicts=('nextpvr')
source=("${pkgname}-${pkgver}.zip::https://github.com/sub3/releases/releases/download/${pkgver}/NPVR-${pkgver}.zip" "launch.sh" "nextpvr.service")
sha256sums=('c6ce27fa79bb0466a7a11248b08901193f7f7733e4dd091ebe521c9934e67d5c' 'SKIP' 'SKIP')

prepare() {
    chmod 755 "${srcdir}/DeviceHost/x64/DeviceHostLinux"
    chmod 755 "${srcdir}/DeviceHost/arm32/DeviceHostLinux"
    chmod 755 "${srcdir}/DeviceHost/arm64/DeviceHostLinux"
}

package() {
    # Vendor files
    mkdir -p "${pkgdir}/opt"
    cp -ar "${srcdir}" "${pkgdir}/opt/nextpvr"
    rm "${pkgdir}/opt/nextpvr/${pkgname}-${pkgver}.zip"

    # Clean up some incompatible binaries
    msg2 "Removing incompatible binaries"
    local F;
    local BINBASE;
    BINBASE="${pkgdir}/opt/nextpvr/DeviceHost";
    for F in $(ls "${BINBASE}"); do
      if [ "${F}" != "${CARCH}" ]; then
        rm -rf "${BINBASE}/${F}";
      fi;
    done;

    BINBASE="${pkgdir}/opt/nextpvr/runtimes";
    for F in $(ls "${BINBASE}"); do
      local SUFFIX;
      case "${CARCH}" in
        x86_64)
          SUFFIX=x64;
          ;;
        arm32)
          SUFFIX=arm;
          ;;
        *)
          SUFFIX="${CARCH}";
      esac;
      case "${F}" in
        *$SUFFIX)
          ;;
        *)
          rm -rf "${BINBASE}/${F}";
          ;;
      esac;
    done;

    # Rename DVB-T files with unicode in them, since makepkg uses LANG=C for bsdtar
    # meaning unicode names are not supported
    msg2 "Renaming unicode files for compatibility"
    local oldpath;
    local dir;
    local F;
    local newpath;
    find "${pkgdir}/opt/nextpvr/data/tuning/DVB-T" -depth | while IFS= read -r oldpath; do
      # Extract directory and base name
      dir="$(dirname "${oldpath}")"
      F="$(basename "$oldpath")"

      # Skip ASCII-only names
      if LC_ALL=C grep -q '[^ -~]' <<< "${F}"; then
        # Transliterate to ASCII
        newpath="$(echo -n "${F}" | iconv -f UTF-8 -t ASCII//TRANSLIT)"

        # Sanitize (just in case transliteration makes it empty or dangerous)
        [ -z "$newpath" ] || [ "$newpath" == "."  ] || [ "$newpath" == ".." ] && continue

        newpath="$dir/$newpath"

        # Avoid overwrite
        if [[ -e "$newpath" ]]; then
          continue
        fi

        mv "$oldpath" "$newpath"
      fi
    done


    # Launch script
    rm "${pkgdir}/opt/nextpvr/launch.sh"
    install -m755 -D "${srcdir}/launch.sh" "${pkgdir}/usr/bin/nextpvr"

    # Systemd service
    rm "${pkgdir}/opt/nextpvr/nextpvr.service"
    install -D "${srcdir}/nextpvr.service" "${pkgdir}/etc/systemd/user/nextpvr.service"
}
