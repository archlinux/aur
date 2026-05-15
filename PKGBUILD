# Maintainer: Augusto Poletti <augusto.poletti@gmail.com>
_pkgname=slopsmith-desktop
pkgname=slopsmith-desktop-git
pkgver=r96.c1ea45e
pkgrel=11
pkgdesc="Standalone desktop app for Slopsmith with VST/NAM support and Audio I/O"
arch=('x86_64')
options=(!debug)
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
  msg2 "A corrigir caminhos das referências F#..."
  sed -i 's|\.\./\.\./src|\.\./\.\./Rocksmith2014.NET/src|g' rscli/*.fsproj 2>/dev/null || true

  # Garante a cópia das dependências para a pasta final
  sed -i '/<\/PropertyGroup>/i <CopyLocalLockFileAssemblies>true</CopyLocalLockFileAssemblies>' rscli/*.fsproj

  # ── O ANTÍDOTO DO FSHARP.CORE ──
  # Desativa o pacote antigo padrão do SDK do Arch e injeta a versão exigida pela conversão
  sed -i '/<\/PropertyGroup>/i <DisableImplicitFSharpCoreReference>true</DisableImplicitFSharpCoreReference>' rscli/*.fsproj
  sed -i '/<\/Project>/i <ItemGroup><PackageReference Include="FSharp.Core" Version="10.1.300" /></ItemGroup>' rscli/*.fsproj

  cd "$srcdir/$_pkgname"
  git submodule update --init --recursive
  npm install
}

build() {
  cd "$srcdir/slopsmith/rscli"
  msg2 "A restaurar e compilar motor F# (RsCli) como multi-file..."
  dotnet publish -c Release \
                 -r linux-x64 \
                 --self-contained true \
                 -o ../dist/rscli \
                 -p:PublishReadyToRun=false \
                 -p:PublishSingleFile=false \
                 -p:CopyLocalLockFileAssemblies=true

  cd "$srcdir/$_pkgname"
  msg2 "A organizar recursos para o Electron..."
  mkdir -p resources/python/bin resources/python/site-packages resources/bin/rscli

  cp -r "$srcdir/slopsmith/dist/rscli/"* resources/bin/rscli/
  cp -r "$srcdir/slopsmith" resources/slopsmith

  python -m pip install --target="build-python-libs" -r "$srcdir/slopsmith/requirements.txt"
  cp -r build-python-libs/* resources/python/site-packages/

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

  msg2 "A compilar Audio Engine e Interface..."
  npm run build:audio
  npm run build:ts
  npx electron-builder --linux dir
}

package() {
  cd "$srcdir/$_pkgname"
  _installdir="$pkgdir/opt/$_pkgname"
  _rsclidir="$_installdir/resources/bin/rscli"
  install -d "$_installdir"
  cp -r release/linux-unpacked/* "$_installdir/"

  install -d "$pkgdir/usr/bin"
  ln -sf "/opt/$_pkgname/slopsmith-desktop" "$pkgdir/usr/bin/$_pkgname"

  msg2 "A instalar RsCli com shell wrapper (multi-file fix)..."
  install -d "$_rsclidir"
  cp -r "$srcdir/slopsmith/dist/rscli/"* "$_rsclidir/"

  _target_bin=""
  if [ -f "$_rsclidir/rscli" ]; then _target_bin="rscli";
  elif [ -f "$_rsclidir/RsCli" ]; then _target_bin="RsCli"; fi

  if [ -n "$_target_bin" ]; then
    mv "$_rsclidir/$_target_bin" "$_rsclidir/RsCli.bin"

    cat <<'EOF' > "$_rsclidir/RsCli"
#!/bin/sh
_dir=$(dirname "$(readlink -f "$0")")
cd "$_dir"
export DOTNET_MULTILEVEL_LOOKUP=0
exec ./RsCli.bin "$@"
EOF
    chmod +x "$_rsclidir/RsCli" "$_rsclidir/RsCli.bin"
  fi

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
  [ -n "$_icon" ] && install -Dm644 "$_icon" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"

  chmod +x "$_installdir/slopsmith-desktop"
}
