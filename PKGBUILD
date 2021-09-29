# Maintainer: Sajeev Ramasamy <thorion3006@gmail.com>
_gitname='nerd-fonts'
pkgname='nerd-fonts-complete-starship'
pkgver=2.1.0
pkgrel=1
pkgdesc='Iconic font aggregator, collection, & patcher. 3,600+ icons, 50+ patched fonts with fixed pkgconflicts for starship.'
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('MIT')
makedepends=('xorg-mkfontscale' 'xorg-bdftopcf' 'xorg-font-util')
conflicts=(
  'nerd-fonts-git'
  'nerd-fonts-complete-mono-glyphs'
  'nerd-fonts-complete'
)
provides=(
  'otf-nerd-fonts'
  'nerd-fonts-cascadia-code'
  'nerd-fonts-fantasque-sans-mono'
  'nerd-fonts-fira-code'
  'nerd-fonts-hack'
  'nerd-fonts-jetbrains-mono'
  'nerd-fonts-overpass'
  'nerd-fonts-roboto-mono'
  'nerd-fonts-source-code-pro'
  'nerd-fonts-terminus'
  'nerd-fonts-ubuntu-mono'
  'ttf-nerd-fonts'
  'ttf-nerd-fonts-symbols'
  'ttf-nerd-fonts-symbols-mono'
)
source=(
  'fix-installer-font-dir.patch'
  "${_gitname}-${pkgver}.tar.gz::https://github.com/ryanoasis/nerd-fonts/archive/v${pkgver}.tar.gz"
)
sha256sums=('ecef9d262591440b791080405d135939092d41408c747a6718940ea3a836c550'
            'a084ca91a174b547bab4523507824c76aa91ebcf38f9256a4ffd181813f87bd8')

prepare () {
  cd "$srcdir/$_gitname-$pkgver"

  rm -rf patched-fonts/Iosevka

  patch -Np1 -i "$srcdir"/fix-installer-font-dir.patch
}

build() {
  cd "$srcdir/$_gitname-$pkgver"

  bash install.sh \
    --clean \
    --otf \
    --complete
}

package() {
  cd "$srcdir/$_gitname-$pkgver"

  # Prepare destination directories
  libdir="${pkgdir}/usr/lib/${pkgname}"
  otfdir="${pkgdir}/usr/share/fonts/${pkgname}/OTF"
  ttfdir="${pkgdir}/usr/share/fonts/${pkgname}/TTF"

  install -dm755 "${libdir}"
  install -dm755 "${otfdir}"
  install -dm755 "${ttfdir}"

  # Install fonts
  install -m644 release/NerdFonts/*.otf "${otfdir}"
  install -m644 release/NerdFonts/*.ttf "${ttfdir}"

  # Install fontconfig
  install -dm755 "${pkgdir}/etc/fonts/conf.d"
  install -Dm644 "10-nerd-font-symbols.conf" "${pkgdir}/etc/fonts/conf.avail/10-nerd-font-symbols.conf"
  ln -s "../conf.avail/10-nerd-font-symbols.conf" "${pkgdir}/etc/fonts/conf.d/10-nerd-font-symbols.conf"

  # Install scripts
  install -m644 bin/scripts/lib/*.sh "${libdir}"

  # Install license
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
