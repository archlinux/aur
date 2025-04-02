# Maintainer: witt <1989161762 at qq dot com>

pkgname=intellij-idea-community-edition-bin
_pkgname=${pkgname%-bin}
pkgver=2024.3.5
pkgrel=1
_buildver=243.26053.27
jbr_ver=21.0.6
jbr_build=aarch64-b895
jbr_minor=97
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
source_x86_64=("https://download.jetbrains.com/idea/ideaIC-$pkgver.tar.gz")
source_aarch64=("https://download.jetbrains.com/idea/ideaIC-$pkgver-aarch64.tar.gz"
                "https://cache-redirector.jetbrains.com/intellij-jbr/jbr-$jbr_ver-linux-$jbr_build.$jbr_minor.tar.gz"
                 "https://github.com/JetBrains/intellij-community/raw/master/bin/linux/aarch64/fsnotifier")
sha256sums=('01b90e7de9751c7fa7bc352023325be69c54fb4ed342173eeccaef59ad5e6f70'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('8a287528d830e6cdec2ded13c974c39a35b7555243c22d8b83113c96c26630aa')
sha256sums_aarch64=('43b3ac68c07b611baa12bd70adc188b7be81d79b0b3a232aad582df2ffeb2598'
                    '1ebdc9539b94280d2ea2b342c38818723529438ff7d656ed8680aec16e62f778'
                    'eb3c61973d34f051dcd3a9ae628a6ee37cd2b24a1394673bb28421a6f39dae29')

prepare() {
  # exit 1;
  # # Extract the JRE from the main pacakge
  [ -d "$srcdir/jbr" ] && rm -rf "$srcdir"/jbr

  # https://youtrack.jetbrains.com/articles/IDEA-A-48/JetBrains-IDEs-on-AArch64#linux
  if [ "${CARCH}" == "aarch64" ]; then
    cp -a "$srcdir/jbr-${jbr_ver}-linux-${jbr_build}.${jbr_minor}" "$srcdir"/jbr
    cp -f fsnotifier "$srcdir/idea-IC-$_buildver/bin/fsnotifier"
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
