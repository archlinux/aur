pkgname=gnome-shell-extension-astra-monitor-git
pkgver=43.r0.g90decfa
pkgrel=1
pkgdesc="Monitor CPU, GPU, memory, storage, network activity, and sensors in the GNOME panel"
arch=('any')
url="https://github.com/AstraExt/astra-monitor"
license=('GPL-3.0-or-later')
depends=('gnome-shell>=45' 'libadwaita' 'procps-ng')
makedepends=('gettext' 'git' 'typescript>=5.6')
optdepends=(
  'libgtop: Alternative system monitoring data source'
  'pciutils: PCI device information'
  'iw: Wireless network information'
  'wireless_tools: Alternative wireless network information'
  'nethogs: Network activity per process'
  'iotop: Disk activity per process'
  'amdgpu_top: AMD GPU monitoring'
  'nvidia-utils: NVIDIA GPU monitoring'
  'intel-gpu-tools: Intel GPU monitoring'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
_uuid='monitor@astraext.github.io'
source=("astra-monitor::git+${url}.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd astra-monitor
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd astra-monitor
  # Transpile without upstream's development-only GIR type dependencies.
  tsc --noCheck --incremental false
  install -m644 metadata.json stylesheet.css build/
  cp -r icons schemas LICENSE build/
  gnome-extensions pack --force --podir=../po \
    --extra-source=src --extra-source=icons --extra-source=LICENSE build
}

package() {
  local extension_dir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -d "${extension_dir}"
  bsdtar -xf "astra-monitor/${_uuid}.shell-extension.zip" \
    -C "${extension_dir}" --no-same-owner

  install -Dm644 \
    "${extension_dir}/schemas/org.gnome.shell.extensions.astra-monitor.gschema.xml" \
    -t "${pkgdir}/usr/share/glib-2.0/schemas/"
  rm -r "${extension_dir}/schemas"

  install -Dm644 "${extension_dir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
