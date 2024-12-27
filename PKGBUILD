# Maintainer: Patrick josé Pereira  <gmail.com@patrickelectric>
# Contributor: Helio Loureiro <helio@loureiro.eng.br>
pkgname=qhot-git
_realname=qhot
confilicts=('qhot')
pkgver=qt6+1.1.1.r93.20241122.e2fb0ba
pkgrel=1
gittag=qt6-1.1.1
pkgdesc="Hot reload for nested QML files!"
arch=('i686' 'x86_64')
url="https://github.com/patrickelectric/qhot"
license=('GPL3')
buildDepends=('git')
depends=(
  'qt6-base'
  'qt6-declarative'
  'qt6-quick3d'
  'qt6-charts'
  'qt6-imageformats'
  'qt6-location'
  'qt6-multimedia'
  'qt6-svg'
  'qt6-tools'
  'qt6-translations'
  'qt6-webengine'
  'qt6-websockets'
  'clang'
)
source=('git+https://github.com/patrickelectric/qhot.git')
sha1sums=(SKIP)

pkgver() {
  cd ${srcdir}/$_realname
  _ver="$(git describe  --tags | sed 's|^[vV]||' | sed 's|-g[0-9a-fA-F]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd ${srcdir}/${_realname}
  cmake -B build -DCMAKE_BUILD_TYPE=Release
  cmake --build build --parallel --config Release
  cat<<EOF > build/${_realname}.desktop 
[Desktop Entry]
Type=Application
Name=QHot
Comment=${pkgdesc}
Path=/opt/${pkgname}/
Exec=/usr/bin/${_realname}
Terminal=true
Categories=Qt;Utility;
EOF
}

package(){
  cd ${srcdir}/${_realname}/build

  mkdir -p "${pkgdir}/opt/" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/applications"
  cp src/${_realname} "${pkgdir}/usr/bin/${_realname}"
  cp "${_realname}.desktop" "${pkgdir}/opt/${pkgname}"

  ln -s "/opt/${pkgname}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
