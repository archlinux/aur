# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
_pkgname=pinesam
_gitname='PineSAM'
_githost='github.com'
_gituser='builder555'
pkgname="${_pkgname}-git"
pkgver=1.14.0+4.r593.20230507.caf2ad3
pkgrel=1
arch=(
  i686
  x86_64
  armv7h
  aarch64
)
pkgdesc="Configure and watch Pine64's 'pinecil' soldering iron via Bloetooth."
url="https://${_githost}/${_gituser}/${_gitname}"
license=('MIT')
depends=(
  'bash'
  'electron'
  'faketty'
  'nodejs'
  'python>=3'
  'python-bleak'
  'python-requests'
  'python-websockets'
  # 'python-pipenv'
)
makedepends=(
  'base-devel'
  'git'
  'npm'
)
optdepends=(
  "python-pip:    For /usr/lib/pinesam/backend/check_install.py"
  "python-pytest: For /usr/lib/pinesam/backend/{test_server,test_pinecil}.py"
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
install="${_pkgname}.install"
source=(
  "${_pkgname}::git+${url}.git"
  'pinesam.sh'
  "${install}"
)
sha256sums=(
  'SKIP'
  'c758f870c7a74a36584eaccdcae49a9a2b7d20237c4aa3ca88e84315f5f45df4'
  'babca43933247d6a2a28231f6ca8c5d52d4c9414c8ccad38d36045084d7f9a89'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > "${srcdir}/git.log"

  cd ui
  npm install --cache "${srcdir}/npm-cache"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|-g[0-9a-f]*$||' -e 's|-|+|g')"
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
  cd "${srcdir}/${_pkgname}"

  msg2 "Adding shabeng line to the backend server main script ..."
  sed -i '1i#!/usr/bin/python3' 'backend/main_server.py'

  cd ui
  msg2 "Downloading node dependencies ..."
  npm run --cache "${srcdir}/npm-cache" build
}

# check() {
#   cd "${srcdir}/${_pkgname}"
# }

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dvm644 'version.txt' "${pkgdir}/usr/lib/${_pkgname}/version.txt"
  install -dvm755 "${pkgdir}/usr/lib/${_pkgname}/backend"
  for _file in backend/*; do
    _target="$(basename "${_file}")"
    install -Dvm644 "${_file}" "${pkgdir}/usr/lib/${_pkgname}/backend/${_target}"
  done
  chmod 755 "${pkgdir}/usr/lib/${_pkgname}/backend/main_server.py"
  cp -rv ui "${pkgdir}/usr/lib/${_pkgname}/ui"
  install -Dvm755 "${srcdir}/pinesam.sh" "${pkgdir}/usr/bin/pinesam"

  # vite wants to create and write into '/usr/lib/pinesam/ui/node_modules/.vite'. Do on runtime create that directory in '/run', and already now create the corresponding symlink:
  ln -sv "/tmp/pinesam/.vite" "${pkgdir}/usr/lib/${_pkgname}/ui/node_modules/.vite"

  for _docfile in CHANGELOG.md CODE_OF_CONDUCT.md Readme.md SECURITY.md version.txt; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  cp -rv docs "${pkgdir}/usr/share/doc/${_pkgname}/docs"
  install -D -v -m644 "${srcdir}/git.log" "${pkgdir}/usr/share/doc/${_pkgname}/git.log"

  install -D -v -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "${pkgdir}/usr/share/doc/${_pkgname}"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
}
