# Maintainer: Dave Caruso <me@paperdave.net>

# By the way, this script doubles as a command line downloader via
#   `bash PKGBUILD -d <destination>`
# which downloads the tar.gz file from blackmagicdesign.com, but will not unpack or install it. 

# This build script, as well as tools to automatically fetch updates, lives in creative-toolkit
# https://github.com/paperdave/creative-toolkit/blob/main/src/fusion-studio-aur

pkgver=18.1.2
# $_downloadid can be grabbed off of https://www.blackmagicdesign.com/api/support/us/downloads.json
_downloadid=931eab2387ea48ed8cdec3bea3d923ba
sha256sums=(7c8f25090e7ed2627f4c1c14ece841cfeca93ea23d9d14ec4d04ea2fcb0dc04d)

#
pkgname=(fusion-studio fusion-render-node)
pkgrel=1
pkgdesc="GPU accelerated 2D and 3D compositing and motion graphics software. Requires USB activation dongle."
arch=('x86_64')
url="https://www.blackmagicdesign.com/products/fusion"
license=('Commercial')
depends=(
  'alsa-lib' 'apr-util' 'glu' 'libogg' 'libvorbis'
  'libxcrypt-compat' 'luajit' 'ocl-icd' 'opencl-driver'
  'qt5-x11extras' 'tbb'
)
optdepends=(
  'cuda: gpu acceleration'
)

source=("$pkgname-$pkgver.tar.gz::fusion-studio://$_downloadid")

# Fusion Studio Downloader Implementation
DLAGENTS=("fusion-studio::/usr/bin/env bash $BASH_SOURCE -d %o")

_download() {
  _output="$1"
  if [ -z "$_output" ]; then _output=$pkgname-$pkgver.tar.gz; fi

  # Url for registering the product and aquring the real download
  _regurl="https://www.blackmagicdesign.com/api/register/us/download/${_downloadid}"

  # Note: `downloadOnly` is only allowed on the paid *studio* products.
  _regjson='{"country": "us","downloadOnly": true}'

  _downloadurl=$(
    curl --compressed -s \
    -A "Mozilla" \
    -H 'Content-Type: application/json' \
    -d "$_regjson" \
    "$_regurl"
  )

  if ! [[ "$_downloadurl" == "https://"* ]]; then
    echo "Failed to retrieve download URL for $pkgname v$pkgver ($_downloadid)"
    exit 2;
  fi

  echo "Got Download URL for $pkgname v$pkgver ($_downloadid)"

  # No restrictions on the download URL
  curl --compressed --retry 3 --retry-delay 3 "$_downloadurl" -o "$_output"  
}
if [ "$1" = "-d" ]; then _download $2; exit; fi

_major=$(cut -d '.' -f 1,1 <<< "$pkgver")

_package_shared() {
  _fusion="$pkgdir/opt/$pkgname"
  mkdir "$_fusion" -p
  bsdtar -x -C "$_fusion" -f "${_tar_prefix}_${pkgver}_installer.run"
  mkdir "$pkgdir/etc/udev/rules.d" -p
  mkdir "$pkgdir/usr/bin" -p
  mkdir "$pkgdir/usr/share/applications" -p
  mkdir "$pkgdir/usr/share/pixmaps/" -p
  mv "$_fusion/.DirIcon" "$pkgdir/usr/share/pixmaps/$_iconName.png"
  cat << 'EOF' > "$pkgdir/etc/udev/rules.d/99-$pkgname.rules"
# BMD hardware (such as Speed Editor)
SUBSYSTEMS=="usb", ATTRS{idVendor}=="1edb", MODE="0666"
# Fusion Activation Dongle
SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="096e", MODE="0666"
EOF
}

_package_shared_post() {
  rm -f "$_fusion/FusionInstaller"
  rm -f "$_fusion/FusionInstaller.desktop"
  rm -f "$_fusion/AppRun"
  rm -f "$_fusion/filelist.txt"
  rm -f "$_fusion/Fusion.menu"
  rm -f "$_fusion/Fusion.directory"
  rm -f "$_fusion/Fusion.desktop"
  rm -f "$_fusion/FusionRenderNode.desktop"
  rm -f "$_fusion/FusionRenderNode.directory"
  rm -f "$_fusion/FusionRenderNode.menu"
  rm -f "$_fusion/fusion.xml"
}

package_fusion-studio() {
  _tar_prefix="Blackmagic_Fusion_Studio_Linux"
  _iconName="blackmagic-Fusion$_major"
  _package_shared

  mkdir "$pkgdir/usr/share/mime/packages" -p

  ln -s "/opt/fusion-studio/Fusion" "$pkgdir/usr/bin/fusion-studio"
  ln -s "/opt/fusion-studio/Fusion" "$pkgdir/usr/bin/Fusion"
  ln -s "/opt/fusion-studio/FusionServer" "$pkgdir/usr/bin/FusionServer"
  ln -s "/opt/fusion-studio/fuscript" "$pkgdir/usr/bin/fuscript"

  # Filename here is specifically set so xdg-mime prefers fusion-studio
  cat $_fusion/Fusion.desktop \
    | sed -e "s|/opt/BlackmagicDesign/Fusion$_major|/opt/$pkgname|" \
    | sed -e "s|GenericName=.*|GenericName=VFX Compositor$2|" \
    | sed -e "s|Comment=.*|Comment=$pkgdesc|" \
    > "$pkgdir/usr/share/applications/fusion-studio-client.desktop"

  mv "$_fusion/fusion.xml" "$pkgdir/usr/share/mime/packages/$pkgname.xml"

  cat << 'EOF' > "$pkgdir/opt/fusion-studio/BlackmagicFusion.py"
# Modified from Blackmagic Fusion Studio
# Only supports linux, and exactly where PKGBUILD directs to
import sys
if sys.version_info[0] >= 3 and sys.version_info[1] >= 5:
	import importlib.machinery
	import importlib.util
	def load_dynamic(module_name, file_path):
		module = None
		spec = None
		loader = importlib.machinery.ExtensionFileLoader(module_name, file_path)
		if loader:
			spec = importlib.util.spec_from_loader(module_name, loader)
		if spec:
			module = importlib.util.module_from_spec(spec)
		if module:
			loader.exec_module(module)
		return module
else:
	import imp
	def load_dynamic(module, path):
		return imp.load_dynamic(module, path)
fu_mod = None
try:
	import fusionscript as fu_mod
except ImportError:
  fu_mod = load_dynamic("fusionscript", "/opt/fusion-studio/fusionscript.so")
if fu_mod:
	sys.modules[__name__] = fu_mod
else:
	raise ImportError("could not locate module dependencies")
EOF

  _package_shared_post
}

package_fusion-render-node() {
  _tar_prefix="Blackmagic_Fusion_Render_Node_Linux"
  _iconName="blackmagic-FusionRenderNode$_major"
  _package_shared

  ln -s "/opt/fusion-render-node/FusionRenderNode" "$pkgdir/usr/bin/fusion-render-node"
  ln -s "/opt/fusion-render-node/FusionRenderNode" "$pkgdir/usr/bin/FusionRenderNode"

  # Filename here is specifically set so xdg-mime prefers fusion-studio
  cat $_fusion/FusionRenderNode.desktop \
    | sed -e "s|/opt/BlackmagicDesign/FusionRenderNode$_major|/opt/$pkgname|" \
    | sed -e "s|GenericName=.*||" \
    | sed -e "s|Comment=.*|Comment=Headless rendering for Fusion Studio $_major|" \
    > "$pkgdir/usr/share/applications/fusion-studio-render-node.desktop"

  _package_shared_post
}
