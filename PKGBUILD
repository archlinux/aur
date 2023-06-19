# Contributor:  Stefan Husmann <stefan-husmann@t-online.de>

pkgname=('texlive-minionpro-git' 'texlive-myriadpro-git')
pkgver=r134.165b4a7
pkgrel=4
pkgdesc="generate all necessary files to use Adobe Minion Pro and Adobe Myriad Pro with (pdf)latex."
arch=(any)
url="https://github.com/sebschub/FontPro.git"
license=(GPL)
depends=(texlive-fontutils texlive-plaingeneric texlive-latexextra)
makedepends=(git acroread-fonts-systemwide)
source=("git+https://github.com/sebschub/FontPro.git" minionpro.maps myriadpro.maps)
_gitname="FontPro"
md5sums=('SKIP'
         '1f8ded884e5d64eab0c5a31b87e31924'
         '88f9e84c9f4e8418fbbfa1cc3c534b93')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
  [[ -d "$_gitname"/otf ]] || mkdir "$_gitname"/otf
  for _i in /usr/share/fonts/OTF/{Min,Myr}*
  do cp $_i "$_gitname/otf/$(basename ${_i//_/-})" 
  done
}

package_texlive-minionpro-git() {
  provides=('minionpro')
  conflicts=('minionpro')
  cd "$_gitname"
  yes | ./scripts/makeall MinionPro
  yes | ./scripts/install "$pkgdir"/usr/share/texmf
  install -Dm644 $srcdir/minionpro.maps "$pkgdir"/var/lib/texmf/arch/installedpkgs/minionpro.maps
  echo "minionpro $(git rev-list --count HEAD)" > \
       "$pkgdir"/var/lib/texmf/arch/installedpkgs/${pkgname}_r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)-$pkgrel.pkgs
  install -Dm644 README.md "$pkgdir"/usr/share/licenses/"$pkgname"/README.md
  rm  $pkgdir/usr/share/texmf/ls-R
}

package_texlive-myriadpro-git() {
  provides=('myriadpro')
  conflicts=('myriadpro')
  cd "$_gitname"
  yes | ./scripts/makeall MyriadPro
  yes | ./scripts/install $pkgdir/usr/share/texmf
  install -Dm644 $srcdir/myriadpro.maps "$pkgdir"/var/lib/texmf/arch/installedpkgs/myriadpro.maps
  echo "myriadpro $(git rev-list --count HEAD)" > \
       "$pkgdir"/var/lib/texmf/arch/installedpkgs/${pkgname}_r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)-$pkgrel.pkgs
  install -Dm644 README.md "$pkgdir"/usr/share/licenses/"$pkgname"/README.md
  rm  $pkgdir/usr/share/texmf/ls-R
}

