# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
# Co-Maintainer: Urs Wolfer <uwolfer @ fwo.ch>


pkgname=intellij-idea-ultimate-edition
pkgver=2026.2.0.1
pkgrel=1
jbr_ver=25.0.3
jbr_build=aarch64-b508
jbr_minor=16
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
sha256sums_x86_64=('914e31e31b4e1285d538cf3fae5b300af08bcff36bc298ac6200504bbe12f180')
sha256sums_aarch64=('1e446106ad6f8758918ec8665fe0fd713d62491664fcd133e98913c1684a9748'
                    '8704ffff0723bbe00992a02e455cda6a76697b40f9a5b833fc853e3c3b05dd14'
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
  chmod +x "$pkgdir"/opt/$pkgbase/plugins/maven-plugin/lib/maven3/bin/mvn

  ln -s /opt/$pkgname/bin/idea "$pkgdir"/usr/bin/$pkgname
  ln -s /opt/$pkgname/bin/idea.sh "$pkgdir"/usr/bin/idea
  install -D -m644 "$srcdir"/jetbrains-idea.desktop "$pkgdir"/usr/share/applications/jetbrains-idea.desktop
  install -D -m644 "$pkgdir"/opt/$pkgbase/bin/idea.svg "$pkgdir"/usr/share/pixmaps/"$pkgname".svg

  # workaround FS#40934
  sed -i 's|lcd|on|'  "$pkgdir"/opt/$pkgname/bin/*.vmoptions
}

# vim:set ts=2 sw=2 et:
