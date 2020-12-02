# Maintainer: Sam Guymer <sam at guymer dot me>

_jdkname=zulu-14
pkgname="${_jdkname}-bin"
_java_ver=14
_zulu_build="${_java_ver}.29.23-ca"
pkgver="${_java_ver}.0.2"
pkgrel=3
pkgdesc='Zulu Community builds of OpenJDK are fully certified and 100% open source Java Development Kits (JDKs) for all Java development and production workloads.'
arch=('x86_64')
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
_tarballname="zulu${_zulu_build}-jdk${pkgver}-linux_x64"
source=("https://cdn.azul.com/zulu/bin/${_tarballname}.tar.gz")
sha256sums=('7f4310a98ea0e52bacbec389012d859dbb51e759fe35a2cfebb11300271872d2')

_jvmdir="/usr/lib/jvm/${_jdkname}"

package() {
  cd "$srcdir/${_tarballname}"

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
