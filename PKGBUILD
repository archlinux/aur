_java_ver=26
_jdkname="zulu-${_java_ver}-fx"
_zulu_build="${_java_ver}.28.63-ca-fx"
pkgname="${_jdkname}-bin"
pkgver="${_java_ver}.0.0"
pkgrel=2
pkgdesc='Azul Zulu builds of OpenJDK are open source, TCK-tested and certified builds of OpenJDK.'
arch=('x86_64' 'aarch64')
url='https://www.azul.com/downloads/'
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
source_x86_64=("https://cdn.azul.com/zulu/bin/zulu${_zulu_build}-jdk${pkgver}-linux_x64.tar.gz")
source_aarch64=("https://cdn.azul.com/zulu/bin/zulu${_zulu_build}-jdk${pkgver}-linux_aarch64.tar.gz")
sha256sums_x86_64=('1bd70c1f0ccd2c5e01fa4b4791b1b4b42a9fd8f0a9a307c67f7ba0c9200f873b')
sha256sums_aarch64=('a7d3f16632e0706831b9071ff229d6c92b1e23749b0abe4980ad262c167af0d2')

_jvmdir="/usr/lib/jvm/${_jdkname}"

package() {
  if [ "${CARCH}" = "aarch64" ]; then
    cd "$srcdir/zulu${_zulu_build}-jdk${pkgver}-linux_aarch64"
  else
    cd "$srcdir/zulu${_zulu_build}-jdk${pkgver}-linux_x64"
  fi

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
