# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: SoVerySour <gmaiadremailfeis22 at gmail dot com>

pkgname=infra-arcana-git
pkgver=22.0.0.beta3.r15.g5710b5dc
pkgrel=1
pkgdesc="Roguelike game inspired by the writings of H.P. Lovecraft - git version"
arch=('i686' 'x86_64')
url="https://sites.google.com/site/infraarcana/home"
license=('custom: Infra Arcana License' 'Apache')

depends=('sdl2_image' 'sdl2_mixer' 'hicolor-icon-theme')
makedepends=('git' 'cmake')
conflicts=('infra-arcana')
source=("git+https://gitlab.com/martin-tornqvist/ia.git"
	"infra-arcana.install"
	"infra-arcana.desktop"
	"infra-arcana.sh")

# Note:	install, desktop and sh file are taken from Infra-Arcana
# stable PKGBUILD.
# Credits goes to paskali here. Thanks!
# I modified them to work with infra-arcana-git specific part.

pkgver() {
  cd $srcdir/ia
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-48
}

build() {
  cd $srcdir/ia
  mkdir -p build && cd build
  git submodule init
  git submodule update
  cmake ..
  make ia
}

package() {
  cd $srcdir/ia
  
  # Using here Infra-Arcana stable PKGBUILD. Credits goes to paskali here.
  # I just tweaked the lines to make them work with the git version.
  
  #install licenses
  install -DTm644 "build/LICENSE.txt"\
  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  #install docs
  install -DTm644 "build/contact.txt" \
  "${pkgdir}/usr/share/doc/${pkgname}/contact.txt"
  install -DTm644 "build/credits.txt" \
  "${pkgdir}/usr/share/doc/${pkgname}/credits.txt"
  install -DTm644 "build/release_history.txt" \
  "${pkgdir}/usr/share/doc/${pkgname}/release_history.txt"
  # copy data
  mkdir -p "${pkgdir}/opt/${pkgname}/"
  cp -R build/audio "${pkgdir}/opt/${pkgname}/"
  cp -R build/data "${pkgdir}/opt/${pkgname}/"
  cp -R build/gfx "${pkgdir}/opt/${pkgname}/"
  cp build/manual.txt "${pkgdir}/opt/${pkgname}/"
  # copy main binary
  cp build/ia "${pkgdir}/opt/${pkgname}/"
  # this shell script is required as the compiled binary relies on
  # relative references
  install -Dm755 "../infra-arcana.sh" "${pkgdir}/usr/bin/${pkgname}"
  #install icon
  install -Dm644 "icon/icon.ico" \
  "$pkgdir/usr/share/icons/hicolor/128x128/apps/infra-arcana.png"
  install -Dm644 "${srcdir}/infra-arcana.desktop" \
  "$pkgdir/usr/share/applications/infra-arcana.desktop"
}
sha256sums=('SKIP'
            '3675cbaa28ce7e9e99271914f957cdbec942799aef0f88584cd99ddd642360d2'
            'a2a439114bca255464fb80e8221ec252437c87cfe1adddba6c95a6c86f43109d'
            '7d7b35aa75f204bce23b6629e20b4113c8ea19f3b67c415d4bba0389ea3ede59')
