# Maintainer: miawgogo <aur@miawgogo.me>
# PKGBUILD based on the pixelorama-git pkgbuild
# snekstudio.sh and snekstudio.desktop from copygirl's snekstudio-bin

pkgname=snekstudio-git
_pkgname=snekstudio
pkgver=369.ed4f624
pkgrel=2
pkgdesc="Open-source VTuber software using Godot Engine! "
arch=('x86_64')
url="https://snekstudio.com/"
_url="https://github.com/ExpiredPopsicle/SnekStudio"
license=('GPL-3.0')
depends=()
makedepends=('curl' 'godot' 'unzip' 'git' 'godot-export-templates-linux')
provides=('snekstudio')
conflicts=('snekstudio-bin')
source=(
  "${_pkgname}::git+${_url}.git"
  "git+https://github.com/ExpiredPopsicle/TwitchGD4.git"
  "snekstudio.desktop"
  "snekstudio.sh"
)
sha512sums=(
  SKIP
  SKIP
  "49b535b380f5b6fce563b5a7eedc30604be36c03b15a6373fe2054200c289b5167e5f16d13a3201f3aec0dd8b9320820d5592000d502e6100580af867deb95f9"
  "b13efcef463599f7442c13609129bb1f85d792ff29474407b4edfba5898d0f3738226151c76920378356f6fc1eb6528f83efbf86c8e9d8d62d9fc9c4bd640ae2"
)

pkgver()
{
    cd "${_pkgname}"
    echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  # Get Godot Engine version
  _godot_version_full_string=$(godot --version | sed 's/.arch_linux.*//' )

  _template_dir=~/.local/share/godot/export_templates/${_godot_version_full_string}

  sed -i "s/enable_file_logging=true/enable_file_logging=false/" \
         "${srcdir}/${_pkgname}/project.godot"
  if [ ! -d "$_template_dir" ]; then
    mkdir -p "$_template_dir"
    cp -r /usr/share/godot/export_templates/"${_godot_version_full_string}"/* "$_template_dir"
  fi
  cd "${srcdir}/${_pkgname}" 
  # update the sub module for kiri's twitch addon
  git submodule init
  git config submodule.addons/TwitchGD4.url "$srcdir/TwitchGD4"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${srcdir}/${_pkgname}"
  godot --headless --path . --import
  godot --headless --path . --script Build/DownloadPythonRequirements.gd # grabs all the python dependacies for build
  godot --headless --path . --export-release "Linux-x86_$(getconf LONG_BIT)" build/${_pkgname}
}

package() {
  install -Dm644 "${srcdir}/${_pkgname}/Core/UI/Images/icons/256x256.png" \
                 "$pkgdir"/usr/share/pixmaps/"$_pkgname".png

  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" \
                 "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  install -Dm644 "$_pkgname".desktop "$pkgdir"/usr/share/applications/"$_pkgname".desktop
  install -Dm755 "$_pkgname".sh "$pkgdir"/usr/bin/"$_pkgname"
  
  # Copying how copygirl installs the rest for the files in the -bin version for consistency 
  cp -rdp --no-preserve=ownership "${srcdir}/${_pkgname}/build/" "$pkgdir"/usr/share/"$_pkgname"
}
