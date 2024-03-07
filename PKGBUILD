# Developer: Uppaal Team <uppaal@cs.aau.dk>
# Maintainer: Falke Carlsen "falkecarlsen" <falkeboc@cs.aau.dk>

pkgname=uppaal
pkgver=5.0.0
pkgrel=3
pkgdesc="Verify timed automata models and learn strategies."
arch=('any')
options=(debug !strip)
url="https://uppaal.org/"
license=('custom')
depends=('jre17-openjdk' 'xdg-utils')
makedepends=('unzip')
provides=("${pkgname}-${pkgver}")
_relname="${pkgname}-${pkgver}-linux64"
_zipname="${_relname}.zip"
source=("https://download.uppaal.org/uppaal-5.0/uppaal-${pkgver}/uppaal-${pkgver}-linux64.zip")
noextract=("${_zipname}")
sha512sums=('e7fceddd699ebbe1a0120209bbe59fe7ef61b0c3b671bc453028e46e68310c3e96e3c5be7d9aec8cd5c85d065b3a4c7d6f9c68e7e5578d410efec7a6d9407543')

build() {
  # determine x11 or wayland (upstreamed, remove once 5.1.0 is released)
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
GenericName=Model Checker ${pkgver}
Name=UPPAAL ${pkgver}
Comment=Verify timed automata models and learn strategies
Exec=${prefix}/usr/bin/${pkgname} %u
Icon=uppaal-icon
Categories=Application;Science;Math;Education;Development;IDE
Terminal=false
StartupNotify=true
MimeType=application/uppaal-xml;application/uppaal-xta;application/vnd.uppaal-xml;application/vnd.uppaal-xta;application/x-uppaal-xml;application/x-uppaal-xta
EOD
}

package() {
  # get newest available stable semver 
  latest=$(curl -s https://versioncheck.uppaal.org/version.txt | grep -o '"version": "[^"]*' | grep -o '[^"]*$')

  # check if latest is newer than $pkgver
  if [[ "$(echo -e "$latest\n$pkgver" | sort -V | tail -n 1)" == "$latest" ]]; then
    echo "Packaging newest stable release: uppaal-$latest"
  else
    echo "Newer release available but not yet packaged ($latest > $pkgver). Visit uppaal.org for manual installation instructions if urgent."
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
    install -Dm644 "${pkgloc}/res/icon-"$s"x"$s".png" "${pkgdir}/usr/share/icons/hicolor/"$s"x"$s"/apps/uppaal-icon.png" 
  done

  # install mime type definitions
  mimetype_dir="${pkgdir}"/usr/share/mime/packages
  install -dm755 $mimetype_dir
  for xml_mimetype_file in "${pkgloc}"/res/*-mimetype.xml; do
    if [ -f "$xml_mimetype_file" ]; then
        install -Dm644 "$xml_mimetype_file" "$mimetype_dir/$(basename "$xml_mimetype_file")"
    fi
  done

  # symlink startup script to bin 
  ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
