# Maintainer: Maddie Mewmews <maddie at mewmews gay>
# Contributor: Sam Guymer <sam at guymer dot me>
# Contributor: Michael Lass <bevan@bi-co.net> # 'provides' field

_java_ver=17
_jdkname="zing-${_java_ver}"
_zing_build="25.06.0.0"
_zing_weirdnumber="2"
pkgname="${_jdkname}-bin"
pkgver="${_java_ver}.0.15"
pkgrel=3
pkgdesc='Azul Platform Prime Stream Build (Formerly Zing) is a modern, TCK-compliant Java platform based on OpenJDK, free for development.'
arch=('x86_64' 'aarch64')
url='https://docs.azul.com/prime/prime-quick-start-tar'
license=('custom')
depends=(
  'java-environment-common>=3'
  'java-runtime-common>=3'
  'ca-certificates-utils'
  'libxi'
  'libxext'
  'libxrender'
  'libx11'
  'libxtst'
  'alsa-lib'
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
b2sums_aarch64=('e533ff6e625e29653a689005ca90d64eddb07259802230488c8a3c60be16c643b76917d4de192df375e4da18e36b483698aa78c454351fea1a9271b1e8b96d00')
b2sums_x86_64=('25284993c5b0e66e0591c6829af2822aa2881328dff4aaa2334a7d2c82a59ba7e8d7e79b9f4cb0c5d5d936039d29a29aaa308ab0952e72900818615d36057d0b')
b2sums=('3b6a74a57f9051db4d6e0803c770d064f3d7b7b281fc79dae012f9115ca9c0c81ccde4f307ed102121f8335b03239e1f5d7e52ecd8f1d8aebc1d69dc119a9a94')
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
