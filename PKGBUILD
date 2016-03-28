# Maintainer: John Gold <logol at logistician dot de>

_githost='github.com/atom'
_gitrep=atom
_pkgname=${_gitrep}
pkgname=${_pkgname}-git
pkgver=1.6.0
pkgrel=1
pkgdesc='The hackable text editor'
arch=('x86_64' 'armv7h')
url='https://atom.io/'
license=('custom:MIT')
groups=()
depends=('gconf' 'nodejs' 'python2' 'libgnome-keyring' 'desktop-file-utils' 'nss' 'alsa-lib' 'libxtst' 'gtk2' 'libnotify')
optdepends=()
makedepends=('git' 'sed' 'npm' 'ed' 'grep' 'findutils')
checkdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=()
backup=()
options=()
install=atom.install
changelog=
optdepends=()
source=("${pkgname}::git://${_githost}/${_gitrep}#branch=1.6-releases")
noextract=()
sha256sums=('SKIP')

pkgver () {
  cd "${srcdir}/${pkgname}"
  git describe --tags | sed -e 's?[[:alpha:]]\+??g' -e 's?-.*??'
}

build () {
  cd "${srcdir}/${pkgname}"
  export PYTHON=/usr/bin/python2
  export HOME="$PWD"
  echo "cache = $PWD/.atom/.npm" > build/.npmrc
  script/build --build-dir "${srcdir}/atom-build"
}

package () {
  cd "${srcdir}/${pkgname}"
  script/grunt install --build-dir "${srcdir}/atom-build" --install-dir "${pkgdir}/usr"
  install -Dm 644 "${srcdir}/${pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 "${srcdir}/${pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README"
  echo -e 'g/=/s/=.*usr/=\/usr/\nw' | ed -sv "${pkgdir}"/usr/share/applications/atom.desktop
  # fix shebang
  grep --color=never -rlZ -- '^#!.*python$' "${pkgdir}"/usr/share/atom/resources/app/apm/node_modules/npm/node_modules/node-gyp/gyp | xargs -0rx -I {} sh -c "echo -e 'g/^#!.*python$/s/python.*/python2/\nw' | ed -sv {}"
}
