# Maintainer: Maddie Mewmews <maddie at mewmews gay>
# Contributor: Sam Guymer <sam at guymer dot me>
# Contributor: Michael Lass <bevan@bi-co.net> # 'provides' field

_java_ver=21
_jdkname="zing-${_java_ver}"
_zing_build="24.12.0.0"
_zing_weirdnumber="6"
pkgname="${_jdkname}-bin"
pkgver="${_java_ver}.0.5"
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
b2sums_aarch64=('c9fb38b4f2ace422aab78671f916a7ea24e81fe8e320c88ffcd5825367e199855ece6fbbe7f74eb1f9185a0ad5949b8ad7c64d2d39201f7f7d5d0f087f251980')
b2sums_x86_64=('70d91fd8e16f261ad84ca14d0a8c6f810f6366fb3da2d8206549cf8270667fbf1ed611967427bd451c0612aacf2f3eeb327d45094c3d40f8319e80aa747e8689')
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
