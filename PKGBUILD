# Maintainer: Avenge Media <avengemediallc at gmail dot com>
_pkgauthor=AvengeMedia
_repo=dankcalendar
_binname=dcal
_shellname=dankcal
_iconname=dankcalendar
_desktopid=com.danklinux.dankcalendar

pkgname=dankcalendar-bin
pkgver=0.1.1
pkgrel=2
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
            'cdec02547433ab1b6d18a7e23f233b27908fa865da95201375f2d3951395063d'
            '327063946d64461b0a9f511423c63cde09d420deed1b3000c718f37483dbd27d'
            '24586ef0584046c0217f52a20d397f5ea4952f3d8ef0d110f9479e2284606aeb'
            'a7420ec3235649b856c3e10baa91bd14fa37784de1123b35d7c8b17d3308bf1d'
            '2f828431b26c6e40db4da41440637e30d9be6d32165a8f4da90aa0e68c8cec40')
sha256sums_x86_64=('44b55dbe30b5d195b35a178ce88fc0fb779f3d7599cb1a789c479c3ff1c757df')
sha256sums_aarch64=('6e0fef20079788065d4b1cf03d3c5118b987f2e76883d591999248a09b5ff334')

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
