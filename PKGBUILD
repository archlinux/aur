# Maintainer: watasuke <watasuke102@gmail.com>
_pkgname=openplc-editor
pkgname="${_pkgname}-git"
pkgver=r184.f772039
pkgrel=2
pkgdesc="OpenPLC editor"
arch=("x86_64")
url="https://github.com/thiagoralves/OpenPLC_Editor"
source=("git+${url}.git")
license=("GPL3")
md5sums=("SKIP")
makedepends=("git")
depends=("python38")

pkgver() {
  cd "${srcdir}/OpenPLC_Editor"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/OpenPLC_Editor"
  cd matiec
  autoreconf -i
  ./configure --prefix="${pkgdir}" CXXFLAGS="-std=c++03"
  make -s
  cp ./iec2c ../editor/arduino/bin/
}

prepare() {
  mkdir -p "${srcdir}/OpenPLC_Editor/.venv"
  python3.8 -m venv "${srcdir}/OpenPLC_Editor/.venv"
  "${srcdir}/OpenPLC_Editor/.venv/bin/python" -m pip install --upgrade pip
  "${srcdir}/OpenPLC_Editor/.venv/bin/python" -m pip install wheel jinja2 lxml==4.6.2 future matplotlib zeroconf pyserial pypubsub pyro5 attrdict3
  "${srcdir}/OpenPLC_Editor/.venv/bin/python" -m pip install wxPython==4.2.0

  echo -e "[Desktop Entry]\n\
Name=OpenPLC Editor\n\
Categories=Development;\n\
Exec=\"/opt/OpenPLC_Editor/openplc_editor.sh\"\n\
Icon=/opt/OpenPLC_Editor/editor/images/brz.png\n\
Type=Application\n\
Terminal=false" > OpenPLC_Editor.desktop

  cd "${srcdir}/OpenPLC_Editor"
  echo -e "#!/bin/bash\n\
cd \"/opt/OpenPLC_Editor\"\n\
./.venv/bin/python3 ./editor/Beremiz.py" > openplc_editor.sh
  chmod +x openplc_editor.sh
}

package() {
  install -dm755 "$pkgdir/opt"
  cp -r "${srcdir}/OpenPLC_Editor" "$pkgdir/opt/OpenPLC_Editor"
  install -Dm644 "OpenPLC_Editor.desktop" "${pkgdir}/usr/share/applications/OpenPLC_Editor.desktop"
}

