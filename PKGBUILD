# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=(grasscutter-git grasscutter-resources-git)
pkgver=1.4.6.8d09b88
_gcver=3.4
_pkgname=grasscutter
_commit=8d09b8833c216c5f0b12d854d0424c66699dfc05
pkgrel=2
pkgdesc="A server software reimplementation for a certain anime game."
arch=('any')
url="https://github.com/Grasscutters/Grasscutter"
license=('AGPL3')
depends=('java-runtime-headless>=17')
makedepends=("java-environment>=17" 'gradle')
source=("$_pkgname::git+${url}#commit=${_commit}"
	"$_pkgname-resources.tar.bz2::https://gitlab.com/YuukiPS/GC-Resources/-/archive/${_gcver}/GC-Resources-${_gcver}.tar.bz2"
        "grasscutter-run")
b2sums=("SKIP"
        "SKIP"
        "e9b4f7513617d040b41b4720fc611d1038f03ed2b4f86f9bf6276a43e3910e3cacbb7175a92ac068c6e57569c5ab145674b5a41aa9a74976db89a4cf68a7248e")

build() {
  cd "${_pkgname}"
  gradle clean jar
}

package_grasscutter-git() {
  provides=('grasscutter')
  conflicts=('grasscutter')
  depends=('java-runtime-headless>=17')
  optdepends=('grasscutter-resources: for game resources'
              'mongodb: for game database')
  install -Dm755 "grasscutter-run" "${pkgdir}/usr/bin/${_pkgname}"
  cd "${_pkgname}"
  _path=$(echo ./*.jar)
  install -Dm644 $_path "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}.jar"
}

package_grasscutter-resources-git() {
  options=('!strip')
  provides=('grasscutter-resources')
  conflicts=('grasscutter-resources')
  install -d "${pkgdir}/usr/share/${_pkgname}"
  cp -r "${srcdir}/GC-Resources-${_gcver}/Resources" "${pkgdir}/usr/share/${_pkgname}/resources" 
}
