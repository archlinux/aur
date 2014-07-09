# Maintainer: Nick Østergaard <oe.nick at gmail dot com>
pkgname=kicad-pretty-git
pkgver=1
pkgrel=3
pkgdesc="KiCad .pretty repos. Theese are the new footprint library."
arch=('any')
url="https://github.com/KiCad"
license=('GPL')
makedepends=('git' 'curl')
options=('!strip')
install='kicad.install'
source=('https://raw.githubusercontent.com/KiCad/kicad-library/master/template/fp-lib-table.for-pretty')
md5sums=('SKIP')


package() {
  cd "$srcdir"
  msg "Fetching list of available pretty repos..."
  PRETTY_REPOS=`curl https://api.github.com/orgs/KiCad/repos?per_page=2000 2> /dev/null \
    | grep full_name | grep pretty \
    | sed -r  's:.+ "KiCad/(.+)",:\1:'`

  echo $PRETTY_REPOS
  
  # Fetching the pretty repos. This should possibly be a bit more
  # intelligent, such that it will remove orphaned repos.
  for repo in $PRETTY_REPOS; do
    if [ ! -e "$srcdir/$repo" ]; then
      msg "Cloning $repo"
      git clone "https://github.com/KiCad/$repo" "$srcdir/$repo"
    else
      msg "Updating $repo"
      cd "$srcdir/$repo"
      git pull
    fi
  done
  
  mkdir -p "$pkgdir/usr/share/kicad/footprints"
  
  for repo in $PRETTY_REPOS; do
    cp -r "$srcdir/$repo" "$pkgdir/usr/share/kicad/footprints"
  done
  
  mv $srcdir/fp-lib-table.for-pretty "$pkgdir/usr/share/kicad/footprints/fp-lib-table"

  mkdir -p "$pkgdir/etc/profile.d"
  echo "export KISYSMOD=/usr/share/kicad/footprints" > "$pkgdir/etc/profile.d/kicad-pretty-git.sh"
}

# vim:set ts=2 sw=2 et:
