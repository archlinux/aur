# Maintainer: motherofmilk <iulian.dita@gmail.com>

pkgname=open-design-git
pkgver=0.4.0.r264.gc69dee74
pkgrel=2
pkgdesc='VCS build of Open Design packaged as a Linux AppImage'
arch=('x86_64')
url='https://github.com/nexu-io/open-design'
license=('Apache-2.0')
depends=('alsa-lib' 'gtk3' 'libnotify' 'libxss' 'libxtst' 'nss' 'xdg-utils')
makedepends=('git' 'npm' 'python' 'make' 'gcc')
provides=('open-design')
conflicts=('open-design' 'open-design-bin')
options=('!strip')
source=("${pkgname}::git+https://github.com/nexu-io/open-design.git#branch=main" 'open-design' 'open-design.desktop')
sha256sums=('SKIP'
            '68117e26248e675c9a544332cabf943f76477b41f953106ae7323ab737323e40'
            '0245ea0484c1bb89b74093abc3c77ce421e793dd06c5a8e36c203971bfd7f919')

pkgver() {
  cd "${srcdir}/${pkgname}"
  local _version _rev _commit
  _version="$(sed -n 's/^  "version": "\([^"]*\)",$/\1/p' package.json | head -n1)"
  _rev="$(git rev-list --count HEAD)"
  _commit="$(git rev-parse --short HEAD)"
  printf '%s.r%s.g%s' "${_version}" "${_rev}" "${_commit}"
}

build() {
  cd "${srcdir}/${pkgname}"

  _pnpm() { npx --yes pnpm@10.33.2 "$@"; }

  _pnpm install --frozen-lockfile
  # Build upstream's Linux AppImage locally; the released Linux artifact is not published yet.
  _pnpm tools-pack linux build --to appimage --namespace aur --portable --dir "${srcdir}/tools-pack"
}

package() {
  cd "${srcdir}/${pkgname}"
  local _appimage
  _appimage="$(find "${srcdir}/tools-pack/out/linux/namespaces/aur/builder" -maxdepth 1 -type f -name '*.AppImage' -print -quit)"
  if [[ -z "${_appimage}" ]]; then
    echo "no AppImage found under ${srcdir}/tools-pack/out/linux/namespaces/aur/builder" >&2
    return 1
  fi

  install -Dm755 "${_appimage}" "${pkgdir}/opt/open-design/open-design.AppImage"
  install -Dm755 "${srcdir}/open-design" "${pkgdir}/usr/bin/open-design"
  install -Dm644 "${srcdir}/open-design.desktop" "${pkgdir}/usr/share/applications/open-design.desktop"
  install -Dm644 tools/pack/resources/linux/icon.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/open-design.png"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
