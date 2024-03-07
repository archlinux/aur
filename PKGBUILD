# Developer: Uppaal Team <uppaal@cs.aau.dk>
# Maintainer: Falke Carlsen "falkecarlsen" <falkeboc@cs.aau.dk>

pkgname=uppaal-beta
pkgver=5.1.0_beta5
_pkgver_base=$(echo ${pkgver} | cut -d'_' -f1)
_pkgver_dash=$(echo ${pkgver} | sed 's/_/-/g')
pkgrel=2
pkgdesc="Verify timed automata models and learn strategies. Beta release channel."
arch=('any')
options=(debug !strip)
url="https://uppaal.org/"
license=('custom')
depends=('jre17-openjdk' 'xdg-utils')
makedepends=('unzip')
provides=("${pkgname}-${pkgver_dash}")
_relname="uppaal-${_pkgver_dash}-linux64"
_zipname="${_relname}.zip"
source=("https://download.uppaal.org/uppaal-5.1/uppaal-${_pkgver_base}/uppaal-${_pkgver_dash}-linux64.zip")
noextract=("${_zipname}")
sha512sums=('7699aedaf05829649cbf90ae690e71d4fc0b727a97babcaa2b1b3e29d641d62ae16b91fce33b82a46ee21a0514d824151b5c367b6c31151de27ad5d8e428ec03')

build() {
  # determine x11 or wayland (upstreamed, remove once next beta is released)
  if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    # add env vars for wayland fixes
    prefix="env _JAVA_AWT_WM_NONREPARENTING=1 "
  else
    prefix=""
  fi

  cat << EOD > "${pkgname}.desktop"
[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
GenericName=Model Checker ${_pkgver_dash}
Name=UPPAAL ${_pkgver_dash}
Comment=Verify timed automata models and learn strategies. Beta release channel.
Exec=${prefix}/usr/bin/${pkgname} %u
Icon=${pkgname}-icon
Categories=Application;Science;Math;Education;Development;IDE
Terminal=false
StartupNotify=true
MimeType=application/uppaal-xml;application/uppaal-xta;application/vnd.uppaal-xml;application/vnd.uppaal-xta;application/x-uppaal-xml;application/x-uppaal-xta
EOD
}

package() {
  # get newest available stable semver 
  latest=$(curl -s https://versioncheck.uppaal.org/version-beta.txt | grep -o '"version": "[^"]*' | grep -o '[^"]*$')

  # check if latest is newer than $pkgver
  if [[ "$(echo -e "$latest\n$_pkgver_dash" | sort -V | tail -n 1)" == "$latest" ]]; then
    echo "Packaging newest beta release: uppaal-$latest"
  else
    echo "Newer beta release available but not yet packaged ($latest > $pkgver). Visit uppaal.org for manual installation instructions if urgent."
  fi

  install -dm755 "${pkgdir}"/opt/
  install -dm755 "${pkgdir}"/usr/bin/
  install -dm755 "${pkgdir}"/usr/share/icons/hicolor/

  pkgloc="${pkgdir}/opt/${pkgname}"

  # unpack and move out of release top-level dir (_relname)
  unzip -qd "${pkgdir}/opt/" "${srcdir}/${_zipname}"
  mv "${pkgdir}/opt/${_relname}" "${pkgloc}"
 
  # install built desktop entry
  launcher_path="${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}.desktop" ${launcher_path}
  
  # install icons
  for s in 16 24 32 48 64 96 128 ; do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/"$s"x"$s""
    install -Dm644 "${pkgloc}/res/icon-"$s"x"$s".png" "${pkgdir}/usr/share/icons/hicolor/"$s"x"$s"/apps/${pkgname}-icon.png" 
  done

  # install mime type definitions
  mimetype_dir="${pkgdir}"/usr/share/mime/packages
  install -dm755 $mimetype_dir
  for xml_mimetype_file in "${pkgloc}"/res/*-mimetype.xml; do
    if [ -f "$xml_mimetype_file" ]; then
       install -Dm644 "$xml_mimetype_file" "$mimetype_dir/$(basename "$xml_mimetype_file" | sed "s/uppaal/${pkgname}/")"
    fi
  done

  # symlink startup script to bin 
  ln -s "/opt/${pkgname}/uppaal" "${pkgdir}/usr/bin/${pkgname}"
}
