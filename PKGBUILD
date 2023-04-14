# Maintainer: gee

pkgname=reshade-shaders-git
pkgver=r21.7c48ddc
pkgrel=1
pkgdesc='A collection of post-processing shaders written in the ReShade FX shader language, to be used by vkBasalt'
arch=('any')
url='https://github.com/crosire/reshade-shaders'
license=('custom')
makedepends=('git' 'curl' 'unzip')
source=("git+https://github.com/crosire/reshade-shaders.git#branch=list")
sha256sums=(SKIP)
install=reshade-shaders.install

pkgver() {
  cd "reshade-shaders"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/reshade-shaders
  rm -rf    Shaders Textures build
  mkdir -p  Shaders Textures build
  cd build

  folder=""
  while read -r line
  do
    if [[ "$line" == "InstallPath"* ]]
    then
      folder=${line:38}
    fi
    if [[ "$line" == "DownloadUrl"* ]]
    then
      url=${line:12}
      msg "Getting $url"
      /usr/bin/curl  -L "$url" -o file.zip
      /usr/bin/unzip file.zip
      rm file.zip
      mkdir -p ../Shaders/$folder
      msg "$folder"
      if [[ "$folder" == "akgunter" ]]
      then
        mv */{*/Shaders/*.*,README.MD,LICENSE.TXT} ../Shaders/$folder
      elif [[ "$folder" == "CRT-Royale" ]]
      then
        mv crt-royale-reshade-master/{reshade-shaders/Shaders/*.*,README.MD,LICENSE.TXT} ../Shaders/$folder
      elif [[ "$folder" == "CShade" ]]
      then
        mv CShade-main/{shaders/*,README.md,LICENSE} ../Shaders/$folder
      else
        mv */{Shaders/*.*,README.md} ../Shaders/$folder
        mv */{LICENSE*,LICENSE*.*} ../Shaders/$folder || true
        mv */Textures/*.* ../Textures || true
      fi
    fi
  done < ../EffectPackages.ini
}

package() {
  cd ${srcdir}/reshade-shaders

  install -dm 755 "${pkgdir}/opt/reshade/shaders"
  install -Dm 644 Shaders/*.*  "${pkgdir}/opt/reshade/shaders/"
  cd Shaders
  for dir in */
  do
    cd "$dir"
    install -dm 755 "$pkgdir/opt/reshade/shaders/$dir"
    install -Dm 644 *.*  "${pkgdir}/opt/reshade/shaders/$dir"
    cd ..
  done
  cd ..
  install -dm 755 "${pkgdir}/opt/reshade/textures"
  install -Dm 644 Textures/*.* "${pkgdir}/opt/reshade/textures/"
}
