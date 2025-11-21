# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
# Co-Maintainer: Urs Wolfer <uwolfer @ fwo.ch>


pkgname=intellij-idea-ultimate-edition
pkgver=2025.2.5
pkgrel=1
jbr_ver=21.0.6
jbr_build=aarch64-b895
jbr_minor=109
arch=('x86_64' 'aarch64')
pkgdesc="An intelligent IDE for Java, Groovy and other programming languages with advanced refactoring features intensely focused on developer productivity."
url="https://www.jetbrains.com/idea/"
license=('custom:commercial')
options=(!strip)
conflicts=(intellij-idea-ultimate-edition-jre)
provides=(intellij-idea-ultimate-edition-jre)
source=("jetbrains-idea.desktop")
source_x86_64=("https://download.jetbrains.com/idea/ideaIU-$pkgver.tar.gz")
source_aarch64=("https://download.jetbrains.com/idea/ideaIU-$pkgver-aarch64.tar.gz"
                "https://cache-redirector.jetbrains.com/intellij-jbr/jbr-$jbr_ver-linux-$jbr_build.$jbr_minor.tar.gz"
                 "fsnotifier-${pkgver}::https://github.com/JetBrains/intellij-community/raw/master/bin/linux/aarch64/fsnotifier")
sha256sums=('83af2ba8f9f14275a6684e79d6d4bd9b48cd852c047dacfc81324588fa2ff92b')
sha256sums_x86_64=('dc92cd3850ba256d2cb1c9d884f9579f613f6fa747f628361458d21f66687393')
sha256sums_aarch64=('6203b9dbc2461abc59604a7fb319d8e06948b2886489ae03499e98f4c1a0a57c'
                    '04fbf6d6a0e15f8bc0ae8ff9fdcf80995eb2ce6be1ef6f543618ba66d86498e5'
                    'aa812c5acac06435217b9018aa3e187a3546ea8d3cf136481a2d50aee4b9b23a')

prepare() {
  # Extract the JRE from the main pacakge
  if [ -d "$srcdir"/jbr ]; then
    rm -rf "$srcdir"/jbr
  fi

  # https://youtrack.jetbrains.com/articles/IDEA-A-48/JetBrains-IDEs-on-AArch64#linux
  if [ "${CARCH}" == "aarch64" ]; then
    cp -a "$srcdir"/jbr-${jbr_ver}-linux-${jbr_build}.${jbr_minor} "$srcdir"/jbr
    cp -f fsnotifier-${pkgver} "$srcdir"/idea-IU-*/bin/fsnotifier
    chmod +x "$srcdir"/idea-IU-*/bin/fsnotifier
    rm -rf "$srcdir"/idea-IU-*/jbr
  else
    mv "$srcdir"/idea-IU-*/jbr "$srcdir"/jbr
  fi
}

package_intellij-idea-ultimate-edition() {
  backup=("opt/${pkgname}/bin/idea64.vmoptions" "opt/${pkgname}/bin/idea.properties")
  depends=('giflib' 'libxtst' 'libxrender')
  optdepends=(
    'intellij-idea-ultimate-edition-jre: JetBrains custom JRE (Recommended)' 'java-environment: Required if intellij-idea-ultimate-edition-jre is not installed'
    'libdbusmenu-glib: For global menu support'
  )

  cd "$srcdir"

  install -d "$pkgdir"/{opt/$pkgname,usr/bin}
  mv idea-IU-*/* "$pkgdir"/opt/$pkgbase
  mv "$srcdir"/jbr "$pkgdir"/opt/$pkgbase

  # https://youtrack.jetbrains.com/issue/IDEA-185828
  chmod +x "$pkgdir"/opt/$pkgbase/plugins/maven/lib/maven3/bin/mvn

  ln -s /opt/$pkgname/bin/idea "$pkgdir"/usr/bin/$pkgname
  install -D -m644 "$srcdir"/jetbrains-idea.desktop "$pkgdir"/usr/share/applications/jetbrains-idea.desktop
  install -D -m644 "$pkgdir"/opt/$pkgbase/bin/idea.svg "$pkgdir"/usr/share/pixmaps/"$pkgname".svg

  # workaround FS#40934
  sed -i 's|lcd|on|'  "$pkgdir"/opt/$pkgname/bin/*.vmoptions
}

# vim:set ts=2 sw=2 et:
