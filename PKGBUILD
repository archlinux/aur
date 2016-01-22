# Maintainer:  Caleb Maclennan <caleb@alerque.com>

_gitname=libertine
pkgname=otf-libertine-git
pkgver=6.1_0_g9ab9652
pkgrel=1
pkgdesc="a fork of the Linux Libertine and Linux Biolinum fonts with bugfixes and an OpenType math companion"
arch=('any')
url="https://github.com/khaledhosny/libertine"
license=('OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=("${_gitname}::git+https://github.com/khaledhosny/libertine.git#branch=master")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"
    git describe --long --tags | sed 's/^v//;s/-/_/g'
}

post_install() {
  echo -n "Updating font cache... "
  fc-cache -s >/dev/null
  mkfontscale /usr/share/fonts/OTF
  mkfontdir /usr/share/fonts/OTF
  echo "done."
}

post_upgrade() {
  post_install $1
}

post_remove() {
  post_install $1
}

package() {
  cd "${srcdir}/${_gitname}"
  find . -name '*.otf' -execdir install -Dm644 {} $pkgdir/usr/share/fonts/OTF/{} \;
  install -Dm644 "LICENCE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

