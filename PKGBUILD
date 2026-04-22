pkgname=jsesh-git
_upstream=jsesh
pkgver=7.11.r0.g68c4c77d
pkgrel=2
pkgdesc="Hieroglyphic text editor built from the upstream JSesh git repository"
arch=('any')
url='https://github.com/rosmord/jsesh'
license=('custom:CeCILL' 'custom:jsesh-fonts')
depends=('jre21-openjdk')
makedepends=('git' 'maven')
provides=('jsesh')
conflicts=('jsesh' 'jsesh-bin')
source=("jsesh::git+https://github.com/rosmord/jsesh.git"
        "jsesh-launcher"
        "jsesh.desktop"
        "jsesh-icon.png::https://jsesh.qenherkhopeshef.org/user/pages/01.home/logo.png")
sha256sums=(
  'SKIP'
  'bb9d9ece5cd35b820a2722945fa73e3d9a1e88f34f7e30f778bcdb4b023ac633'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_upstream}"

  git describe --long --tags --abbrev=8 | sed 's/^release-//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
  cd "${srcdir}/${_upstream}"

  mvn \
    -Dmaven.repo.local="${srcdir}/m2/repository" \
    -pl jsesh-installer \
    -am \
    -DskipTests \
    package
}

package() {
  local appdir="${pkgdir}/opt/jsesh"
  local build_root

  cd "${srcdir}/${_upstream}"

  build_root="$(find jsesh-installer/target/windows -mindepth 1 -maxdepth 1 -type d -name 'JSesh-*' | head -n1)"

  if [[ -z "${build_root}" ]]; then
    echo "Missing built JSesh installer directory under jsesh-installer/target/windows" >&2
    return 1
  fi

  install -dm755 "${appdir}"
  cp -a "${build_root}/." "${appdir}/"

  install -Dm755 "${srcdir}/jsesh-launcher" "${pkgdir}/usr/bin/jsesh"
  install -Dm644 "jsesh-installer/src/binary/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -Dm644 "jsesh-installer/src/binary/FONT-LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/FONT-LICENSE.md"
  install -Dm644 "${srcdir}/jsesh.desktop" "${pkgdir}/usr/share/applications/jsesh.desktop"
  install -Dm644 "${srcdir}/jsesh-icon.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/jsesh.png"
  install -Dm644 "${srcdir}/jsesh-icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/jsesh.png"
}
