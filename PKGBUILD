# Maintainer: Maddie Mewmews <maddie at mewmews gay>
# Contributor: Sam Guymer <sam at guymer dot me>
# Contributor: Michael Lass <bevan@bi-co.net> # 'provides' field

_java_ver=21
_jdkname="zing-${_java_ver}"
_zing_build="24.06.0.0"
_zing_weirdnumber="2"
pkgname="${_jdkname}-bin"
pkgver="${_java_ver}.0.3"
pkgrel=3
pkgdesc='Azul Platform Prime Stream Build (Formerly Zing) is a modern, TCK-compliant Java platform based on OpenJDK, free for development.'
arch=('x86_64' 'aarch64')
url='https://docs.azul.com/prime/prime-quick-start-tar'
license=('custom')
depends=(
  'java-environment-common>=3'
  'java-runtime-common>=3'
  'ca-certificates-utils'
)
provides=("java-runtime-headless=${_java_ver}"
          "java-runtime-headless-openjdk=${_java_ver}"
          "jre${_java_ver}-openjdk-headless=${pkgver}"
          "java-runtime=${_java_ver}"
          "java-runtime-openjdk=${_java_ver}"
          "jre${_java_ver}-openjdk=${pkgver}"
          "java-environment=${_java_ver}"
          "java-environment-openjdk=${_java_ver}"
          "jdk${_java_ver}-openjdk=${pkgver}"
          "jdk-openjdk=${pkgver}")
install="$pkgname.install"
source_aarch64=("https://cdn.azul.com/zing-zvm/ZVM${_zing_build}/zing${_zing_build}-${_zing_weirdnumber}-jdk${pkgver}-linux_aarch64.tar.gz")
source_x86_64=("https://cdn.azul.com/zing-zvm/ZVM${_zing_build}/zing${_zing_build}-${_zing_weirdnumber}-jdk${pkgver}-linux_x64.tar.gz")
#https://cdn.azul.com/zing-zvm/ZVM23.10.0.0/zing23.10.0.0-3-jdk21.0.1-linux_x64.tar.gz
#https://cdn.azul.com/zing-zvm/${_zulu_build}/zing${_zulu_build}-3-jdk${pkgver}-linux_x64.tar.gz
source=("${pkgname}.install")
b2sums_aarch64=('5dfcdf30b9598cc27e23af04688945367c2228b938077a6735f972b6f3f4a06c734d5aefec8dbc87c952df7601db29fc8ad574100b826b134951097bcaf6bf4e')
b2sums_x86_64=('bab9063cb40cf3a7f89f8ef1b2b3fd591b511a5916e52a14c2cef337338822aa39d7effbfd21c56e15880902fdb86bcc61f15d38bc39f8d918b52c040791480b')
b2sums=('2149bcde33dbdab799db449c67ec09cd73274f58dc356ebdd1a0ea89389bcb2be0f50ba52a07da2154c0da9aa39858fc215a3d222ddbf6fed31231d45cb0f77a')
_jvmdir="/usr/lib/jvm/${_jdkname}"

package() {
  if [ "${CARCH}" = "aarch64" ]; then
    cd "$srcdir/zing${_zing_build}-${_zing_weirdnumber}-jdk${pkgver}-linux_aarch64"
  else
    cd "$srcdir/zing${_zing_build}-${_zing_weirdnumber}-jdk${pkgver}-linux_x64"
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
