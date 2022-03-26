# Maintainer: M0ustach3 <pablobondialuttiau@gmail.com>

# Should the man page be built ? yes or no. The help of this package is available on GitHub
_buildman="no"

_pkgname=merlin-server
pkgname=merlin-server-bin
pkgver=1.3.0
pkgrel=1
pkgdesc='Merlin is a cross-platform post-exploitation Command & Control server and agent written in Go'
arch=(x86_64)
url="https://github.com/Ne0nd0g/merlin"
license=('GPL3')
source=("https://github.com/Ne0nd0g/merlin/releases/download/v${pkgver}/merlinServer-Linux-x64.7z")
sha256sums=('0dfb581ed043749a0731d4be7decaabb24218b5aab27aebe0761976eef809b92')
makedepends=(p7zip)
depends=(glibc)
conflicts=("${pkgname}")

[[ "${_buildman}" == "yes" ]] && makedepends+=('python' 'python-sphinx' 'python-pip')

prepare(){
  cd "${srcdir}"
  7z -p"merlin" x merlinServer-Linux-x64.7z
}

build(){
  cd "${srcdir}"
  if [[ "${_buildman}" == "yes" ]]; then
    pip install sphinx_rtd_theme recommonmark
    pushd "docs"
    make man
    popd
  fi
}

package(){
  cd "${srcdir}"
  if [[ "${_buildman}" == "yes" ]]; then
    install -Dm644 "docs/_build/man/merlin.1" -t "${pkgdir}/usr/share/man/${_pkgname}"
  fi
  install -dm755 "${pkgdir}/opt/${_pkgname}"
  install -dm755 "${pkgdir}/opt/${_pkgname}/data"
  install -d "${pkgdir}/usr/bin"
  cp -r "data" "${pkgdir}/opt/${_pkgname}"
  install -Dm755 "merlinServer-Linux-x64" "${pkgdir}/opt/${_pkgname}"
  cat > "${pkgdir}/usr/bin/${_pkgname}" << EOF
#!/bin/sh
exec /opt/${_pkgname}/merlinServer-Linux-x64 "\$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/${_pkgname}"
}
