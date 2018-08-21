#Maintainer: Plague-doctor <plague at privacyrequired dot com >

pkgver=1.2.2
pkgrel=3
PN="pcloud"
pkgname=pcloud-drive
pkgdesc="pCloud drive. Electron edition."

source_x86_64=("https://www.pcloud.com/pcloud") # Placeholder
arch=('x86_64')
url="https://www.pcloud.com"
_api_url="https://api.pcloud.com/getpublinkdownload?code="
_api_code="XZjUqB7Z1QdweaIkLGVOjmxvaUJcqYTxxRPk"
makedepends=('jq' 'patchelf' 'sed')
conflicts=('pcloud-git' 'pcloud')
options=("!strip" "staticlibs")
noextract=("glibc-2.27-3-x86_64.pkg.tar.xz")

md5sums_x86_64=('3327646879234379fc9bd313a96b042e'
                '57c1dc79d8552f40602e49b84be65752')
validpgpkeys=('A8F7858263C1E39480B731DCEAD4F103068DF8E5')

prepare() {
  chmod +x ${pkgname}-${pkgver}-${pkgrel}
  ./${pkgname}-${pkgver}-${pkgrel} --appimage-extract
  find ${srcdir}/squashfs-root/ -type d -exec chmod 755 {} \;
}

package() {
  install -d "$pkgdir"/{/usr/bin,opt}
  cp -r "${srcdir}/squashfs-root/app" "${pkgdir}/opt/${PN}"
  mkdir -p "${pkgdir}/usr/share/icons/hicolor"
  cp -r "${srcdir}/squashfs-root/usr/share/icons/" "${pkgdir}/usr/share/"
  ln -s "/opt/${PN}/${PN}" "${pkgdir}/usr/bin/${PN}"
  install -Dm644 "${srcdir}/squashfs-root/${PN}.desktop" "${pkgdir}/usr/share/applications/${PN}.desktop"
  sed -i 's/AppRun/pcloud/' "${pkgdir}/usr/share/applications/${PN}.desktop"
  sed -i 's/Name=pcloud/Name=pCloud/' "${pkgdir}/usr/share/applications/${PN}.desktop"
  chmod 755 "${pkgdir}/opt/${PN}"

  # Patch pcloud to use glibc 2.27
  _idir="/opt/${PN}"
  _pdir="${pkgdir}/${_idir}"
  _pbin="${_pdir}/${PN}"
  mkdir -p "$_pdir/glibc"
  tar -xJf "glibc-2.27-3-x86_64.pkg.tar.xz" -C "$_pdir/glibc"
  rm "$_pdir/glibc/"{.BUILDINFO,.INSTALL,.MTREE,.PKGINFO}
  patchelf --set-interpreter "$_idir/glibc/usr/lib/ld-linux-x86-64.so.2" "$_pbin"
  patchelf --set-rpath "$_idir:$_idir/glibc/usr/lib" "$_pbin"
}

_get_source() {
  source_x86_64=("${pkgname}-${pkgver}-${pkgrel}::http://$(curl "${_api_url}${_api_code}" 2> /dev/null | jq -r '.hosts[0] + .path')"
                 "https://archive.archlinux.org/packages/g/glibc/glibc-2.27-3-x86_64.pkg.tar.xz")
}

jq --version &>/dev/null && _get_source || true
