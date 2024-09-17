# maintainer: BrainDamage
pkgname=helio-workstation
pkgver=3.14
pkgrel=1
pkgdesc="One music sequencer for all major platforms, desktop and mobile"
arch=('x86_64')
url="https://helio.fm/"
license=('GPL3')
depends=('curl' 'freetype2' 'libxinerama' 'libglvnd' 'alsa-lib')
makedepends=('git' 'libxrandr' 'libxcursor' 'libxcomposite' 'jack' 'freeglut' 'mdbook')
source=("git+https://github.com/helio-fm/${pkgname}#tag=${pkgver}"
  "git+https://github.com/peterrudenko/JUCE.git"
  "git+https://github.com/peterrudenko/hopscotch-map.git")
sha256sums=('4499f8e280364ae9e49535cad44bd51ea754b99e62c6eaef68eb5332a32c2fa4'
            'SKIP'
            'SKIP')
#FIXME: figure out how to use native packages for juce / hopscotchmap

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule init
  git config submodule.ThirdParty/HopscotchMap.url "${srcdir}/hopscotch-map"
  git config submodule.ThirdParty/JUCE.url "${srcdir}/JUCE"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${srcdir}/${pkgname}/Projects/LinuxMakefile"
  CONFIG=Release64 make
  cd "${srcdir}/${pkgname}/Docs"
  mdbook build -d '../doc-build' .
}

package() {
  cd "${srcdir}/${pkgname}/"
  install -Dvm755 "Projects/LinuxMakefile/build/helio" "${pkgdir}/usr/bin/helio"
  install -Dvm644 "Projects/Deployment/Linux/Debian/x64/usr/share/applications/Helio.desktop" "${pkgdir}/usr/share/applications/Helio.desktop"
  cd "${srcdir}/${pkgname}/Projects/Deployment/Linux/Debian/x64/usr/share/icons/"
  find . -exec install -Dvm 644 {} "${pkgdir}/usr/share/icons/{}" \;
  cd "${srcdir}/${pkgname}/doc-build"
  find . -not -name '.gitignore' -not -name '.nojekyll' -exec install -Dvm 644 {} "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
}

