# Contributor: Sam Guymer <sam at guymer dot me>
# Maintainer: so1ar <so1ar114514@gmail.com>

_java_ver=17
_jdkname="zulu-jre-fx"
_zulu_build="${_java_ver}.34.19-ca"
_hmcl_ver=3.5.3
_hmcl_build=219
_jdk_ver=${_java_ver}.0.3
pkgname=hmcl-zulu-bin
pkgver=${_hmcl_ver}.${_hmcl_build}.zulu.${_jdk_ver}
pkgrel=1
pkgdesc="Hello Minecraft Launcher, with zulu openjdk included."
arch=('x86_64')
url='https://github.com/huanghongxun/HMCL'
license=('custom')
depends=(
  'java-runtime-common>=3'
  'ca-certificates-utils'
)
provides=(
  "java-runtime-headless=$_java_ver"
  "java-runtime-headless-openjdk=$_java_ver"
  "java-runtime=$_java_ver"
  "java-runtime-openjdk=$_java_ver"
  "java-openjfx=$_java_ver"
  "jre-openjdk=$_java_ver"
  "hmcl"
)
conflicts=('hmcl' 'zulu-jre-fx-bin')

install="$pkgname.install"
_tarballname="zulu${_zulu_build}-fx-jre${_jdk_ver}-linux_x64"
source=("hmcl.desktop"
        "hmcl-launch-script"
        "craft_table.png"
        "LICENSE::https://raw.githubusercontent.com/huanghongxun/HMCL/javafx/LICENSE"
        "${pkgname}-${pkgver}-${pkgrel}.jar::https://github.com/huanghongxun/HMCL/releases/download/v${_hmcl_ver}.${_hmcl_build}/HMCL-${_hmcl_ver}.${_hmcl_build}.jar"
        "https://cdn.azul.com/zulu/bin/${_tarballname}.tar.gz"
	"hmcl-zulu-bin.install")

sha256sums=('8f12b377b03124612da0127a95a6148bbc3e58894932d50408f4d3d179f0b9fb'
            '5f53d37fef37aa654e474a073f2457601c5fc607ba836f7b1404c89a07b196a3'
            '2989a1b5301b8c7b9afdae5696c6a4e5246afa2d4f1f3d3dad5c192f036a9b4c'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '3b15c6fc7466f41367f58c18f468894758240a8db096792a4d20a4aab9787a80'
            '4de47974610b21e708d7fef4455a1f769d8d80f24382fb6277c1167c5ce3e9ae'
            'b8d220e15b774407d9602d1e40dc896ecd9df26a3ff23a649367b5b566c7f930')

noextract=("${pkgname}-${pkgver}-${pkgrel}.jar")


_jvmdir="/usr/lib/jvm/${_jdkname}"

package() {
  # launcher
  install -Dm755 "hmcl-launch-script" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "hmcl.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}-${pkgver}-${pkgrel}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  install -Dm644 "craft_table.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
  install -Dm644 "LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  # jdk
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

#  # Man pages
#  for f in bin/*; do
#    f=$(basename "${f}")
#    _man=man/man1/"${f}.1"
#    test -f "${_man}" && install -Dm 644 "${_man}" "${pkgdir}/usr/share/man/man1/${f}-${_jdkname}.1"
#  done
#  rm -r "${pkgdir}/${_jvmdir}/man"
#  ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"

  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}/${_jvmdir}/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}/${_jvmdir}/lib/security/cacerts"
}
