# Maintainer: SFN

pkgname=material-maker
pkgver=1.6
pkgrel=1
pkgdesc="A procedural textures authoring and 3D model painting tool based on the Godot game engine"
arch=('x86_64')
url="https://rodzilla.itch.io/material-maker"
license=('MIT')
depends=('hicolor-icon-theme' 'libglvnd' 'libxcursor' 'libxi' 'libxinerama' 'libxrandr' 'libvulkan.so')
makedepends=('godot' 'godot-export-templates-linux')
source=("git+https://github.com/RodZill4/material-maker.git#tag=${pkgver}")
b2sums=('dae64d8d5d88e6f78c146b654c854e73df1ac8401deedef468a4dee664ad6039a293c03393ea0ab7879eec2569c1da3d07fe1f0858dab458be0a105e77031f27')

prepare() {
  # Set godot templates location
  # Adapted from the "pixelorama" PKGBUILD
  for mode in debug release; do
          local _template=$(find /usr/share/godot/export_templates -type f -name "linux_${mode}.$(uname -m)" -print -quit)
    [[ -z "$_template" ]] && echo "Missing Godot template for $mode" && return 1
    sed -E -e 's&^(custom_template/'${mode}')=.*$&\1="'"${_template}"'"&' \
        -i "${srcdir}/${pkgname}/export_presets.cfg"
  done

  sed -i "/enable_file_logging/ s/true/false/" \
         "${srcdir}/${pkgname}/project.godot"
}

build() {
  cd ${srcdir}/${pkgname}
  mkdir -p build
  
  godot --export-release "Linux/X11" --display-driver headless --path . project.godot build/${pkgname}
  
  cp -R ./addons/material_maker/nodes build/
  cp -R ./material_maker/environments build/
  cp -R ./material_maker/examples build/
  cp -R ./material_maker/library build/
  cp -R ./material_maker/meshes build/
  cp -R ./material_maker/misc/export build/
}
    
package() {
  _xdg_desktop_name="io.github.RodZill4.Material-Maker"

  # copy data
  mkdir -p ${pkgdir}/usr/share/${pkgname}
  cp -R ${srcdir}/${pkgname}/build/* ${pkgdir}/usr/share/${pkgname}

  # link executable
  mkdir ${pkgdir}/usr/bin
  ln -s /usr/share/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}

  # install other bits
  install -Dm644 "${srcdir}/${pkgname}/material_maker/misc/linux/${_xdg_desktop_name}.desktop" \
                 "${pkgdir}/usr/share/applications/${_xdg_desktop_name}.desktop"

  install -Dm644 "${srcdir}/${pkgname}/material_maker/misc/linux/${_xdg_desktop_name}.appdata.xml" \
                 "${pkgdir}/usr/share/metainfo/${_xdg_desktop_name}.appdata.xml"

  install -Dm644 "${srcdir}/${pkgname}/icon.png" \
                 "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"

  install -Dm644 "${srcdir}/${pkgname}/LICENSE.md" \
                 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
