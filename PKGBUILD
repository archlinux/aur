# maintainer: BrainDamage
pkgname=helio-workstation
pkgver=3.11
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
sha256sums=('SKIP'
            'SKIP'
            'SKIP')
#FIXME: figure out how to use native packages for juce / hopscotchmap

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule init
  git config submodule.ThirdParty/HopscotchMap.url "${srcdir}/hopscotch-map"
  git config submodule.ThirdParty/JUCE.url "${srcdir}/JUCE"
  git -c protocol.file.allow=always submodule update
  # ugly hack since the makefile will override environment for those settings
  sed -i 's/JucePlugin_Build_VST=0/JucePlugin_Build_VST=1/' 'Projects/LinuxMakefile/Makefile'
  sed -i 's/JucePlugin_Build_VST3=0/JucePlugin_Build_VST3=1/' 'Projects/LinuxMakefile/Makefile'
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

