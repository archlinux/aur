# Contributor: Sam Guymer <sam at guymer dot me>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_jdkname=zulu-15
pkgname="${_jdkname}-bin"
_java_ver=15
_zulu_build="${_java_ver}.46.17-ca"
pkgver="${_java_ver}.0.10"
pkgrel=1
pkgdesc='Zulu Community builds of OpenJDK are fully certified and 100% open source Java Development Kits (JDKs) for all Java development and production workloads.'
arch=('x86_64' 'aarch64')
url='https://www.azul.com/products/zulu-community/'
license=('custom')
depends=(
  'java-environment-common>=3'
  'java-runtime-common>=3'
  'ca-certificates-utils'
)
provides=(
  "java-environment=$_java_ver"
  "java-environment-openjdk=$_java_ver"
  "java-runtime-headless=$_java_ver"
  "java-runtime-headless-openjdk=$_java_ver"
  "java-runtime=$_java_ver"
  "java-runtime-openjdk=$_java_ver"
)
install="$pkgname.install"
_tarballbasename="zulu${_zulu_build}-jdk${pkgver}-linux"
source_x86_64=("https://cdn.azul.com/zulu/bin/${_tarballbasename}_x64.tar.gz")
source_aarch64=("https://cdn.azul.com/zulu/bin/${_tarballbasename}_aarch64.tar.gz")
sha256sums_x86_64=('b0323a49145dc7f1a2235d0b7fdb83c62f5c8404803d6baf5d2ea9544e8a554f')
sha256sums_aarch64=('109786f797c5b2d7841f394a3bc919b50a1ed9d24a3f2b5fbb2f1260dff72918')

_jvmdir="/usr/lib/jvm/${_jdkname}"

package() {
  declare -A archmap=(["x86_64"]="x64" ["aarch64"]="aarch64")
  cd "$srcdir/${_tarballbasename}_${archmap[$CARCH]}"

  install -dm 755 "${pkgdir}/${_jvmdir}"
  cp -a . "${pkgdir}/${_jvmdir}/"

  # based on java-openjdk package_jdk-openjdk
  # https://github.com/archlinux/svntogit-packages/blob/3f6aa8ddd98f728a9b0701288a933d16f0e8bbaf/trunk/PKGBUILD

  # Conf
  install -dm 755 "${pkgdir}/etc"
  cp -r conf "${pkgdir}/etc/${_jdkname}"
  rm -r "${pkgdir}/${_jvmdir}/conf"
  ln -s "/etc/${_jdkname}" "${pkgdir}/${_jvmdir}/conf"

  # Legal
  install -dm 755 "${pkgdir}/usr/share/licenses"
  cp -r legal "${pkgdir}/usr/share/licenses/${_jdkname}"
  rm -r "${pkgdir}/${_jvmdir}/legal"
  ln -s "/usr/share/licenses/${_jdkname}" "${pkgdir}/${_jvmdir}/legal"

  # Man pages
  for f in bin/*; do
    f=$(basename "${f}")
    _man=man/man1/"${f}.1"
    test -f "${_man}" && install -Dm 644 "${_man}" "${pkgdir}/usr/share/man/man1/${f}-${_jdkname}.1"
  done
  rm -r "${pkgdir}/${_jvmdir}/man"
  ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"

  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}/${_jvmdir}/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}/${_jvmdir}/lib/security/cacerts"
}
