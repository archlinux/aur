# Maintainer: liblaf <30631553+liblaf@users.noreply.github.com>

pkgname=faceform-wrap
pkgver=2025.11.14
pkgrel=2
# Opaque path component of the versioned download URL; updated with pkgver.
_download_id=9f99598ca4cd3b373d0b26a450d9a47d
pkgdesc='Topology transfer tool that fits a base mesh to 3D scans'
arch=('x86_64')
url='https://faceform.com/wrap/'
license=('LicenseRef-Faceform-Wrap-EULA')
depends=(
  'alsa-lib'
  'dbus'
  'expat'
  'gcc-libs'
  'gdbm'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gmp'
  'graphite'
  'gst-plugins-base-libs'
  'krb5'
  'libasyncns'
  'libcap'
  'libdrm'
  'libglvnd'
  'libgpg-error'
  'libsm'
  'libtasn1'
  'libthai'
  'libxcrypt-compat'
  'libxfixes'
  'libxrender'
  'mesa'
  'orc'
  'p11-kit'
  'pixman'
  'systemd-libs'
  'util-linux-libs'
  'v4l-utils'
  'xz'
)
makedepends=('imagemagick' 'patchelf')
optdepends=('xdg-utils: open documentation links in a web browser')
# The vendor bundle ships its own Qt and Python; keep it as distributed.
options=('!strip' '!debug')
source=(
  "https://downloads.faceform.com/file/faceform/Wrap/${pkgver}/${_download_id}/Faceform_Wrap_${pkgver}_Linux.tar.xz"
  "${pkgname}.ico::https://docs.faceform.com/Wrap/_static/Wrap.ico"
  "${pkgname}.desktop"
)
sha256sums=('42402bf790adb1f8e39635da9772db1c7c5987bde7fbbc3413d2c1c29b64ed98'
            '15ff8592cec9b6169440a428ffe0603d26dc820ea88aaee0ba77a09fd397914e'
            'a75835cccf390623638be69309638966ce1a0317c0be9d3157882963b1e8af78')

prepare() {
  local file rpath entry kept
  local -a entries flags
  # Drop the vendor's build-machine library paths, keeping only $ORIGIN-relative ones.
  while IFS= read -r -d '' file; do
    [[ "$(head -c 4 "${file}")" == $'\x7fELF' ]] || continue
    rpath=$(patchelf --print-rpath "${file}")
    [[ -n "${rpath}" ]] || continue
    kept=
    IFS=: read -r -a entries <<< "${rpath}"
    for entry in "${entries[@]}"; do
      # shellcheck disable=SC2016
      [[ "${entry}" == '$ORIGIN'* || "${entry}" == '${ORIGIN}'* ]] && kept+="${kept:+:}${entry}"
    done
    [[ "${kept}" != "${rpath}" ]] || continue
    if [[ -z "${kept}" ]]; then
      patchelf --remove-rpath "${file}"
      continue
    fi
    # Keep DT_RPATH, which also applies to the bundled libraries' own dependencies.
    flags=()
    readelf -d "${file}" | grep -q '(RPATH)' && flags=(--force-rpath)
    patchelf "${flags[@]}" --set-rpath "${kept}" "${file}"
  done < <(find "Faceform_Wrap_${pkgver}_Linux" -type f -print0)
}

build() {
  magick "${pkgname}.ico[5]" "${pkgname}.png"
}

package() {
  install -d "${pkgdir}/usr/lib/${pkgname}"
  cp -a --no-preserve=ownership "Faceform_Wrap_${pkgver}_Linux/." "${pkgdir}/usr/lib/${pkgname}/"
  chmod -R u=rwX,go=rX "${pkgdir}/usr/lib/${pkgname}"

  # Replace the vendor launchers, keeping their documented names. The embedded
  # Python needs PYTHONHOME; the binaries already find bundled libraries through
  # their $ORIGIN RPATH, so LD_LIBRARY_PATH (which leaked into child processes
  # and included the working directory) is not set.
  local binary
  for binary in Wrap WrapCmd; do
    printf '#!/bin/sh\nexport PYTHONHOME=/usr/lib/%s\nexec /usr/lib/%s/%s "$@"\n' \
      "${pkgname}" "${pkgname}" "${binary}" > "${pkgdir}/usr/lib/${pkgname}/${binary}.sh"
    chmod 755 "${pkgdir}/usr/lib/${pkgname}/${binary}.sh"
  done
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/Wrap.sh" "${pkgdir}/usr/bin/${pkgname}"
  ln -s "/usr/lib/${pkgname}/WrapCmd.sh" "${pkgdir}/usr/bin/${pkgname}-cmd"

  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/lib/${pkgname}/Faceform Wrap EULA.html" "${pkgdir}/usr/share/licenses/${pkgname}/EULA.html"
}
