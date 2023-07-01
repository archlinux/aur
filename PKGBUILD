# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: marazmista <marazmista@tuta.io>

pkgname=radeon-profile
_qtver=5
pkgver=2020.11.01
pkgrel=1
pkgdesc="App for display info about radeon card (snapshot)"
_ns="marazmista"
url="http://github.com/${_ns}/${pkgname}"
arch=(
  x86_64
  i686
  pentium4
  aarch64
  armv7h
  armv6l
)
license=('GPL2')
depends=(
  'libxkbcommon-x11'
  'libxrandr'
  "qt${_qtver}-base"
  "qt${_qtver}-charts"
)
makedepends=(
  # 'clang'
  # 'git'
  "qt${_qtver}-tools"
)
optdepends=(
  "${pkgname}-daemon: system daemon for reading card info"
  'sudo: start with root privilages without password'
  'mesa-demos: for glxinfo'
  'xorg-xdriinfo: display driver name'
  'xorg-xrandr: show card connected outputs'
  'xf86-video-ati: radeon open source driver'
  'xf86-video-amdgpu: amdgpu open source driver')
_commit="0fd5b8dd326957e6fa8afda2bba5fc4c48fd0de4"
source=(
  "${url}/archive/${_commit}.zip")
sha256sums=(
  '1e23b3615973899eab620f8fadf90119a251306e7299624ff356da4aa0bc62dc')

build() {
  local _lrelease _qmake_opts=()
  cd "${srcdir}/${pkgname}-${_commit}/${pkgname}"

  if [[ "${_qtver}" == 5 ]]; then
    _lrelease="/usr/bin/lrelease"
    _qmake="/usr/bin/qmake"
  elif [[ "${_qtver}" == 6 ]]; then
    _lrelease="/usr/lib/qt${_qtver}/lrelease"
    _qmake="/usr/bin/qmake6"
  fi

  CC="/usr/bin/gcc" \
  CXX="/usr/bin/g++" \
  "${_lrelease}" "${pkgname}.pro"
  CC="/usr/bin/gcc" \
  CXX="/usr/bin/g++" \
  _qmake_opts=(
    QMAKE_CFLAGS_RELEASE="${CFLAGS}"
    QMAKE_CXX_COMPILER="gcc"
    QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS} -std=c++17"
    CONFIG+=silent
  )

  "${_qmake}" "${_qmake_opts[@]}"
  CC="/usr/bin/gcc" \
  CXX="/usr/bin/g++" \
  make
}

package() {
  local _apps="${pkgdir}/usr/share/applications"
  local _pixmaps="${pkgdir}/usr/share/pixmaps"
  cd "${srcdir}/${pkgname}-${_commit}/${pkgname}"
  install -Dm755 "target/${pkgname}" \
                 "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "extra/${pkgname}.png" \
                 "${_pixmaps}/${pkgname}.png"
  install -Dm644 "extra/${pkgname}.desktop" \
                 "${_apps}/${pkgname}.desktop"

  cd translations
  for translation in *.qm
  do
    install -Dm644 "${translation}" \
            "$pkgdir/usr/share/${pkgname}/${translation}"
  done
}
