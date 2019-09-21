# Maintainer: Dan McCurry <dan.mc at protonmail dot com>
# Contributer: Nikola Milinković <nikmil@gmail.com>
# Submitter: Stefan Husmann <stefan-husmann@t-online.de>

# If an unsupported java environment is set using archlinux-java,
# uncomment/edit the appropriate line in /usr/bin/jabref after
# installation.

pkgname=jabref-git
pkgver=5.0alpha.r141.gdb96f88659
pkgrel=1
pkgdesc="GUI frontend for BibTeX, written in Java -- built from git"
arch=('any')
url="https://www.jabref.org"
license=('MIT')
depends=('java-environment>=11')
makedepends=('git' 'java-environment=11' 'java11-openjfx')
optdepends=('gsettings-desktop-schemas: For web search support')
provides=('jabref')
conflicts=('jabref')
source=("${pkgname%-git}::git+https://github.com/JabRef/jabref.git"
	"${pkgname%-git}.desktop"
	"${pkgname%-git}.sh")
md5sums=('SKIP'
         '5f76feb6b2f66a2ea8b52bca999a934f'
         'b7c7fca66fe7e0a466df1f6b3c0539ff')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed 's+-alpha-+alpha.r+'|cut -c2-|tr - .
}

build() {
  cd ${pkgname%-git}
  ./gradlew assemble
  ./gradlew jlink
}


package() {
  install -d "${pkgdir}/opt"
  cp -R "${pkgname%-git}/build" "${pkgdir}/opt/jabref"
  install -D jabref.desktop "${pkgdir}/usr/share/applications/jabref.desktop"
  install -D jabref.png "${pkgdir}/usr/share/pixmaps/jabref.desktop"
}
