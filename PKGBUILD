# $Id$
# Maintainer: Dan Elkouby <streetwalrus@codewalr.us>
# Contributor: Dan Elkouby <streetwalrus@codewalr.us>

pkgname=numix-themes-blue-git
pkgver=2.6.4.r6.c138b78
pkgrel=1
pkgdesc='A flat and light theme with a modern look and softer accents (GNOME, Openbox, Unity, Xfce)'
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
depends=('gtk-engine-murrine')
makedepends=('git' 'ruby-bundler' 'inkscape')
conflicts=('numix-themes-blue')
replaces=('numix-themes-blue')
source=("git+https://github.com/shimmerproject/Numix.git"
        "Gemfile")
sha256sums=('SKIP'
            'b1061ba7ce09c9eb3e41f59362aa8c21d27073b0658f13fb5eabdaea654afe2c')

pkgver() {
  cd Numix

  git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./'
}

prepare() {
  cd Numix/src

  # Kill it all
  orange=('f0544c' 'd64937' 'f1544d' 'f06860' 'fc6f5d')
  for FILE in $(find -type f)
  do
    for o in ${orange[@]}
    do
      sed -i "s/#${o}/#2d81e5/g" "${FILE}"
    done
  done

  cd assets
  rm -f *.png
  svg="all-assets.svg"
  for file in $(inkscape --query-all $svg | grep -Po "(?<=^EXP-).+?(?=,)")
  do
    inkscape $svg -i EXP-$file -e $file.png
  done
}

build() {
  cd Numix

  bundle install --path .
  make SASS="bundle exec sass"
}
package() {
  cd Numix

  install -dm 755 "$pkgdir"/usr/share/themes/Numix-Blue
  cp -dr --no-preserve='ownership' src/* "$pkgdir"/usr/share/themes/Numix-Blue/
}

# vim: ts=2 sw=2 et:
