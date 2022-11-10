# Maintainer:Francois Menning <f.menning@pm.me>
# Contributor: Super Bo <supernbo at gmail dot com>
# Contributor: glider <samtron1412 {at} gmail {dot} com>
# Contributor: devopsdeluxe <dan.ray.beste@gmail.com>

_gitname='nerd-fonts'
pkgname='nerd-fonts-complete'
pkgver=2.2.2
pkgrel=2
pkgdesc='Iconic font aggregator, collection, & patcher. 3,600+ icons, 50+ patched fonts.'
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('MIT')
makedepends=('xorg-mkfontscale' 'xorg-bdftopcf' 'xorg-font-util')
conflicts=(
  'nerd-fonts-git'
  'nerd-fonts-complete-mono-glyphs'
)
provides=(
  'otf-nerd-fonts'
  'nerd-fonts-cascadia-code'
  'nerd-fonts-fantasque-sans-mono'
  'nerd-fonts-fira-code'
  'nerd-fonts-hack'
  'nerd-fonts-iosevka'
  'nerd-fonts-jetbrains-mono'
  'nerd-fonts-overpass'
  'nerd-fonts-roboto-mono'
  'nerd-fonts-source-code-pro'
  'nerd-fonts-terminus'
  'nerd-fonts-ubuntu-mono'
  'ttf-font-nerd'
  'ttf-iosevka-nerd'
  'ttf-terminus-nerd'
  'ttf-nerd-font'
  'ttf-nerd-fonts'
  'ttf-nerd-fonts-symbols'
  'ttf-nerd-fonts-symbols-mono'
)
source=(
  'fix-installer-font-dir.patch'
  "${_gitname}-${pkgver}.tar.gz::https://github.com/ryanoasis/nerd-fonts/archive/v${pkgver}.tar.gz"
)
sha256sums=('ccf93b108044a87bfb29c3f836d2ce4d5bdb1829702e532a69ccb4ab4aecaceb'
            'f008adbaa575a9ec55947f3a370c9610f281b91ff0b559b173b2702682d9dce8')

prepare () {
  cd "$srcdir/$_gitname-$pkgver"

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
