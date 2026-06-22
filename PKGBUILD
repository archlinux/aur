# Maintainer: Avenge Media <avengemediallc at gmail dot com>
_pkgauthor=AvengeMedia
_repo=dankcalendar
_binname=dcal
_shellname=dankcal
_iconname=dankcalendar
_desktopid=com.danklinux.dankcalendar

pkgname=dankcalendar-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="Local, Google, Microsoft, and CalDAV calendars for the dank desktop (prebuilt binary)"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_repo}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_repo}/v${pkgver}"
_urlrel="${url}/releases/download/v${pkgver}"
license=('MIT')
depends=('quickshell' 'qt6-declarative')
optdepends=('dms-shell: dynamic theming via DankMaterialShell colors')
provides=("${_binname}" "${_repo}")
conflicts=("${_binname}" "${_repo}" 'dankcalendar-git')

source=(
  "LICENSE-${pkgver}::${_urlraw}/LICENSE"
  "README-${pkgver}.md::${_urlraw}/README.md"
  "${_desktopid}-${pkgver}.desktop::${_urlraw}/assets/${_desktopid}.desktop"
  "${_binname}-${pkgver}.service::${_urlraw}/assets/systemd/${_binname}.service"
  "${_repo}-shell-${pkgver}.tar.gz::${_urlrel}/${_repo}-shell-${pkgver}.tar.gz"
  "${_binname}-completions-${pkgver}.tar.gz::${_urlrel}/${_binname}-completions-${pkgver}.tar.gz"
)
source_x86_64=("${_binname}-${arch[0]}-${pkgver}.gz::${_urlrel}/${_binname}-linux-${_barch[0]}.gz")
source_aarch64=("${_binname}-${arch[1]}-${pkgver}.gz::${_urlrel}/${_binname}-linux-${_barch[1]}.gz")

sha256sums=('a5b49222ed7b2e61fc82bc0d834be0729d9c4d4ed55798ff563c6ad0474178ad'
            '9efff7094fa426eb3fc5c0cf5e4891f1d9e85e6ec4b3f4d549c43241a15dd005'
            'e19a17590b7712737aa086b3b7095f3c5c1b73b5ca43ce30de62577bffd5563c'
            '24586ef0584046c0217f52a20d397f5ea4952f3d8ef0d110f9479e2284606aeb'
            '47737410c3a0940a36758f6894301abf3d4e420a4098874ecb0dd92509a51a18'
            '8143fe4edfdb149b0f84027f5f19117bf7062eadd47dd35f5dd16c1395c19e38')
sha256sums_x86_64=('f77729d89c8ca428a476e198a1540bad5cb4bc1561cc6fb574f129747d63a271')
sha256sums_aarch64=('77ca4713f15b0f97e6cb724072bec0a596ef85771dc45b849189619a1c4ddf71')

package() {
  cd "${srcdir}" || exit 1

  install -Dm755 "${_binname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_binname}"

  install -Dm644 "${_binname}"      "${pkgdir}/usr/share/bash-completion/completions/${_binname}"
  install -Dm644 "_${_binname}"     "${pkgdir}/usr/share/zsh/site-functions/_${_binname}"
  install -Dm644 "${_binname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_binname}.fish"

  install -dm755 "${pkgdir}/usr/share/quickshell/${_shellname}"
  cp -r "${_shellname}/." "${pkgdir}/usr/share/quickshell/${_shellname}/"

  install -Dm644 "${_shellname}/assets/${_iconname}.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_iconname}.svg"

  install -Dm644 "${_desktopid}-${pkgver}.desktop" \
    "${pkgdir}/usr/share/applications/${_desktopid}.desktop"

  install -Dm644 "${_binname}-${pkgver}.service" \
    "${pkgdir}/usr/lib/systemd/user/${_binname}.service"

  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
