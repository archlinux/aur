# Maintainer: Augusto Poletti <augusto.poletti@gmail.com>
_pkgname=slopsmith-desktop
pkgname=slopsmith-desktop-git
pkgver=r96.c1ea45e
pkgrel=1
pkgdesc="Standalone desktop app for Slopsmith with VST/NAM support and Audio I/O"
arch=('x86_64')
url="https://github.com/byrongamatos/slopsmith-desktop"
license=('AGPL3')
depends=('nodejs' 'alsa-lib' 'jack' 'nss' 'libxss' 'gtk3' 'python' 'ffmpeg' 'vgmstream-cli-bin')
makedepends=('git' 'npm' 'cmake' 'dotnet-sdk' 'python-pip')
provides=("$_pkgname")
conflicts=("$_pkgname" "slopsmith-git" "slopsmith")
source=("$_pkgname::git+$url.git"
        "slopsmith::git+https://github.com/byrongamatos/slopsmith.git"
        "Rocksmith2014.NET::git+https://github.com/iminashi/Rocksmith2014.NET.git")
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir/slopsmith"
  sed -i 's|\.\./\.\./src|\.\./\.\./Rocksmith2014.NET/src|g' rscli/*.fsproj 2>/dev/null || true
  sed -i 's|\.\.\\\.\.\\src|\.\.\\\.\.\\Rocksmith2014.NET\\src|g' rscli/*.fsproj 2>/dev/null || true

  cd "$srcdir/$_pkgname"
  git submodule update --init --recursive
  npm install
}

build() {
  cd "$srcdir/slopsmith/rscli"
  dotnet publish -c Release --self-contained -r linux-x64 -o ../dist/rscli

  cd "$srcdir/$_pkgname"
  msg2 "A baixar bibliotecas Python (Vendor)..."
  mkdir -p build-python-libs
  python -m pip install --target="build-python-libs" -r "$srcdir/slopsmith/requirements.txt"

  msg2 "A estruturar a pasta resources para o Electron Builder..."
  mkdir -p resources/python/bin
  mkdir -p resources/python/site-packages
  mkdir -p resources/bin

  cp -r "$srcdir/slopsmith" resources/slopsmith
  cp -r build-python-libs/* resources/python/site-packages/

  # O Shim do Python com o PYTHONHOME definido e PYTHONPATH expandido com lib e src
  cat <<'EOF' > resources/python/bin/python3
#!/bin/sh
export PYTHONHOME=/usr
export PYTHONPATH="/opt/slopsmith-desktop/resources/python/site-packages:/opt/slopsmith-desktop/resources/slopsmith:/opt/slopsmith-desktop/resources/slopsmith/lib:/opt/slopsmith-desktop/resources/slopsmith/src"
exec /usr/bin/python3 "$@"
EOF
  chmod +x resources/python/bin/python3

  ln -sf /usr/bin/ffmpeg resources/bin/ffmpeg
  ln -sf /usr/bin/ffprobe resources/bin/ffprobe
  ln -sf /usr/bin/vgmstream-cli resources/bin/vgmstream-cli

  msg2 "A compilar Audio Engine (C++) e TypeScript..."
  npm run build:audio
  npm run build:ts

  msg2 "A empacotar Electron App..."
  npx electron-builder --linux dir
}

package() {
  cd "$srcdir/$_pkgname"
  _installdir="$pkgdir/opt/$_pkgname"
  install -d "$_installdir"

  cp -r release/linux-unpacked/* "$_installdir/"

  install -d "$pkgdir/usr/bin"
  ln -sf "/opt/$_pkgname/slopsmith-desktop" "$pkgdir/usr/bin/$_pkgname"

  install -d "$pkgdir/usr/share/applications"
  cat <<EOF > "$pkgdir/usr/share/applications/$_pkgname.desktop"
[Desktop Entry]
Name=Slopsmith Desktop
Exec=$_pkgname %U
Terminal=false
Type=Application
Icon=$_pkgname
StartupWMClass=slopsmith-desktop
Comment=Practice Rocksmith CDLC with VST/NAM support
Categories=AudioVideo;Audio;Music;
EOF

  _icon=$(find . -type f \( -name "icon.png" -o -path "*/icons/512x512.png" \) | head -n 1)
  if [ -n "$_icon" ]; then
    install -Dm644 "$_icon" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
  fi

  chmod +x "$_installdir/slopsmith-desktop"
}
