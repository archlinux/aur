# Maintainer: Avenge Media <avengemediallc at gmail dot com>
_pkgauthor=duxlabs-dev
_repo=dux-calendar
_binname=dcal
_iconname=dev.duxlabs.calendar
_desktopid=dev.duxlabs.calendar

pkgname=dux-calendar-bin
pkgver=2.1.2
pkgrel=1
pkgdesc="Local, Google, Microsoft, and CalDAV calendars for the Dux desktop (prebuilt binary)"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_repo}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_repo}/v${pkgver}"
_urlrel="${url}/releases/download/v${pkgver}"
license=('MIT')
depends=('quickshell' 'qt6-declarative')
provides=("${_binname}" "${_repo}" 'dankcalendar')
conflicts=("${_binname}" "${_repo}" 'dankcalendar' 'dankcalendar-bin' 'dankcalendar-git' 'dux-calendar-git')
replaces=('dankcalendar-bin')

source=(
  "LICENSE-${pkgver}::${_urlraw}/LICENSE"
  "README-${pkgver}.md::${_urlraw}/README.md"
  "${_desktopid}-${pkgver}.desktop::${_urlraw}/assets/${_desktopid}.desktop"
  "${_binname}-${pkgver}.service::${_urlraw}/assets/systemd/${_binname}.service"
  "${_iconname}-${pkgver}.svg::${_urlrel}/${_iconname}.svg"
  "${_binname}-completions-${pkgver}.tar.gz::${_urlrel}/${_binname}-completions-${pkgver}.tar.gz"
)
source_x86_64=("${_binname}-${arch[0]}-${pkgver}.gz::${_urlrel}/${_binname}-linux-${_barch[0]}.gz")
source_aarch64=("${_binname}-${arch[1]}-${pkgver}.gz::${_urlrel}/${_binname}-linux-${_barch[1]}.gz")

sha256sums=('a5b49222ed7b2e61fc82bc0d834be0729d9c4d4ed55798ff563c6ad0474178ad'
            '249045d73bdddc349eeaed18680c1decd54d1b2ab3aa4a12070fca66e77eb9c3'
            '49ab0353bd4a915c43adae4d11ff49730e13a2af530aaf6b918a3d8e430c9acf'
            '4ca116a3853362bfe7513ebe10be3c06fb244520e5cca997c66d8d562d03fc12'
            'df7a0f965cc85e2e0d5b5dfa88b9b68b159a4bf846ef2906d7e05c3ca3c9ae39'
            '3dde3ba56b8bcb1ae01eaebb56ff4037966fa64b8ec64ef7744f563eedf5d4ef')
sha256sums_x86_64=('e254dc65ce0e73f20a5fb3c3d7d4f463fb7f425be02f6a67e9e95a099c8488bb')
sha256sums_aarch64=('3f418026e37bfc7b965fe3de6669cf49571b54011cbf383f4c3dffa463973544')

# makepkg's mime sniffing does not reliably detect a gzipped ELF, so decompress it ourselves
noextract=("${_binname}-${arch[0]}-${pkgver}.gz" "${_binname}-${arch[1]}-${pkgver}.gz")

prepare() {
  cd "${srcdir}" || exit 1

  gzip -dcf "${_binname}-${CARCH}-${pkgver}.gz" > "${_binname}-${CARCH}-${pkgver}"
}

package() {
  cd "${srcdir}" || exit 1

  install -Dm755 "${_binname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_binname}"

  install -Dm644 "${_binname}"      "${pkgdir}/usr/share/bash-completion/completions/${_binname}"
  install -Dm644 "_${_binname}"     "${pkgdir}/usr/share/zsh/site-functions/_${_binname}"
  install -Dm644 "${_binname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_binname}.fish"

  install -Dm644 "${_iconname}-${pkgver}.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_iconname}.svg"

  install -Dm644 "${_desktopid}-${pkgver}.desktop" \
    "${pkgdir}/usr/share/applications/${_desktopid}.desktop"

  install -Dm644 "${_binname}-${pkgver}.service" \
    "${pkgdir}/usr/lib/systemd/user/${_binname}.service"

  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
