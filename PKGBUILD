# Maintainer: italoghost <eduprodive at posteo dot me>
pkgname=rpcs3-latest-bin
_pkgname=rpcs3
_url="$(curl -s "https://api.github.com/repos/RPCS3/rpcs3-binaries-linux/releases/latest" | awk -F'"' '/browser_download_url.*rpcs3.*AppImage/ {print $4}')"
_build="$(echo $_url | awk -F '[-/]' '{print $11}')"
_pkgver="$(echo $_url | awk -F '[-_]' -v OFS='-' '{gsub("v", "", $5); print $5,$6,$7}')"
pkgver="$(echo $_url | awk -F '[-_]' -v OFS='.' '{gsub("v", "", $5); print $5,$6}')"
pkgrel=1
pkgdesc='Open-source Sony PlayStation 3 Emulator'
arch=('x86_64')
url='https://rpcs3.net/'
license=('GPL2')
options=('!strip')
replaces=("$_pkgname")
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
_appimage="rpcs3-v${_pkgver}_linux64.AppImage"
source=("https://github.com/RPCS3/rpcs3-binaries-linux/releases/download/build-${_build}/${_appimage}")
noextract=("${_appimage}")
sha256sums=('SKIP')

build() {
  # extract appimage
  cd "${srcdir}"
  chmod +x "${_appimage}"
  ./"${_appimage}" --appimage-extract
  
  # update script
  sed -i "s|this_dir=\"\$(readlink -f \"\$(dirname \"\$0\")\")\"|this_dir=\"/opt/rpcs3\"|" "$srcdir/squashfs-root/AppRun"
}

package() {
  # main files
  install -dm755 "$pkgdir/opt/${_pkgname}"
  mv "$srcdir"/squashfs-root/* "$pkgdir/opt/${_pkgname}"

  # script
  install -dm755 "$pkgdir/usr/bin"
  ln -sf "/opt/${_pkgname}/AppRun" "$pkgdir/usr/bin/${_pkgname}"

  # icon
  install -Dm644 "$pkgdir/opt/${_pkgname}/${_pkgname}.svg" -t "$pkgdir/usr/share/pixmaps"

  # launcher
  install -Dm644 "$pkgdir/opt/${_pkgname}/${_pkgname}.desktop" -t "$pkgdir/usr/share/applications"

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}