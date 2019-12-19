# Maintainer: Dan McCurry <dan.mc at protonmail dot com>
# Contributer: Nikola Milinković <nikmil@gmail.com>
# Submitter: Stefan Husmann <stefan-husmann@t-online.de>

# If an unsupported java environment is set using archlinux-java,
# uncomment/edit the appropriate line in /usr/bin/jabref after
# installation.

pkgname=jabref-git
pkgver=5.0.beta.17.g44fdfa7ea9
pkgrel=1
epoch=1
pkgdesc="GUI frontend for BibTeX, written in Java -- built from git"
arch=('any')
url="https://www.jabref.org"
license=('MIT')
depends=('java-environment=13') # tested with  openjdk 13 from official repos
makedepends=('git')
optdepends=('gsettings-desktop-schemas: For web search support')
provides=('jabref')
conflicts=('jabref')
source=("${pkgname%-git}::git+https://github.com/JabRef/jabref.git"
	"${pkgname%-git}.desktop"
	"${pkgname%-git}.sh")
sha256sums=('SKIP'
            'cb50a38f701374e6922e74e35c4f99f0418441c48b3c4855e64f0995f0be9cb8'
            'f17e5184be3541c7c6f54516ee71e0935516c3f36f8c4ecf780999834f88fb0d')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed 's+-alpha-+alpha.r+'|cut -c2-|tr - .
}

prepare() {
  cd ${pkgname%-git}
  ./gradlew assemble
}

build() {
  cd ${pkgname%-git}
  ./gradlew jlink
}

package() {
  install -d "${pkgdir}/opt"
  cp -R ${pkgname%-git}/build/image "$pkgdir"/opt/jabref
  install -D jabref.desktop "$pkgdir"/usr/share/applications/jabref.desktop
  install -D ${pkgname%-git}/snap/gui/jabref.png "$pkgdir"/usr/share/pixmaps/jabref.png
  install -Dm755 "$srcdir"/jabref.sh "$pkgdir"/usr/bin/jabref  
}
