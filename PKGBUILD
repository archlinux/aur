# Maintainer: Laoyou2333 <laoyou2333@confidesk.com>
pkgname=clamui-git
_pkgname=clamui
pkgver=0.3.0.r148.g1e33dab
pkgrel=1
pkgdesc="ClamUI is a modern Linux desktop application that provides a graphical user interface for the ClamAV antivirus command-line tool."
arch=('any')
url="https://clamui.com"
license=('MIT')
provides=('clamui' 'python-clamui')
conflicts=('clamui')
depends=('python' 'python-build' 'python-installer' 'python-gobject' 'python-cairo' 'gtk4' 'clamav' 'polkit' 'python-requests' 'python-urllib3' 'python-keyring' 'python-matplotlib' 'python-hatchling' 'python-psutil' 'python-pillow' 'libadwaita')
source=("git+https://github.com/linx-systems/clamui")
sha256sums=('SKIP')

pkgver() {
  # correct package version from git to latest
  cd "${srcdir}/${_pkgname}"

  _base_ver="$(
    awk -F'"' '/^[[:space:]]*version[[:space:]]*=[[:space:]]*"/ { print $2; exit }' \
      "${srcdir}/${_pkgname}/pyproject.toml"
  )"

  _desc="$(git describe --long --abbrev=7)"
  _count="$(printf '%s' "$_desc" | awk -F'-' '{print $2}')"
  _short_hash="$(printf '%s' "$_desc" | awk -F'-' '{print $3}' | sed 's/^g//')"
  printf '%s.r%s.g%s\n' "$_base_ver" "$_count" "$_short_hash"
}

build() {
    cd ${_pkgname}
    python -m build --wheel --no-isolation
}
package() {
    cd ${_pkgname}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "${srcdir}/${_pkgname}/data/io.github.linx_systems.ClamUI.desktop" "${pkgdir}/usr/share/applications/io.github.linx_systems.ClamUI.desktop"
    install -Dm644 "${srcdir}/${_pkgname}/scripts/clamui-scan-nautilus.sh" "${pkgdir}/usr/share/clamui/integrations/clamui-scan-nautilus.sh"
    install -Dm644 "${srcdir}/${_pkgname}/scripts/clamui-virustotal-nautilus.sh" "${pkgdir}/usr/share/clamui/integrations/clamui-virustotal-nautilus.sh"
    install -Dm644 "${srcdir}/${_pkgname}/icons/io.github.linx_systems.ClamUI.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/io.github.linx_systems.ClamUI.png"
    install -Dm644 "${srcdir}/${_pkgname}/icons/io.github.linx_systems.ClamUI.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.linx_systems.ClamUI.svg"
    install -Dm644 "${srcdir}/${_pkgname}/data/io.github.linx_systems.ClamUI-virustotal.desktop" "${pkgdir}/usr/share/kio/servicemenus/io.github.linx_systems.ClamUI-virustotal.desktop"
    install -Dm644 "${srcdir}/${_pkgname}/data/io.github.linx_systems.ClamUI.service.desktop" "${pkgdir}/usr/share/kio/servicemenus/io.github.linx_systems.ClamUI.service.desktop"
    install -Dm644 "${srcdir}/${_pkgname}/data/io.github.linx_systems.ClamUI-virustotal.desktop" "${pkgdir}/usr/share/kservices5/ServiceMenus/io.github.linx_systems.ClamUI-virustotal.desktop"
    install -Dm644 "${srcdir}/${_pkgname}/data/io.github.linx_systems.ClamUI.service.desktop" "${pkgdir}/usr/share/kservices5/ServiceMenus/io.github.linx_systems.ClamUI.service.desktop"
    install -Dm644 "${srcdir}/${_pkgname}/data/io.github.linx_systems.ClamUI.metainfo.xml" "${pkgdir}/usr/share/metainfo/io.github.linx_systems.ClamUI.metainfo.xml"
    install -Dm644 "${srcdir}/${_pkgname}/data/io.github.linx_systems.ClamUI-virustotal.nemo_action" "${pkgdir}/usr/share/nemo/actions/io.github.linx_systems.ClamUI-virustotal.nemo_action"
    install -Dm644 "${srcdir}/${_pkgname}/data/io.github.linx_systems.ClamUI.nemo_action" "${pkgdir}/usr/share/nemo/actions/io.github.linx_systems.ClamUI.nemo_action"
    # install -Dm644 "${srcdir}/${_pkgname}/data/io.github.linx_systems.ClamUI.policy" "${pkgdir}/usr/share/polkit-1/actions/io.github.linx_systems.ClamUI.policy"
}
