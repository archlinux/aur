# Maintainer: David Hummel <david dot hummel at gmail point com>

_gitname=atom
_pkgname=${_gitname}-community

pkgname=${_pkgname}-git
pkgver=1.63.0_dev_0f7c5c14e
pkgrel=1
pkgdesc="A hackable text editor for the 21st century, built on Electron, and based on everything we love about our favorite editors."
url="https://github.com/atom-community/atom"
arch=("x86_64")

conflicts=("${_gitname}" "apm")

depends=("libsecret" "libx11" "libxkbfile")

makedepends=("git" "node-gyp" "nodejs-lts-gallium" "npm" "python")

source=("git+https://github.com/${_pkgname}/${_gitname}.git" "atom.desktop.in.patch" "test.js.patch")

sha256sums=("SKIP" "36cd22b6610978686409114361ee32edbb16a021408feb71d44e4e1119e397b4" "cf45abaa2754fdc8c7e7796cf9f3da3c9363126c62f57aed4e4c9075bc496e37")

prepare() {
  pushd ${_gitname}
  patch --forward --strip=1 --input="${srcdir}/atom.desktop.in.patch"
  patch --forward --strip=1 --input="${srcdir}/test.js.patch"
  if [ -d node_modules ]; then
    node script/clean.js
  fi
  node script/bootstrap.js
  popd
}

pkgver() {
 cd ${_gitname}
 printf "%s_%s" "$(npm pkg get version | sed 's/-/_/' | sed 's/"//g')" "$(git log -1 --pretty=format:'%h')"
}

build() {
  cd ${_gitname}
  node script/build.js --no-bootstrap
}

package() {
  cd ${_gitname}

  install -dm0755 "${pkgdir}/opt/${_pkgname}"
  cp -r out/${_gitname}-dev-*/* "${pkgdir}/opt/${_pkgname}"

  install -dm0755 "${pkgdir}/usr/share/applications"
  sed -e "s|<%= appName %>|Atom Community|" \
      -e "s|<%= description %>|${pkgdesc}|" \
      -e "s|<%= installDir %>|/usr|" \
      -e "s|<%= appFileName %>|${_gitname}|" \
      -e "s|<%= iconPath %>|${_pkgname}|" \
      resources/linux/atom.desktop.in > "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  for size in 16 24 32 48 64 128 256 512 1024; do
    install -Dm0644 "resources/app-icons/dev/png/${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png"
  done

  install -dm0755 "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/atom "${pkgdir}/usr/bin/atom"
  ln -s /opt/${_pkgname}/resources/app/apm/bin/apm "${pkgdir}/usr/bin/apm"
}
