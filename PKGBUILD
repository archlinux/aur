# Maintainer: Avenge Media <avengemediallc at gmail dot com>
_pkgauthor=AvengeMedia
_repo=dankcalendar
_binname=dcal
_shellname=dankcal
_iconname=dankcalendar
_desktopid=com.danklinux.dankcalendar

pkgname=dankcalendar-bin
pkgver=0.2.0
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
            '7c7c45f742436385effba03542a262a26376ffc92a0c87754381b6668fe2bc79'
            'e19a17590b7712737aa086b3b7095f3c5c1b73b5ca43ce30de62577bffd5563c'
            '24586ef0584046c0217f52a20d397f5ea4952f3d8ef0d110f9479e2284606aeb'
            'fe6957ff241badeaf9affd100a2715f0657e19e6df020130d7dbc750f20938a7'
            '5637e331ff7d13dd266a8a48a32b13ca46df7c7cfffbded3b60b7bc489d92790')
sha256sums_x86_64=('d8500e01bcb7a3ccff4d5f76ad9c6ef4b655acffe9702970033dfe657a71f389')
sha256sums_aarch64=('1fcd4545ef6ee0e4b040472980ac5224660ecf86a9d07480a8f7a8aa13952c52')

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
