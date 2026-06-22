# Maintainer: uberben <ben at benbergman dot ca>

pkgname="orca-slicer-nightly-bin"
pkgver=2026.06.21.182501Z
pkgrel=1
pkgdesc="G-code generator for 3D printers (nightly builds)"
arch=('x86_64' 'aarch64')
url="https://github.com/SoftFever/OrcaSlicer"
license=('AGPL3')
depends=('mesa' 'glu' 'cairo' 'gtk3' 'libsoup' 'webkit2gtk-4.1' 'gstreamer' 'openvdb' 'wayland' 'wayland-protocols' 'libxkbcommon' 'gst-plugins-base' 'gst-libav')
makedepends=('jq' 'curl')
provides=("orca-slicer")
conflicts=("orca-slicer")
options=('!strip')

_meta_file=assets_meta.json

_verify_digest() {
  local meta_data="$1"
  local appimage_url
  appimage_url=$(jq --raw-output '.url' <<< "${meta_data}")
  local filename
  filename=$(basename "${appimage_url}")
  if [[ ! -f "${filename}" ]]; then
    return 1
  fi

  local digest
  digest=$(jq --raw-output '.digest' <<< "${meta_data}")
  if [[ -n "${digest}" ]]; then
    msg2 "Verifying checksum..."
    local digest_type
    digest_type=${digest%%:*}
    if [[ "${digest_type}" == "sha256" ]]; then
      local expected_checksum
      expected_checksum=${digest#*:}
      local actual_checksum
      actual_checksum=$(sha256sum "${filename}" | awk '{print $1}')
      if [[ "${actual_checksum}" != "${expected_checksum}" ]]; then
        msg2 "Checksum verification failed: expected ${expected_checksum}, got ${actual_checksum}"
        return 1
      fi
      return 0
    else
      echo "Unsupported digest type: ${digest_type}"
      return 1
    fi
  fi
  return 1
}

verify() {
  local appimage
  [ "$CARCH" = "aarch64" ] && \
    appimage=OrcaSlicer_Linux_AppImage_Ubuntu2404_aarch64_nightly.AppImage || \
    appimage=OrcaSlicer_Linux_AppImage_Ubuntu2404_nightly.AppImage
  msg2 "Fetching latest nightly AppImage URL..."
  local meta_data
  meta_data=$(curl -fsL \
    -H "Accept: application/vnd.github+json" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    https://api.github.com/repos/SoftFever/OrcaSlicer/releases/tags/nightly-builds \
    | jq -rc '.assets | map({ name: .name, date: .created_at, digest: .digest, url: .browser_download_url }) | map(select(.name | test("'"$appimage"'")))[0]')
  if [[ -z "${meta_data}" || "${meta_data}" == "null" ]]; then
    echo "Failed to fetch AppImage metadata from GitHub API"
    return 1
  fi

  if [[ -f "$_meta_file" ]]; then
    if [[ "${meta_data}" == "$(< "$_meta_file")" ]] && _verify_digest "$meta_data" ; then
      msg2 "AppImage metadata has not changed since the last build, skipping download and checksum verification."
      return 0
    fi
  fi
  rm -f "$_meta_file"

  # verify the digest before downloading the file to avoid unnecessary downloads if the file has not changed
  _verify_digest "${meta_data}" 2>/dev/null || {
    appimage_url=$(jq --raw-output '.url' <<< "${meta_data}")
    local filename
    filename=$(basename "${appimage_url}")
    msg2 "Downloading ${filename}..."
    curl -fL "${appimage_url}" -o "${filename}"
    chmod +x "${filename}"
  }

  _verify_digest "${meta_data}"

  echo "${meta_data}" > "$_meta_file"
}

prepare() {
  appimage_url=$(jq --raw-output '.url' "$startdir/$_meta_file")
  filename=$(basename "${appimage_url}")
  msg2 "Extracting AppImage..."
  "$startdir/${filename}" --appimage-extract

  sed -i 's|Exec=AppRun|Exec=/opt/orca-slicer-nightly/bin/orca-slicer|g' \
    "squashfs-root/com.orcaslicer.OrcaSlicer.desktop"
}

pkgver() {
  jq -r '.date' "$startdir/$_meta_file" | sed 's/[-T]/./g; s/://g'
}

package() {
	find squashfs-root/{resources,usr/share/icons}/ -type d -exec chmod 755 {} +

	install -d "$pkgdir/opt/${pkgname%-bin}/"
	cp -av squashfs-root/* "$pkgdir/opt/${pkgname%-bin}/"
	rm -rf "$pkgdir/opt/${pkgname%-bin}/usr/"
	rm "$pkgdir/opt/${pkgname%-bin}"/{com.orcaslicer.OrcaSlicer.desktop,AppRun,OrcaSlicer.png}

	install -d "$pkgdir/usr/bin"
	ln -s "/opt/${pkgname%-bin}/bin/orca-slicer" "$pkgdir/usr/bin/"

	install -Dm644 "squashfs-root/com.orcaslicer.OrcaSlicer.desktop" -t \
		"$pkgdir/usr/share/applications/"

	install -d "$pkgdir/usr/share/icons/"
	cp -r squashfs-root/usr/share/icons/hicolor/ "$pkgdir/usr/share/icons/"
}

