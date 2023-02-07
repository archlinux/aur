# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=(grasscutter-git grasscutter-resources-git)
pkgver=1.4.6.70e448d
_pkgname=grasscutter
_commit=70e448d8bcc75f3ee04257d47f795bb07f6f9933
pkgrel=2
pkgdesc="A server software reimplementation for a certain anime game."
arch=('any')
url="https://github.com/Grasscutters/Grasscutter"
license=('AGPL3')
depends=('java-runtime-headless>=17')
makedepends=("java-environment>=17" 'gradle')
source=("$_pkgname::git+${url}#commit=${_commit}"
	"$_pkgname-resources.zip::https://git.crepe.moe/grasscutters/Grasscutter_Resources/-/raw/d3a5672a77180b7c74cb6c89422e0f6eed67a064/Grasscutter_Resources-3.3.zip?inline=false"
        "grasscutter-run")
b2sums=("SKIP"
        "1cb209f62db28c6e7a4651b77567d088dd578efccd59fd020c733e1b46b1acea6f85f403954044fe9db9a41bd537168e2f83692e023453dea5f6851f7548812e"
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
  cp -r "${srcdir}/Grasscutter_Resources-3.3/Resources" "${pkgdir}/usr/share/${_pkgname}/resources" 
}
