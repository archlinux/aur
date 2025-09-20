# Maintainer: witt <1989161762 at qq dot com>

pkgname=intellij-idea-community-edition-bin
_pkgname=${pkgname%-bin}
pkgrel=1
_buildver=252.26199.169
_majorver=2025.2.2
pkgver="${_majorver}_${_buildver}"
jbr_ver=21.0.6
jbr_build=aarch64-b895
jbr_minor=109
arch=('x86_64' 'aarch64')
pkgdesc="an open-source IDE for Java, Groovy, Kotlin, Scala and Android development. "
url="https://www.jetbrains.com/idea/"
license=('Apache-2.0')
options=(!strip)
conflicts=('intellij-idea-community-edition-jre' 'intellij-idea-community-edition')
provides=('intellij-idea-community-edition' 'intellij-idea-community-edition-jre')
backup=("opt/${_pkgname}/bin/idea64.vmoptions" "opt/${_pkgname}/bin/idea.properties")
depends=('giflib' 'libxtst' 'libxrender')
optdepends=(
  # 'intellij-idea-ultimate-edition-jre: JetBrains custom JRE (Recommended)' 'java-environment: Required if intellij-idea-ultimate-edition-jre is not installed'
  'libdbusmenu-glib: For global menu support'
)
source=(
  "${_pkgname}.desktop"
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/JetBrains/intellij-community/refs/heads/master/LICENSE.txt"
)
source_x86_64=("https://download.jetbrains.com/idea/ideaIC-${_majorver}.tar.gz")
source_aarch64=("https://download.jetbrains.com/idea/ideaIC-${_majorver}-aarch64.tar.gz"
                "https://cache-redirector.jetbrains.com/intellij-jbr/jbr-$jbr_ver-linux-$jbr_build.$jbr_minor.tar.gz"
                 "fsnotifier-${pkgver}::https://github.com/JetBrains/intellij-community/raw/master/bin/linux/aarch64/fsnotifier")
sha256sums=('64746b03736aa97c0917ac8b96d135dae7891834b845e2b0b8442b1b5c2c48ab'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('3f1adc095bf78f0949e3f62f6cf02be0c5c9e6528271f16caa3baa041e637664')
sha256sums_aarch64=('3ea855820772e36be4b37dd9e503e4fee9b1877dcb614b5baa36819370fa0208'
                    '04fbf6d6a0e15f8bc0ae8ff9fdcf80995eb2ce6be1ef6f543618ba66d86498e5'
                    'aa812c5acac06435217b9018aa3e187a3546ea8d3cf136481a2d50aee4b9b23a')

prepare() {
  # # Extract the JRE from the main pacakge
  [ -d "$srcdir/jbr" ] && rm -rf "$srcdir"/jbr

  # https://youtrack.jetbrains.com/articles/IDEA-A-48/JetBrains-IDEs-on-AArch64#linux
  if [ "${CARCH}" == "aarch64" ]; then
    cp -a "$srcdir/jbr-${jbr_ver}-linux-${jbr_build}.${jbr_minor}" "$srcdir"/jbr
    cp -f "fsnotifier-${pkgver}" "$srcdir/idea-IC-$_buildver/bin/fsnotifier"
    chmod +x "$srcdir/idea-IC-$_buildver/bin/fsnotifier"
    rm -rf "$srcdir/idea-IC-$_buildver/jbr"
  else
    mv "$srcdir/idea-IC-$_buildver/jbr" "$srcdir"/jbr
  fi
}

package() {
  install -d "$pkgdir/opt/$_pkgname" "$pkgdir/usr/bin"
  mv "idea-IC-${_buildver}/"* "$pkgdir/opt/${_pkgname}"
  mv "$srcdir"/jbr "$pkgdir/opt/${_pkgname}"

  # https://youtrack.jetbrains.com/issue/IDEA-185828
  chmod +x "$pkgdir/opt/${_pkgname}/plugins/maven/lib/maven3/bin/mvn"

  ln -s "/opt/$_pkgname/bin/idea" "$pkgdir/usr/bin/$_pkgname"
  install -D -m644 "$srcdir/${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
  install -D -m644 "$pkgdir/opt/${_pkgname}/bin/idea.svg" "$pkgdir/usr/share/pixmaps/$_pkgname.svg"

  install -Dm644 "$srcdir/LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"

  # workaround FS#40934
  sed -i 's|lcd|on|'  "$pkgdir/opt/$_pkgname/bin/"*.vmoptions
}

# vim:set ts=2 sw=2 et:
